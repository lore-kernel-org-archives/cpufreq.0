From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 002/007] cpufreq_conservative: alter default responsiveness
Date: Sun, 26 Mar 2006 11:55:21 +0200
Message-ID: <20060326095521.GC17358@dominikbrodowski.de>
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

From: Alexander Clouter <alex@digriz.org.uk>

The sensible approach to making conservative less responsive than ondemand :)
As mentioned in patch [1/4].  We do not want conservative to shoot through
all the frequencies, its point (by default) is to slowly move through them.

By default its ten times less responsive.

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

---

 drivers/cpufreq/cpufreq_conservative.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

e8a02572252f9115c2b8296c40fd8b985f06f872
diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index adecd31..3ca3cf0 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -509,7 +509,7 @@ static int cpufreq_governor_dbs(struct c
 			if (latency == 0)
 				latency = 1;
 
-			def_sampling_rate = latency *
+			def_sampling_rate = 10 * latency *
 					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
 
 			if (def_sampling_rate < MIN_STAT_SAMPLING_RATE)
-- 
1.2.4
