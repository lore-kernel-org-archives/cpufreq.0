From: Michael Clark <mclark@metaparadigm.com>
Subject: static freq table support for Pentium M Dothan
Date: Tue, 17 Aug 2004 10:51:03 +0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: michael@mage.metaparadigm.com

Hi All,

I sent this patch privately to Dave but he suggested it needed some
discussion on the list.

It adds Dothan frequency/voltage tables for processors 715, 725, 735,
745, 755 to support frequency scaling when ACPI is not enabled. It
should apply to current BitKeeper (on top of centrino ACPI table support).

I personally need this patch as I don't use ACPI so can't use the
experimental ACPI freq/voltage tables support as ACPI doesn't work well
enough for me on my Thinkpad T42.

It currently lists the B0 steppings only, a line or 2 may need to be added
for A1 steppings although in my googling I haven't seen any /proc/cpuinfo
output for these, all i've seen are B0 steppings for which i've seen
examples of 1.5GHz through 1.8GHz.

The Dothan processor datasheet 30218903.pdf defines 4 voltages for
each frequency (VID#A through VID#D) whereas Banias only suggests a
typical voltage and no min or max for each freq so i've used the OP
macro to allow definition of all voltages (A through D) but the macro
currently just uses VID#A at compile time.

Having all of the voltages in the code (VID#A through VID#D) is really
more for the purposes of completeness. The VID#A voltages after some
thought are the most conservative setting (also same as seen in the ACPI
tables of my Thinkpad), as the max voltage of the Dothans is 1.6, having
the higher voltage will allow for greater power supply tolerance.

~mc

--- linux-2.6.8-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.orig	2004-08-06 18:42:15.000000000 +0800
+++ linux-2.6.8-rc3-mm1/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-06 18:44:28.000000000 +0800
@@ -195,6 +195,82 @@
 	OP(1700, 1484),
 	{ .frequency = CPUFREQ_TABLE_END }
 };
+
+#undef OP
+
+/* Dothan processor datasheet 30218903.pdf defines 4 voltages for each
+   frequency (VID#A through VID#D) - this macro allows us to define all
+   of these but we only use the VID#A voltages at compile time - this may
+   need some work if we want to select the voltage profile at runtime. */
+
+#define OP(mhz, mva, mvb, mvc, mvd)					\
+	{								\
+		.frequency = (mhz) * 1000,				\
+		.index = (((mhz)/100) << 8) | ((mva - 700) / 16)       	\
+	}
+
+/* Intel Pentium M processor 715 / 1.50GHz (Dothan) */
+static struct cpufreq_frequency_table dothan_1500[] =
+{
+	OP( 600,  988,  988,  988,  988),
+	OP( 800, 1068, 1068, 1068, 1052),
+	OP(1000, 1148, 1148, 1132, 1116),
+	OP(1200, 1228, 1212, 1212, 1180),
+	OP(1500, 1340, 1324, 1308, 1276),
+	{ .frequency = CPUFREQ_TABLE_END }
+};
+
+/* Intel Pentium M processor 725 / 1.60GHz (Dothan) */
+static struct cpufreq_frequency_table dothan_1600[] =
+{
+	OP( 600,  988,  988,  988,  988),
+	OP( 800, 1068, 1068, 1052, 1052),
+	OP(1000, 1132, 1132, 1116, 1116),
+	OP(1200, 1212, 1196, 1180, 1164),
+	OP(1400, 1276, 1260, 1244, 1228),
+	OP(1600, 1340, 1324, 1308, 1276),
+	{ .frequency = CPUFREQ_TABLE_END }
+};
+
+/* Intel Pentium M processor 735 / 1.70GHz (Dothan) */
+static struct cpufreq_frequency_table dothan_1700[] =
+{
+	OP( 600,  988,  988,  988,  988),
+	OP( 800, 1052, 1052, 1052, 1052),
+	OP(1000, 1116, 1116, 1116, 1100),
+	OP(1200, 1180, 1180, 1164, 1148),
+	OP(1400, 1244, 1244, 1228, 1212),
+	OP(1700, 1340, 1324, 1308, 1276),
+	{ .frequency = CPUFREQ_TABLE_END }
+};
+
+/* Intel Pentium M processor 745 / 1.80GHz (Dothan) */
+static struct cpufreq_frequency_table dothan_1800[] =
+{
+	OP( 600,  988,  988,  988,  988),
+	OP( 800, 1052, 1052, 1052, 1036),
+	OP(1000, 1116, 1100, 1100, 1084),
+	OP(1200, 1164, 1164, 1148, 1132),
+	OP(1400, 1228, 1212, 1212, 1180),
+	OP(1600, 1292, 1276, 1260, 1228),
+	OP(1800, 1340, 1324, 1308, 1276),
+	{ .frequency = CPUFREQ_TABLE_END }
+};
+
+/* Intel Pentium M processor 755 / 2.00GHz (Dothan) */
+static struct cpufreq_frequency_table dothan_2000[] =
+{
+	OP( 600,  988,  988,  988,  988),
+	OP( 800, 1052, 1036, 1036, 1036),
+	OP(1000, 1100, 1084, 1084, 1084),
+	OP(1200, 1148, 1132, 1132, 1116),
+	OP(1400, 1196, 1180, 1180, 1164),
+	OP(1600, 1244, 1228, 1228, 1196),
+	OP(1800, 1292, 1276, 1276, 1244),
+	OP(2000, 1340, 1324, 1308, 1276),
+	{ .frequency = CPUFREQ_TABLE_END }
+};
+
 #undef OP
 
 #define _BANIAS(cpuid, max, name)	\
@@ -205,6 +281,13 @@
 }
 #define BANIAS(max)	_BANIAS(&cpu_ids[CPU_BANIAS], max, #max)
 
+#define DOTHAN(cpuid, max, name)	\
+{	.cpu_id		= cpuid,	\
+	.model_name	= "Intel(R) Pentium(R) M processor " name "GHz", \
+	.max_freq	= (max)*1000,	\
+	.op_points	= dothan_##max,	\
+}
+
 /* CPU models, their operating frequency range, and freq/voltage
    operating points */
 static struct cpu_model models[] =
@@ -218,6 +301,11 @@
 	BANIAS(1500),
 	BANIAS(1600),
 	BANIAS(1700),
+	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1500, "1.50"),
+	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1600, "1.60"),
+	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1700, "1.70"),
+	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1800, "1.80"),
+	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 2000, "2.00"),
 
 	/* NULL model_name is a wildcard */
 	{ &cpu_ids[CPU_DOTHAN_A1], NULL, 0, NULL },
@@ -227,6 +315,7 @@
 };
 #undef _BANIAS
 #undef BANIAS
+#undef DOTHAN
 
 static int centrino_cpu_init_table(struct cpufreq_policy *policy)
 {
