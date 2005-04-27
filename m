From: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 08:25:12 -0400
Message-ID: <426F84A8.7040000@alumni.clemson.edu>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050427105350.GX2298@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

Thank you very much for your imput.  I will make those adjustments in 
the next patch.  The temperature was obtained by reading 
/proc/acpi/thermal_zone/THM/temperature  for a usermode daemon. 

The primary problem I see with integrating this code as part of 
userspace is the fact that userspace can be a module.  This code 
includes the addition of a function call in the schedule() function:

*diff -Nur linux-2.6.11.6/kernel/sched.c linux-sysfs/kernel/sched.c
--- linux-2.6.11.6/kernel/sched.c	2005-03-25 22:28:26.000000000 -0500
+++ linux-sysfs/kernel/sched.c	2005-04-06 22:55:33.000000000 -0400
@@ -2822,6 +2822,12 @@
 	prev = current;
 	if (unlikely(reacquire_kernel_lock(prev) < 0))
 		goto need_resched_nonpreemptible;
+	/*
+	 * Put thermal stuff here
+	 */
+	#ifdef CONFIG_CPU_FREQ_GOV_TEMPSCALE
+		scale_proc_freq(next, TASK_INTERACTIVE(next));
+	#endif
 	preempt_enable_no_resched();
 	if (unlikely(test_thread_flag(TIF_NEED_RESCHED)))
 		goto need_resched;
*


If the tempscale code were pulled out of the kernel (via rmmod), I think 
that would invalidate the call.  A second problem would be that the call 
would not be valid prior to module loading.  I have not been able to 
come up with any workarounds for this.  Are you aware of any?


Bruno Ducrot wrote:

>Hi,
>
>On Tue, Apr 26, 2005 at 07:39:29PM -0400, Mark Bidewell wrote:
>  
>
>>I am attaching a Linux kernel patch which supplies a new CPUFreq governor
>>for the CPUFreq interface.  It allows a user or daemon to reduce the
>>thermal output of a mobile processor by reducing the frequency at which
>>non-interactive processes are run.  It has been extensively tested on the
>>2.6.11.x kernels on a P4-M 3.2 GHz machine.
>>    
>>
>
>BTW how temperature is computed?
>
>I dont see any difference (apart the fact that you are setting frequency
>only for non-interactive processes) with the userspace governor.  If
>really you have to get this feature, I think you should consider to
>modify the userspace governor.
>
>
>  
>
