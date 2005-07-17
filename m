From: Luca <kronos@kronoz.cjb.net>
Subject: [PATCH] Fix sampling rate in cpufreq_conservative
Date: Sun, 17 Jul 2005 16:05:39 +0200
Message-ID: <20050717140539.GA2742@dreamland.darkstar.lan>
Mime-Version: 1.0
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk


Hi,
I was fiddling with cpufreq_conservative (2.6.12, but I see that .13-rc3 is
still the same) and noticed that sampling rate is way too high. The governor
takes ages (i.e. tens of seconds) to raise the frequency, making it quite
useless. 

From /sys/devices/blabla/conservative:
down_threshold
20
freq_step
5
ignore_nice
0
sampling_down_factor
5
sampling_rate
19900000
sampling_rate_max
1360065408
sampling_rate_min
9950000
up_threshold
80

For reference this is ondemand:
ignore_nice
0
sampling_down_factor
1
sampling_rate
199000
sampling_rate_max
99500000
sampling_rate_min
99500
up_threshold
80

In cpufreq_conservative.c you can read the following comment:

 * The polling frequency of this governor depends on the capability of
 * the processor. Default polling frequency is 1000 times the transition
 * latency of the processor. The governor will work on any processor with
   
but the code doesn't agree:

#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER    (100000)

The following patch lower the multiplier to 1000, making the consevative
governor as responsive as ondemand (which is using the same multiplier).

Signed-Off-By: Luca Tettamanti <kronos@kronoz.cjb.net>

--- a/drivers/cpufreq/cpufreq_conservative.c	2005-07-17 13:46:27.000000000 +0200
+++ b/drivers/cpufreq/cpufreq_conservative.c	2005-07-17 13:46:40.000000000 +0200
@@ -55,7 +55,7 @@
 static unsigned int 				def_sampling_rate;
 #define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
-#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(100000)
+#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
 #define DEF_SAMPLING_DOWN_FACTOR		(5)
 #define TRANSITION_LATENCY_LIMIT		(10 * 1000)


Luca
-- 
Home: http://kronoz.cjb.net
42
