From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] cpufreq: add error handling for
	cpufreq_register_governor() error
Date: Mon, 14 Jul 2008 12:00:45 +0900
Message-ID: <20080714030045.GB17281@sssvn.sssvn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Add error handling for cpufreq_register_governor() error

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk
---
 drivers/cpufreq/cpufreq_ondemand.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

Index: 2.6-mmotm/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- 2.6-mmotm.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ 2.6-mmotm/drivers/cpufreq/cpufreq_ondemand.c
@@ -589,12 +589,18 @@ EXPORT_SYMBOL(cpufreq_gov_ondemand);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
+	int err;
+
 	kondemand_wq = create_workqueue("kondemand");
 	if (!kondemand_wq) {
 		printk(KERN_ERR "Creation of kondemand failed\n");
 		return -EFAULT;
 	}
-	return cpufreq_register_governor(&cpufreq_gov_ondemand);
+	err = cpufreq_register_governor(&cpufreq_gov_ondemand);
+	if (err)
+		destroy_workqueue(kondemand_wq);
+
+	return err;
 }
 
 static void __exit cpufreq_gov_dbs_exit(void)
