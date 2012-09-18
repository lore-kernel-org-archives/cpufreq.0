From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 3.6-rc6 1/2] workqueue: reimplement work_on_cpu() using
 system_wq
Date: Tue, 18 Sep 2012 13:49:34 -0700
Message-ID: <20120918204934.GG8474@google.com>
References: <20120917201721.GJ18677@google.com>
 <20120918201231.GF8474@google.com>
 <CA+55aFwt9Wd9cwk3B4U0+B+EyBJm8oG0r0ADQvEa0D4HmrMWQQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=+clq7F/LqyTip5L4njFFsAFZ1ioB5dyR6HvTM8RTxBQ=;
        b=jJqzF4TP2a8mTSQ+Xo570I1DWdsM5f2N1qG9YcMr4NuW52URT/8c7Xl5J1nsMZiAFE
         NDB9epdYYtKZp/TajMeCX16dwPFWMNfj8fHxP7TdB6EgbqD/i6wBTkbk1bNrX7T6GqkD
         XT5UsKPckj6IsZjFsPqCxj9J0yM/IDCLpKbemxPa8XXKgM1b1uL/G5MSx3WhOSkr2s14
         phVe9SBhvKReN8QztMNgsCINK64v2VhXUYONZcpdYurgGPwDzODMmIQ/fObYezM5zb76
         xiRbFsfSCAnuDWHYyP77NsoI0wIgGUJib0YjH2adzJiHsBAp0QzvRYPeT6+wU93r00P6
         PhSg==
Content-Disposition: inline
In-Reply-To: <CA+55aFwt9Wd9cwk3B4U0+B+EyBJm8oG0r0ADQvEa0D4HmrMWQQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Duncan <1i5t5.duncan@cox.net>, Andreas Herrmann <andreas.herrmann3@amd.com>, Jiri Kosina <jkosina@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>, Len Brown <lenb@kernel.org>

The existing work_on_cpu() implementation is hugely inefficient.  It
creates a new kthread, execute that single function and then let the
kthread die on each invocation.

Now that system_wq can handle concurrent executions, there's no
advantage of doing this.  Reimplement work_on_cpu() using system_wq
which makes it simpler and way more efficient.

stable: While this isn't a fix in itself, it's needed to fix a
        workqueue related bug in cpufreq/powernow-k8.  AFAICS, this
        shouldn't break other existing users.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Len Brown <lenb@kernel.org>
Cc: Rafael J. Wysocki <rjw@sisk.pl>
Cc: stable@vger.kernel.org
---
So, here are the two patches which can be applied to 3.6-rc6.  I'll
post a combined patch to the bugzilla so that Duncan can test it.

The only worrying thing is that this might affect the existing
work_on_cpu() users in some crazy subtle way.  I can't see how it
would break anything but it's when I think like that when something
bites me.  That said, pci-driver is probably the most common use case
and it seems to work fine here.

Thanks.

 kernel/workqueue.c |   27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3576,18 +3576,17 @@ static int __devinit workqueue_cpu_down_
 #ifdef CONFIG_SMP
 
 struct work_for_cpu {
-	struct completion completion;
+	struct work_struct work;
 	long (*fn)(void *);
 	void *arg;
 	long ret;
 };
 
-static int do_work_for_cpu(void *_wfc)
+static void work_for_cpu_fn(struct work_struct *work)
 {
-	struct work_for_cpu *wfc = _wfc;
+	struct work_for_cpu *wfc = container_of(work, struct work_for_cpu, work);
+
 	wfc->ret = wfc->fn(wfc->arg);
-	complete(&wfc->completion);
-	return 0;
 }
 
 /**
@@ -3602,19 +3601,11 @@ static int do_work_for_cpu(void *_wfc)
  */
 long work_on_cpu(unsigned int cpu, long (*fn)(void *), void *arg)
 {
-	struct task_struct *sub_thread;
-	struct work_for_cpu wfc = {
-		.completion = COMPLETION_INITIALIZER_ONSTACK(wfc.completion),
-		.fn = fn,
-		.arg = arg,
-	};
-
-	sub_thread = kthread_create(do_work_for_cpu, &wfc, "work_for_cpu");
-	if (IS_ERR(sub_thread))
-		return PTR_ERR(sub_thread);
-	kthread_bind(sub_thread, cpu);
-	wake_up_process(sub_thread);
-	wait_for_completion(&wfc.completion);
+	struct work_for_cpu wfc = { .fn = fn, .arg = arg };
+
+	INIT_WORK_ONSTACK(&wfc.work, work_for_cpu_fn);
+	schedule_work_on(cpu, &wfc.work);
+	flush_work(&wfc.work);
 	return wfc.ret;
 }
 EXPORT_SYMBOL_GPL(work_on_cpu);
