From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6] cpufreq: don't stick if all ->init() calls fail
Date: Fri, 20 Feb 2004 09:41:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220084115.GC10215@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@www.linux.org.uk

Some cpufreq drivers can only tell whether they work while the per-CPU 
->init() function is executed [e.g. the acpi driver]. So that cpufreq_driver
isn't blocked by such stale drivers, unload them unless the driver sets a
special flag.

 drivers/cpufreq/cpufreq.c |   24 +++++++++++++++++++++++-
 include/linux/cpufreq.h   |    6 ++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-02-18 10:23:31.000000000 +0100
+++ linux/drivers/cpufreq/cpufreq.c	2004-02-18 22:23:54.585475216 +0100
@@ -963,6 +963,7 @@
 int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 {
 	unsigned long flags;
+	int ret;
 
 	if (!driver_data || !driver_data->verify || !driver_data->init ||
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
@@ -976,7 +977,28 @@
 	cpufreq_driver = driver_data;
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-	return sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
+	ret = sysdev_driver_register(&cpu_sysdev_class,&cpufreq_sysdev_driver);
+
+	if ((!ret) && !(cpufreq_driver->flags & CPUFREQ_STICKY)) {
+		int i;
+		ret = -ENODEV;
+
+		/* check for at least one working CPU */
+		for (i=0; i<NR_CPUS; i++)
+			if (cpufreq_cpu_data[i])
+				ret = 0;
+
+		/* if all ->init() calls failed, unregister */
+		if (ret) {
+			sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
+
+			spin_lock_irqsave(&cpufreq_driver_lock, flags);
+			cpufreq_driver = NULL;
+			spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		}
+	}
+
+	return (ret);
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_driver);
 
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-02-18 22:23:32.453839736 +0100
+++ linux/include/linux/cpufreq.h	2004-02-18 22:23:54.598473240 +0100
@@ -175,6 +175,7 @@
 struct cpufreq_driver {
 	struct module           *owner;
 	char			name[CPUFREQ_NAME_LEN];
+	u8			flags;
 
 	/* needed by all drivers */
 	int	(*init)		(struct cpufreq_policy *policy);
@@ -192,6 +193,11 @@
 	struct freq_attr	**attr;
 };
 
+/* flags */
+
+#define CPUFREQ_STICKY	0x01	/* the driver isn't removed even if 
+				   all ->init() calls failed */
+
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
