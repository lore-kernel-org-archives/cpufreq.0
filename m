From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 007/007] cpufreq_ondemand: add range check
Date: Sun, 26 Mar 2006 11:57:51 +0200
Message-ID: <20060326095751.GH17358@dominikbrodowski.de>
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

From: Dominik Brodowski <linux@dominikbrodowski.net>

Assert that cpufreq_target is, at least, called with the minimum frequency
allowed by this policy, not something lower. It triggered problems on ARM.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

---

 drivers/cpufreq/cpufreq_ondemand.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

7c9d8c0e84d395a01289ebd1597758939a875a86
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index cd846f5..956d121 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -351,6 +351,9 @@ static void dbs_check_cpu(int cpu)
 	freq_next = (freq_next * policy->cur) /
 			(dbs_tuners_ins.up_threshold - 10);
 
+	if (freq_next < policy->min)
+		freq_next = policy->min;
+
 	if (freq_next <= ((policy->cur * 95) / 100))
 		__cpufreq_driver_target(policy, freq_next, CPUFREQ_RELATION_L);
 }
-- 
1.2.4
