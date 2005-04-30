From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] drivers/cpufreq/cpufreq_ondemand.c: make
	cpufreq_gov_dbs static
Date: Sat, 30 Apr 2005 22:07:46 +0200
Message-ID: <20050430200746.GL3571@stusta.de>
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
To: Andrew Morton <akpm@osdl.org>
Cc: davej@codemonkey.org.uk, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

This patch makes a needlessly global and EXPORT_SYMBOL'ed struct static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

This patch was already sent on:
- 17 Apr 2005

--- linux-2.6.12-rc2-mm3-full/drivers/cpufreq/cpufreq_ondemand.c.old	2005-04-17 18:32:10.000000000 +0200
+++ linux-2.6.12-rc2-mm3-full/drivers/cpufreq/cpufreq_ondemand.c	2005-04-17 18:32:19.000000000 +0200
@@ -459,12 +459,11 @@
 	return 0;
 }
 
-struct cpufreq_governor cpufreq_gov_dbs = {
+static struct cpufreq_governor cpufreq_gov_dbs = {
 	.name		= "ondemand",
 	.governor	= cpufreq_governor_dbs,
 	.owner		= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_dbs);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
