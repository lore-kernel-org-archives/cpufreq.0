From: Alexander Clouter <alex@digriz.org.uk>
Subject: [patch 2/4] cpufreq_conservative: update and align of codebase
Date: Wed, 22 Mar 2006 08:59:10 +0000
Message-ID: <20060322085910.GB10689@inskipp.digriz.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751141AbWCVJEe@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
To: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org
Cc: venkatesh.pallipadi@intel.com, linux@dominikbrodowski.de, akpm@osdl.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The sensible approach to making conservative less responsive :) As mentioned
in patch [1/4].

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="02_cpufreq-samplingrate.diff"

--- linux-2.6.16/drivers/cpufreq/cpufreq_conservative.c.orig	2006-03-21 21:26:18.631603500 +0000
+++ linux-2.6.16/drivers/cpufreq/cpufreq_conservative.c	2006-03-21 21:27:58.333834500 +0000
@@ -509,7 +509,7 @@
 			if (latency == 0)
 				latency = 1;
 
-			def_sampling_rate = latency *
+			def_sampling_rate = 10 * latency *
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
 
 			if (def_sampling_rate < MIN_STAT_SAMPLING_RATE)

--CdrF4e02JqNVZeln--
