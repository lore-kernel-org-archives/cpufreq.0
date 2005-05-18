From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] [5/5] ondemand governor default sampling downfactor as 1
Date: Wed, 18 May 2005 13:40:12 -0700
Message-ID: <20050518134012.F22282@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Alexander Clouter <alex-kernel@digriz.org.uk>, cpufreq@lists.linux.org.uk, Eric Piel <Eric.Piel@tremplin-utc.net>, linux@dominikbrodowski.net, Rajesh Shah <rajesh.shah@intel.com>


[PATCH] [5/5] ondemand governor default sampling downfactor as 1

Make default sampling downfactor 1.
This works better with earlier auto downscaling change in ondemand governor.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.org	2005-03-11 19:41:12.000000000 -0800
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-03-11 19:43:00.000000000 -0800
@@ -51,7 +51,8 @@ static unsigned int 				def_sampling_rat
 #define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
-#define DEF_SAMPLING_DOWN_FACTOR		(10)
+#define DEF_SAMPLING_DOWN_FACTOR		(1)
+#define MAX_SAMPLING_DOWN_FACTOR		(10)
 #define TRANSITION_LATENCY_LIMIT		(10 * 1000)
 #define sampling_rate_in_HZ(x)			(((x * HZ) < (1000 * 1000))?1:((x * HZ) / (1000 * 1000)))
 
@@ -119,6 +120,9 @@ static ssize_t store_sampling_down_facto
 	if (ret != 1 )
 		return -EINVAL;
 
+	if (input > MAX_SAMPLING_DOWN_FACTOR || input < 1)
+		return -EINVAL;
+
 	down(&dbs_sem);
 	dbs_tuners_ins.sampling_down_factor = input;
 	up(&dbs_sem);
