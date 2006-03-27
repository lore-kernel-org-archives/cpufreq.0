From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] cpufreq_conservative: keep ignore_nice_load and freq_step
	values when reselected
Date: Mon, 27 Mar 2006 22:55:55 +0200
Message-ID: <20060327205555.GD4150@inferi.kami.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KN5l+BnMqAQyZLvT"
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

inspired by Eric's similar patch for the ondemand governor here's a fix
to keep some useful values for the conservative governor between
deselect/select cycles.
The patch is against 2.6.16-mm1, so it should apply over the just pulled
conservative patches.

-- 
mattia
:wq!

---
From: Mattia Dongili <malattia@linux.it>

Keep the value of ignore_nice_load and freq_step of the conservative
governor after the governor is deselected and reselected.

Signed-off-by: Mattia Dongili <malattia@linux.it>


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq_conservative_keep_option_values.diff"

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index a152d2c..037f6bf 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -88,6 +88,8 @@ static struct dbs_tuners dbs_tuners_ins 
 	.up_threshold 		= DEF_FREQUENCY_UP_THRESHOLD,
 	.down_threshold 	= DEF_FREQUENCY_DOWN_THRESHOLD,
 	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
+	.ignore_nice		= 0,
+	.freq_step		= 5,
 };
 
 static inline unsigned int get_cpu_idle_time(unsigned int cpu)
@@ -490,8 +492,6 @@ static int cpufreq_governor_dbs(struct c
 				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
 
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
-			dbs_tuners_ins.ignore_nice = 0;
-			dbs_tuners_ins.freq_step = 5;
 
 			dbs_timer_init();
 		}

--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--KN5l+BnMqAQyZLvT--

