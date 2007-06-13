From: Tobias Klauser <tklauser@distanz.ch>
Subject: [CPUFREQ PATCH]: Fix sysfs_create_file return value handling
Date: Thu, 14 Jun 2007 00:28:15 +0200
Message-ID: <20070613222815.GA26043@distanz.ch>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

Commit 0a4b2ccc555fa2ca6873d60219047104e4805d45 in cpufreq.git
eliminates the build warnings but does not pass on the error code of
sysfs_create_file to the function calling cpufreq_add_dev. Instead some
previous value of ret would be returned.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0521427..0db9e1b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -826,16 +826,19 @@ static int cpufreq_add_dev (struct sys_device * sys_dev)
 	/* set up files for this cpu device */
 	drv_attr = cpufreq_driver->attr;
 	while ((drv_attr) && (*drv_attr)) {
-		if (sysfs_create_file(&policy->kobj, &((*drv_attr)->attr)))
+		ret = sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
+		if (ret)
 			goto err_out_driver_exit;
 		drv_attr++;
 	}
 	if (cpufreq_driver->get){
-		if (sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr))
+		ret = sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr);
+		if (ret)
 			goto err_out_driver_exit;
 	}
 	if (cpufreq_driver->target){
-		if (sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr))
+		ret = sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
+		if (ret)
 			goto err_out_driver_exit;
 	}
