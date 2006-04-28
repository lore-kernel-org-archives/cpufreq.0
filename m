From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: [PATCH] cpufreq {d,}printk adjustments
Date: Fri, 28 Apr 2006 13:47:13 +0200
Message-ID: <44521CE1.76E4.0078.0@novell.com>
References: <444F93E5.76E4.0078.0@novell.com> <20060426142741.GA30902@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S965205AbWD1LqX@vger.kernel.org>
In-Reply-To: <20060426142741.GA30902@isilmar.linta.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk
Cc: linux-kernel@vger.kernel.org

>> Convert some dprintk-s to printk-s as their use of KERN_* indicates they
>> were meant to be used that way. Alternatively, the KERN_* prefixes could
>> be removed and the dprintk-s then retained.
>
>For these ones, removing KERN_* and leaving them as dprintk() seems to be
>the better choice. The other two patches look fine to me.

Remove KERN_* suffixes from some cpufreq driver's dprintk-s.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

diff -Npru /home/jbeulich/tmp/linux-2.6.17-rc3/drivers/cpufreq/cpufreq.c
2.6.17-rc3-cpufreq-dprintk/drivers/cpufreq/cpufreq.c
--- /home/jbeulich/tmp/linux-2.6.17-rc3/drivers/cpufreq/cpufreq.c	2006-04-27 17:49:35.000000000 +0200
+++ 2.6.17-rc3-cpufreq-dprintk/drivers/cpufreq/cpufreq.c	2006-04-24 12:28:37.000000000 +0200
@@ -257,7 +257,7 @@ void cpufreq_notify_transition(struct cp
 		if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
 			if ((policy) && (policy->cpu == freqs->cpu) &&
 			    (policy->cur) && (policy->cur != freqs->old)) {
-				dprintk(KERN_WARNING "Warning: CPU frequency is"
+				dprintk("Warning: CPU frequency is"
 					" %u, cpufreq assumed %u kHz.\n",
 					freqs->old, policy->cur);
 				freqs->old = policy->cur;
@@ -874,7 +874,7 @@ static void cpufreq_out_of_sync(unsigned
 {
 	struct cpufreq_freqs freqs;
 
-	dprintk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
+	dprintk("Warning: CPU frequency out of sync: cpufreq and timing "
 	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
 
 	freqs.cpu = cpu;
@@ -1006,7 +1006,7 @@ static int cpufreq_suspend(struct sys_de
 		struct cpufreq_freqs freqs;
 
 		if (!(cpufreq_driver->flags & CPUFREQ_PM_NO_WARN))
-			dprintk(KERN_DEBUG "Warning: CPU frequency is %u, "
+			dprintk("Warning: CPU frequency is %u, "
 			       "cpufreq assumed %u kHz.\n",
 			       cur_freq, cpu_policy->cur);
 
@@ -1087,7 +1087,7 @@ static int cpufreq_resume(struct sys_dev
 			struct cpufreq_freqs freqs;
 
 			if (!(cpufreq_driver->flags & CPUFREQ_PM_NO_WARN))
-				dprintk(KERN_WARNING "Warning: CPU frequency"
+				dprintk("Warning: CPU frequency"
 				       "is %u, cpufreq assumed %u kHz.\n",
 				       cur_freq, cpu_policy->cur);
 

