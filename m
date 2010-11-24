From: Borislav Petkov <bp@alien8.de>
Subject: Re: Missing "unregister_cpu_notifier" in powernow-k8.c
Date: Wed, 24 Nov 2010 10:02:28 +0100
Message-ID: <20101124090228.GA17766@liondog.tnic>
References: <20101124112801.78830fba@notabene.brown>
 <20101124021938.GB1987@redhat.com>
 <20101124023124.GD1987@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1290589351; bh=HcKh6282pDPzTyIeLBYIo5FNc8vh8fXsAfY135JYUYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=lYLe+mzUWT4KjTs2O/7ivjnzOhxF9uRzF+lJ4+
	crRw6xFfvUARZrs15/yQ0s2akHmeB/iegkMk59SCv6bDlbpHVD07IWwZ7NbOPJktl2h
	GMZUXkKRMNS+fQ1cK7BabN6QUQTcaC13NTy5hZVBMKEz4DGGUiqedwMcoDOVK2r2fM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1290589350; bh=HcKh6282pDPzTyIeLBYIo5FNc8vh8fXsAfY135JYUYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=cjLPYuKeyQuIQlzo09geSAHGqCrlzWeHBW7vZv
	IEmUFoKhmOtUpLctUjctatRcnYS+8G7vwrjEau2yopfoJ4rJEkR8fExQj8y12jNC7kW
	JprqIpI7j2U1n5sD3l259bZ8KiQX7CdxKxYT+GwA+gwsrHBquzV5/E+8oRkLMXp5lc=
Content-Disposition: inline
In-Reply-To: <20101124023124.GD1987@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Neil Brown <neilb@suse.de>, x86@kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: borislav.petkov@amd.com

On Tue, Nov 23, 2010 at 09:31:24PM -0500, Dave Jones wrote:
> On Tue, Nov 23, 2010 at 09:19:38PM -0500, Dave Jones wrote:
>  >  The following might be a partial fix, but I suspect there is probably other
>  >  clean-up that is needed.
> 
> Indeed, looks like another possible leak in the unlikely event that the
> percpu msr struct can't be allocated..
> Instead of adding an unregister on fail, I think we can just move the registration later.

Oops, that would be partly my fault, sorry. How about the following
instead, with proper exit path labels as it is done in other kernel
code?

  [ It is not yet tested but I'll give it a run later on my X6 to verify ]


Thanks.
--
From: Borislav Petkov <borislav.petkov@amd.com>
Date: Wed, 24 Nov 2010 09:51:09 +0100
Subject: [PATCH] x86, powernow-k8: Fix exit path

When Cool'n'Quiet is disabled in the BIOS we're missing _PSS
objects and powernow-k8 fails loading with a juicy firmware bug
message. However, on machines with boosting cpus, it forgets
to unreg from the cpu notifier chain leading to oops. See also
https://bugzilla.novell.com/show_bug.cgi?id=655215

Fix error path accordingly.

Originally-by: Neil Brown <neilb@suse.de>
Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
---
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 491977b..bdeb5f9 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1537,6 +1537,7 @@ static struct notifier_block cpb_nb = {
 static int __cpuinit powernowk8_init(void)
 {
 	unsigned int i, supported_cpus = 0, cpu;
+	int err = 0;
 
 	for_each_online_cpu(i) {
 		int rc;
@@ -1557,10 +1558,11 @@ static int __cpuinit powernowk8_init(void)
 
 		register_cpu_notifier(&cpb_nb);
 
+		err = -ENOMEM;
 		msrs = msrs_alloc();
 		if (!msrs) {
 			printk(KERN_ERR "%s: Error allocating msrs!\n", __func__);
-			return -ENOMEM;
+			goto unreg;
 		}
 
 		rdmsr_on_cpus(cpu_online_mask, MSR_K7_HWCR, msrs);
@@ -1574,7 +1576,15 @@ static int __cpuinit powernowk8_init(void)
 			(cpb_enabled ? "on" : "off"));
 	}
 
-	return cpufreq_register_driver(&cpufreq_amd64_driver);
+	err = cpufreq_register_driver(&cpufreq_amd64_driver);
+	if (!err)
+		goto out;
+
+unreg:
+	if (cpb_capable)
+		unregister_cpu_notifier(&cpb_nb);
+out:
+	return err;
 }
 
 /* driver entry point for term */
@@ -1582,7 +1592,7 @@ static void __exit powernowk8_exit(void)
 {
 	dprintk("exit\n");
 
-	if (boot_cpu_has(X86_FEATURE_CPB)) {
+	if (cpb_capable) {
 		msrs_free(msrs);
 		msrs = NULL;
 
-- 
1.7.2.3



-- 
Regards/Gruss,
    Boris.
