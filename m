From: Alexander Clouter <alex@digriz.org.uk>
Subject: [patch 2/4 MKII] cpufreq_conservative: alter default responsiveness
Date: Wed, 22 Mar 2006 09:56:23 +0000
Message-ID: <20060322095623.GB3378@inskipp.digriz.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="rJwd6BRFiFCcLxzm"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org
Cc: akpm@osdl.org, linux@dominikbrodowski.de


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The sensible approach to making conservative less responsive than ondemand :) 
As mentioned in patch [1/4].  We do not want conservative to shoot through 
all the frequencies, its point (by default) is to slowly move through them.

By default its ten times less responsive.

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>





--rJwd6BRFiFCcLxzm
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

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--rJwd6BRFiFCcLxzm--

