From: Felix Braun <Felix.Braun@mail.mcgill.ca>
Subject: [PATCH 2.6.14 2/2] cpufreq_conservative units weirdness
Date: Fri, 2 Dec 2005 14:25:25 +0100
Message-ID: <20051202142525.07d142a9@tilion.getrex.org>
References: <20051202135956.5d7299c1@tilion.getrex.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051202135956.5d7299c1@tilion.getrex.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq@lists.linux.org.uk

It seems to me that there is some discrepancy between cpufreq_ondemand and
cpufreq_conservative. Specifically, the ondemand driver allows a minimum
sampling rate of 500 times the transition latency. However, in the
conservative driver increases the DEFAULT_MULTIPLIER from 1000 to 100000
without adjusting MIN_SAMPLING_RATE accordingly.

To correct this behaviour, it would be possible to simply adjust the
DEFAULT_MULTIPLIER to 1000, however, this would change the behaviour of
the default install. Instead I suggest adjusting the minimum sample rate
so that people who want to adjust their sampling rates to lower values
(which should still be safe) can chose to do so.

------

Allow users of cpufreq_conservative the same minimum sampling rate than
what is allowed by cpufreq_ondemand.

Signed-off-by: Felix Braun <Felix.Braun@mail.McGill.ca>

------

diff -ruN a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
--- a/drivers/cpufreq/cpufreq_conservative.c    2005-12-02 13:19:48.000000000 +0100
+++ b/drivers/cpufreq/cpufreq_conservative.c    2005-12-02 13:21:11.000000000 +0100
@@ -54,7 +54,7 @@
  * All times here are in uS.
  */
 static unsigned int                            def_sampling_rate;
-#define MIN_SAMPLING_RATE                      (def_sampling_rate / 2)
+#define MIN_SAMPLING_RATE                      (def_sampling_rate / 200)
 #define MAX_SAMPLING_RATE                      (500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER   (100000)
 #define DEF_SAMPLING_DOWN_FACTOR               (5)
