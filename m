From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 005/007] cpufreq_ondemand: Warn if it cannot run due to too
	long transition latency
Date: Sun, 26 Mar 2006 11:57:12 +0200
Message-ID: <20060326095712.GF17358@dominikbrodowski.de>
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

Display a warning if the ondemand governor can not be selected due to a
transition latency of the cpufreq driver which is too long.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Acked-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

---

 drivers/cpufreq/cpufreq_ondemand.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

ff8c288d7d1a368b663058cdee1ea0adcdef2fa2
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 69aa1db..6430489 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -395,8 +395,11 @@ static int cpufreq_governor_dbs(struct c
 			return -EINVAL;
 
 		if (policy->cpuinfo.transition_latency >
-				(TRANSITION_LATENCY_LIMIT * 1000))
+				(TRANSITION_LATENCY_LIMIT * 1000)) {
+			printk(KERN_WARNING "ondemand governor failed to load "
+			       "due to too long transition latency\n");
 			return -EINVAL;
+		}
 		if (this_dbs_info->enable) /* Already enabled */
 			break;
 
-- 
1.2.4
