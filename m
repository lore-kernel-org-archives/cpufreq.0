From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] Print _PPC changes via cpufreq debug layer
Date: Wed, 31 Oct 2007 15:41:42 +0100
Message-ID: <1193841703.4590.479.camel@queen.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq <cpufreq@lists.linux.org.uk>
Cc: davej <davej@codemonkey.org.uk>

Ferdinand, you might want to give this one a try.
With CPU_FREQ_DEBUG set and cpufreq core debug enabled you should see
_PPC value changes. As soon as the value is not 0, you could be rather
sure the limitation comes from there...


Dave, Len: Can this be added, pls.
Testcompiled with CPU freq enabled/disabled and cpufreq debug
enabled/disabled on x86_64.

Thanks,

   Thomas

----------------------------


Print _PPC changes via cpufreq debug layer

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 drivers/acpi/processor_perflib.c |    7 +++++++
 1 file changed, 7 insertions(+)

Index: cpufreq/drivers/acpi/processor_perflib.c
===================================================================
--- cpufreq.orig/drivers/acpi/processor_perflib.c
+++ cpufreq/drivers/acpi/processor_perflib.c
@@ -50,6 +50,10 @@ ACPI_MODULE_NAME("processor_perflib");
 
 static DEFINE_MUTEX(performance_mutex);
 
+/* Use cpufreq debug layer for _PPC changes. */
+#define cpufreq_printk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_CORE, \
+						"cpufreq-core", msg)
+
 /*
  * _PPC support is implemented as a CPUfreq policy notifier:
  * This means each time a CPUfreq driver registered also with
@@ -123,6 +127,9 @@ static int acpi_processor_get_platform_l
 		return -ENODEV;
 	}
 
+	cpufreq_printk("CPU %d: _PPC is %d - frequency %s limited\n", pr->id,
+		       (int)ppc, ppc ? "" : "not");
+
 	pr->performance_platform_limit = (int)ppc;
 
 	return 0;
