From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] speedstep: clean up interrupt disabling (was: linux-next:
 build failure after merge of the tip tree)
Date: Thu, 16 Jan 2014 14:33:02 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401161238270.16143@file01.intranet.prod.int.rdu2.redhat.com>
References: <20140114142627.537a702607e703c6eff63640@canb.auug.org.au> <20140114141406.GD7572@laptop.programming.kicks-ass.net> <alpine.LRH.2.02.1401141400030.19206@file01.intranet.prod.int.rdu2.redhat.com> <20140114200547.GM7572@laptop.programming.kicks-ass.net>
 <alpine.LRH.2.02.1401141629520.19206@file01.intranet.prod.int.rdu2.redhat.com> <20140116121415.GP31570@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20140116121415.GP31570@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org



On Thu, 16 Jan 2014, Peter Zijlstra wrote:

> > >  		retry++;
> > >  		__asm__ __volatile__(
> > > @@ -217,6 +220,7 @@ static void speedstep_set_state(unsigned int state)
> > >  
> > >  	/* enable IRQs */
> > >  	local_irq_restore(flags);
> > > +	preempt_enable();
> > >  
> > >  	if (new_state == state)
> > >  		pr_debug("change to %u MHz succeeded after %u tries "
> > 
> > You need also preempt_disable/enable in speedstep_get_freqs.
> 
> Argh I see, this is really horrid.
> 
> 
> Anyway, its Rafael's call, its his subsystem he gets to fix it when it
> explodes.
> 
> /me shudders

speedstep_get_freqs disables the interrupts to measure the transition 
latency. It is called from speedstep-ich.c (that requires the latency) and 
from speedstep-smi.c (that passes NULL as a pointer to latency, because it 
doesn't need it).

So, you could disable interrupts in speedstep_get_freqs only when the 
transition_latency pointer is non-NULL.

I think speedstep_set_state doesn't need to disable interrupts at all - 
all that it does is one "out" instruction, you don't need to synchronize 
that "out" instruction with anything, so there is no need to disable 
interrupts. Or - does some specification say that interrupts must be 
disabled there?

I am sending this patch to clean up the mess to be applied on the top of 
my previous patch.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>
Subject: speedstep: clean up interrupt disabling

This patch cleans up interrupt disabling in speedstep-smi and
speedstep-lib.

speedstep_get_freqs in speedstep-lib may be called from speedstep-smi or
speedstep-ich. When it is called from speedstep-ich, it needs to calculate
transition latency. When it is called from speedstep-smi, transition
latency doesn't have to be calculated.

The function speedstep_set_state in speedstep-smi needs to enable
interrupts. Previously it enabled interrupts even if it was called with
disabled interrupts, but it is dirty.

This patch changes speedstep_get_freqs so that it disables interrupts only
when it is called from speedstep-ich and when it is measuring the
transition latency. This avoids much of the code dirtiness.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/cpufreq/speedstep-lib.c |   13 ++++++-------
 drivers/cpufreq/speedstep-smi.c |   11 ++++-------
 2 files changed, 10 insertions(+), 14 deletions(-)

Index: linux-3.4.75/drivers/cpufreq/speedstep-lib.c
===================================================================
--- linux-3.4.75.orig/drivers/cpufreq/speedstep-lib.c	2014-01-16 18:51:16.000000000 +0100
+++ linux-3.4.75/drivers/cpufreq/speedstep-lib.c	2014-01-16 18:51:22.000000000 +0100
@@ -400,9 +400,6 @@ unsigned int speedstep_get_freqs(enum sp
 
 	pr_debug("previous speed is %u\n", prev_speed);
 
-	preempt_disable();
-	local_irq_save(flags);
-
 	/* switch to low state */
 	set_state(SPEEDSTEP_LOW);
 	*low_speed = speedstep_get_frequency(processor);
@@ -414,15 +411,19 @@ unsigned int speedstep_get_freqs(enum sp
 	pr_debug("low speed is %u\n", *low_speed);
 
 	/* start latency measurement */
-	if (transition_latency)
+	if (transition_latency) {
+		local_irq_save(flags);
 		do_gettimeofday(&tv1);
+	}
 
 	/* switch to high state */
 	set_state(SPEEDSTEP_HIGH);
 
 	/* end latency measurement */
-	if (transition_latency)
+	if (transition_latency) {
 		do_gettimeofday(&tv2);
+		local_irq_restore(flags);
+	}
 
 	*high_speed = speedstep_get_frequency(processor);
 	if (!*high_speed) {
@@ -464,8 +465,6 @@ unsigned int speedstep_get_freqs(enum sp
 	}
 
 out:
-	local_irq_restore(flags);
-	preempt_enable();
 
 	return ret;
 }
Index: linux-3.4.75/drivers/cpufreq/speedstep-smi.c
===================================================================
--- linux-3.4.75.orig/drivers/cpufreq/speedstep-smi.c	2014-01-16 18:51:16.000000000 +0100
+++ linux-3.4.75/drivers/cpufreq/speedstep-smi.c	2014-01-16 18:51:22.000000000 +0100
@@ -180,16 +180,16 @@ static int speedstep_get_state(void)
 static void speedstep_set_state(unsigned int state)
 {
 	unsigned int result = 0, command, new_state, dummy;
-	unsigned long flags;
 	unsigned int function = SET_SPEEDSTEP_STATE;
 	unsigned int retry = 0;
 
 	if (state > 0x1)
 		return;
 
-	/* Disable IRQs */
+	WARN_ON_ONCE(irqs_disabled());
+
+	/* Disable preemption so that other processes don't run */
 	preempt_disable();
-	local_irq_save(flags);
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
@@ -209,9 +209,7 @@ static void speedstep_set_state(unsigned
 			 */
 			pr_debug("retry %u, previous result %u, waiting...\n",
 					retry, result);
-			local_irq_enable();
 			mdelay(retry * 50);
-			local_irq_disable();
 		}
 		retry++;
 		__asm__ __volatile__(
@@ -226,8 +224,7 @@ static void speedstep_set_state(unsigned
 			);
 	} while ((new_state != state) && (retry <= SMI_TRIES));
 
-	/* enable IRQs */
-	local_irq_restore(flags);
+	/* enable preemption */
 	preempt_enable();
 
 	if (new_state == state)
