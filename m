From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix double "out-of-sync" warning on resume [Was: Re:
	cpufreq doesn't keep over suspend/resume]
Date: Thu, 1 Jul 2004 10:36:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701083601.GA8163@dominikbrodowski.de>
References: <20040614191225.GA1463@fog.sekrit.org>
	<20040614202539.GA10796@dominikbrodowski.de>
	<20040615013242.GA13338@fog.sekrit.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040615013242.GA13338@fog.sekrit.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, Gerald Britton <gbritton@alum.mit.edu>
Cc: cpufreq@www.linux.org.uk

- Rephrase "out-of-sync" warning (partly) based upon Gerald Britton's suggestion
- Also update cpufreq's opinion of current cpu frequency upon resume, else the
  "out-of-sync" warning will appear twice. Thanks to Gerald Britton for noting this.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 drivers/cpufreq/cpufreq.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-07-01 10:09:24.912587904 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-07-01 10:15:13.774552824 +0200
@@ -617,8 +617,8 @@
 			if (cpufreq_driver->flags & CPUFREQ_PANIC_RESUME_OUTOFSYNC)
 				panic("CPU Frequency is out of sync.");
 
-			printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing"
-			       "core thinks of %u, is %u kHz.\n", cpu_policy->cur, cur_freq);
+			printk(KERN_WARNING "Warning: CPU frequency is %u, "
+			       "cpufreq assumed %u kHz.\n", cur_freq, cpu_policy->cur);
 
 			freqs.cpu = cpu;
 			freqs.old = cpu_policy->cur;
@@ -626,6 +626,8 @@
 
 			notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_RESUMECHANGE, &freqs);
 			adjust_jiffies(CPUFREQ_RESUMECHANGE, &freqs);
+
+			cpu_policy->cur = cur_freq;
 		}
 	}
 
@@ -1065,9 +1067,8 @@
 				if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
 					panic("CPU Frequency is out of sync.");
 
-				printk(KERN_WARNING "Warning: CPU frequency out of sync: "
-				       "cpufreq and timing core thinks of %u, is %u kHz.\n", 
-				       cpufreq_cpu_data[freqs->cpu]->cur, freqs->old);
+				printk(KERN_WARNING "Warning: CPU frequency is %u, "
+				       "cpufreq assumed %u kHz.\n", freqs->old, cpufreq_cpu_data[freqs->cpu]->cur);
 				freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
 			}
 		}
