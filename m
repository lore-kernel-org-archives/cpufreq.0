From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] speedstep-smi: enable interrupts when waiting
Date: Wed, 11 Dec 2013 19:55:40 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1312111954320.25512@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1312111937570.23022@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1312111938370.23022@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1312111938580.23022@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1312111938580.23022@file01.intranet.prod.int.rdu2.redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Dell Latitude C600 laptop with Pentium 3 850MHz processor, the
speedstep-smi driver sometimes loads and sometimes doesn't load with
"change to state X failed" message.

I found out that we need to enable interrupts while waiting. When we
enable interrupts, the blockage that prevents frequency transition
resolves and the transition is possible. With disabled interrupts, the
blockage doesn't resolve (no matter how long do we wait).

This patch enables interrupts in the function speedstep_set_state that can
be called with disabled interrupts. However, this function is called with
disabled interrupts only from speedstep_get_freqs, so it shouldn't cause
any problem.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com
Cc: stable@kernel.org

---
 drivers/cpufreq/speedstep-lib.c |    1 +
 drivers/cpufreq/speedstep-smi.c |   13 +++++++++++++
 2 files changed, 14 insertions(+)

Index: linux-3.13-rc3/drivers/cpufreq/speedstep-smi.c
===================================================================
--- linux-3.13-rc3.orig/drivers/cpufreq/speedstep-smi.c	2013-12-12 01:32:37.769060946 +0100
+++ linux-3.13-rc3/drivers/cpufreq/speedstep-smi.c	2013-12-12 01:42:29.240216311 +0100
@@ -200,7 +200,19 @@ static void speedstep_set_state(unsigned
 		if (retry) {
 			pr_debug("retry %u, previous result %u, waiting...\n",
 					retry, result);
+			/*
+			 * We need to enable interrupts, otherwise the blockage
+			 * won't resolve.
+			 *
+			 * We disable preemption so that other processes don't
+			 * run. If other processes were running, they could
+			 * submit more DMA requests, making the blockage worse.
+			 */
+			preempt_disable();
+			local_irq_enable();
 			mdelay(retry * 50);
+			local_irq_disable();
+			preempt_enable_no_resched();
 		}
 		retry++;
 		__asm__ __volatile__(
@@ -217,6 +229,7 @@ static void speedstep_set_state(unsigned
 
 	/* enable IRQs */
 	local_irq_restore(flags);
+	preempt_check_resched();
 
 	if (new_state == state)
 		pr_debug("change to %u MHz succeeded after %u tries "
Index: linux-3.13-rc3/drivers/cpufreq/speedstep-lib.c
===================================================================
--- linux-3.13-rc3.orig/drivers/cpufreq/speedstep-lib.c	2013-10-18 20:24:16.000000000 +0200
+++ linux-3.13-rc3/drivers/cpufreq/speedstep-lib.c	2013-12-12 01:42:41.435120321 +0100
@@ -464,6 +464,7 @@ unsigned int speedstep_get_freqs(enum sp
 
 out:
 	local_irq_restore(flags);
+	preempt_check_resched();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(speedstep_get_freqs);
