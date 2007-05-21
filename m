From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] Re: 2.6.22-rc2 built on ppc
Date: Mon, 21 May 2007 07:20:04 -0500
Message-ID: <1179750004.20299.75.camel@sublime.suse.de>
References: <20070520111953.GH3253@aragorn.home.lxtec.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-kZrAek7IH2ngOD7JKw6x"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20070520111953.GH3253@aragorn.home.lxtec.de>
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
To: Elimar Riesebieter <riesebie@lxtec.de>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk


--=-kZrAek7IH2ngOD7JKw6x
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-05-20 at 13:19 +0200, Elimar Riesebieter wrote:
> Hi,
> 
> FYI, building the kernel with
> gcc (GCC) 4.1.3 20070514 (prerelease) (Debian 4.1.2-7)
> on my powerbook (PPC) gives:
> P
> ...
> drivers/cpufreq/cpufreq.c: In function 'cpufreq_add_dev':
> drivers/cpufreq/cpufreq.c:829: warning: ignoring return value of 'sysfs_create_file', declared with attribute warn_unused_result
> drivers/cpufreq/cpufreq.c:833: warning: ignoring return value of 'sysfs_create_file', declared with attribute warn_unused_result
> drivers/cpufreq/cpufreq.c:835: warning: ignoring return value of 'sysfs_create_file', declared with attribute warn_unused_result
> ...
This one should fix it:

Eliminate build warning (sysfs_create_file return value must be checked)

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 drivers/cpufreq/cpufreq.c |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

Index: linux-2.6.22-rc2/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.22-rc2.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.22-rc2/drivers/cpufreq/cpufreq.c
@@ -826,13 +826,18 @@ static int cpufreq_add_dev (struct sys_d
 	/* set up files for this cpu device */
 	drv_attr = cpufreq_driver->attr;
 	while ((drv_attr) && (*drv_attr)) {
-		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
+		if (sysfs_create_file(&policy->kobj, &((*drv_attr)->attr)))
+			goto err_out_driver_exit;
 		drv_attr++;
 	}
-	if (cpufreq_driver->get)
-		sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr);
-	if (cpufreq_driver->target)
-		sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
+	if (cpufreq_driver->get){
+		if (sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr))
+			goto err_out_driver_exit;
+	}
+	if (cpufreq_driver->target){
+		if (sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr))
+			goto err_out_driver_exit;
+	}
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	for_each_cpu_mask(j, policy->cpus) {


--=-kZrAek7IH2ngOD7JKw6x
Content-Disposition: attachment;
	filename=cpufreq_sysfs_create_file_warning.patch
Content-Type: text/x-patch; name=cpufreq_sysfs_create_file_warning.patch;
	charset=UTF-8
Content-Transfer-Encoding: 7bit

Eliminate build warning (sysfs_create_file return value must be checked)

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 drivers/cpufreq/cpufreq.c |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

Index: linux-2.6.22-rc2/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.22-rc2.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.22-rc2/drivers/cpufreq/cpufreq.c
@@ -826,13 +826,18 @@ static int cpufreq_add_dev (struct sys_d
 	/* set up files for this cpu device */
 	drv_attr = cpufreq_driver->attr;
 	while ((drv_attr) && (*drv_attr)) {
-		sysfs_create_file(&policy->kobj, &((*drv_attr)->attr));
+		if (sysfs_create_file(&policy->kobj, &((*drv_attr)->attr)))
+			goto err_out_driver_exit;
 		drv_attr++;
 	}
-	if (cpufreq_driver->get)
-		sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr);
-	if (cpufreq_driver->target)
-		sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
+	if (cpufreq_driver->get){
+		if (sysfs_create_file(&policy->kobj, &cpuinfo_cur_freq.attr))
+			goto err_out_driver_exit;
+	}
+	if (cpufreq_driver->target){
+		if (sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr))
+			goto err_out_driver_exit;
+	}
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	for_each_cpu_mask(j, policy->cpus) {

--=-kZrAek7IH2ngOD7JKw6x
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=-kZrAek7IH2ngOD7JKw6x--


