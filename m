From: Nick Orlov <bugfixer@list.ru>
Subject: Re: [PATCH 2.6.18-rc6-mm1 1/2] cpufreq: make it harder for cpu to
 leave "hot" mode
Date: Mon, 11 Sep 2006 23:30:34 -0400
Message-ID: <20060912033034.GB3677@nickolas.homeunix.com>
References: <20060912032924.GA3677@nickolas.homeunix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964872AbWILDag@vger.kernel.org>
In-reply-to: <20060912032924.GA3677@nickolas.homeunix.com>
Content-disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk
Cc: Andrew Morton <akpm@osdl.org>, Dave Jones <davej@codemonkey.org.uk>

From: Nick Orlov <bugfixer@list.ru>

Make hysteresis wider (20% instead of 10).

Signed-off-by: Nick Orlov <bugfixer@list.ru>

--- linux-2.6.18-rc6/drivers/cpufreq/cpufreq_ondemand.c	2006-09-11 21:22:50.000000000 -0400
+++ linux-2.6.18-rc6-mm1-nick/drivers/cpufreq/cpufreq_ondemand.c	2006-09-11 20:49:10.000000000 -0400
@@ -25,7 +25,7 @@
  */
 
 #define DEF_FREQUENCY_UP_THRESHOLD		(80)
-#define MIN_FREQUENCY_UP_THRESHOLD		(11)
+#define MIN_FREQUENCY_UP_THRESHOLD		(21)
 #define MAX_FREQUENCY_UP_THRESHOLD		(100)
 
 /*
@@ -290,12 +315,12 @@
 	/*
 	 * The optimal frequency is the frequency that is the lowest that
 	 * can support the current CPU usage without triggering the up
-	 * policy. To be safe, we focus 10 points under the threshold.
+	 * policy. To be safe, we focus 20 points under the threshold.
 	 */
-	if (load < (dbs_tuners_ins.up_threshold - 10)) {
+	if (load < (dbs_tuners_ins.up_threshold - 20)) {
 		unsigned int freq_next;
 		freq_next = (policy->cur * load) /
-			(dbs_tuners_ins.up_threshold - 10);
+			(dbs_tuners_ins.up_threshold - 20);
 
 		__cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATION_L);
 	}
_

-- 
With best wishes,
	Nick Orlov.
