From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 006/007] cpufreq_ondemand: keep ignore_nice_load value when
	it is reselected
Date: Sun, 26 Mar 2006 11:57:33 +0200
Message-ID: <20060326095733.GG17358@dominikbrodowski.de>
References: <20060326095338.GA17358@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060326095338.GA17358@dominikbrodowski.de>
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
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@lists.linux.org.uk

From: Eric Piel <Eric.Piel@tremplin-utc.net>

Keep the value of ignore_nice_load of the ondemand governor even after
the governor has been deselected and selected back. This is the behavior
of the other exported values of the ondemand governor and it's much more
user-friendly.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Acked-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

---

 drivers/cpufreq/cpufreq_ondemand.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

9cbad61b41f0b6f0a4c600fe96d8292ffd592b50
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 6430489..cd846f5 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -84,6 +84,7 @@ struct dbs_tuners {
 static struct dbs_tuners dbs_tuners_ins = {
 	.up_threshold = DEF_FREQUENCY_UP_THRESHOLD,
 	.sampling_down_factor = DEF_SAMPLING_DOWN_FACTOR,
+	.ignore_nice = 0,
 };
 
 static inline unsigned int get_cpu_idle_time(unsigned int cpu)
@@ -434,8 +435,6 @@ static int cpufreq_governor_dbs(struct c
 				def_sampling_rate = MIN_STAT_SAMPLING_RATE;
 
 			dbs_tuners_ins.sampling_rate = def_sampling_rate;
-			dbs_tuners_ins.ignore_nice = 0;
-
 			dbs_timer_init();
 		}
 
-- 
1.2.4
