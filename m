From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: 2/4 SMT awareness: save struct sys_device for all
	CPUs
Date: Mon, 9 Aug 2004 21:54:31 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809195431.GE9397@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com

Save a copy of each CPU's struct sys_device in drivers/cpufreq/cpufreq.c
so that symlinks can be removed even outside the specific sys_device's
->remove() function.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 drivers/cpufreq/cpufreq.c |   11 +++++++++++
 1 files changed, 11 insertions(+)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-08-06 21:56:12.671288112 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-08-06 21:56:41.100966144 +0200
@@ -33,6 +33,14 @@
 static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
 static spinlock_t		cpufreq_driver_lock = SPIN_LOCK_UNLOCKED;
 
+
+/* we keep a copy of all ->add'ed CPU's struct sys_device here;
+ * as it is only accessed in ->add and ->remove, no lock or reference
+ * count is necessary.
+ */
+static struct sys_device	*cpu_sys_devices[NR_CPUS];
+
+
 /* internal prototypes */
 static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event);
 static void handle_update(void *data);
@@ -520,6 +528,7 @@
 		goto err_out_unregister;
 
 	module_put(cpufreq_driver->owner);
+	cpu_sys_devices[cpu] = sys_dev;
 	return 0;
 
 
@@ -551,6 +560,8 @@
 	unsigned long flags;
 	struct cpufreq_policy *data;
 
+	cpu_sys_devices[cpu] = NULL;
+
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	data = cpufreq_cpu_data[cpu];
