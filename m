From: Rickard Holmberg <rickard@holmberg.info>
Subject: [PATCH] Adjusting CPU core voltages via sysfs on Centrino
Date: Mon, 08 Aug 2005 17:30:45 +0200
Message-ID: <42F77AA5.4030403@holmberg.info>
Mime-Version: 1.0
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi everyone.

This patch makes speedstep-centrino add a read/writable
/sys/devices/system/cpu/cpu0/cpufreq/scaling_voltages file,
allowing hand-tuning the voltages table on the Centrino. It
only permits lowering voltages relative to what was originally
determined from ACPI or tables.

I don't know if this is a desirable thing to have in a standard
kernel. Only tested on a Dothan with voltage tables from ACPI.
Comments are very welcome. The patch might be considered bloated
and/or spaghetti-code. It is Kconfigurable with
CONFIG_X86_SPEEDSTEP_CENTRINO_ADJUST_VOLTAGES.
Perhaps instability should be mentioned in the Kconfig help as a
possible side-effect of lowering the voltage too much.

	/ Rickard Holmberg

Signed-off-by: Rickard Holmberg <rickard@holmberg.info>

diff --git a/arch/i386/kernel/cpu/cpufreq/Kconfig b/arch/i386/kernel/cpu/cpufreq/Kconfig
--- a/arch/i386/kernel/cpu/cpufreq/Kconfig
+++ b/arch/i386/kernel/cpu/cpufreq/Kconfig
@@ -131,6 +131,18 @@ config X86_SPEEDSTEP_CENTRINO_ACPI

          If in doubt, say Y.

+config X86_SPEEDSTEP_CENTRINO_ADJUST_VOLTAGES
+       bool "Allow adjusting Pentium M core voltages"
+       depends on X86_SPEEDSTEP_CENTRINO
+       default n
+       help
+         Allow hand-tuning the Pentium M CPU core voltage tables
+         through the sysfs file system. It is primarily useful to lower
+         the CPU core temperature and reduce power consumption in
+         battery powered environments.
+
+         If in doubt, say N.
+
 config X86_SPEEDSTEP_CENTRINO_TABLE
        bool "Built-in tables for Banias CPUs"
        depends on X86_SPEEDSTEP_CENTRINO
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
@@ -24,6 +24,7 @@
 #include <linux/config.h>
 #include <linux/delay.h>
 #include <linux/compiler.h>
+#include <linux/ctype.h>

 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
 #include <linux/acpi.h>
@@ -86,13 +87,16 @@ static struct cpufreq_driver centrino_dr

 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE

+#define VOLTAGE_TO_VID(mv) (((mv) - 700) / 16)
+#define VID_TO_VOLTAGE(vid) ((vid) * 16 + 700)
+
 /* Computes the correct form for IA32_PERF_CTL MSR for a particular
    frequency/voltage operating point; frequency in MHz, volts in mV.
    This is stored as "index" in the structure. */
 #define OP(mhz, mv)                                                    \
        {                                                               \
                .frequency = (mhz) * 1000,                              \
-               .index = (((mhz)/100) << 8) | ((mv - 700) / 16)         \
+               .index = (((mhz)/100) << 8) | VOLTAGE_TO_VID(mv)        \
        }

 /*
@@ -666,7 +670,163 @@ migrate_end:
        return (retval);
 }

+/* sysfs things for altering voltages */
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ADJUST_VOLTAGES
+static struct cpufreq_frequency_table **original_table = NULL;
+
+static ssize_t show_scaling_voltages(struct cpufreq_policy *policy, char *buf)
+{
+       unsigned int cpu;
+       int i, j;
+
+       if (!policy)
+           return -ENODEV;
+       cpu = policy->cpu;
+       if (!centrino_model[cpu] || !centrino_model[cpu]->op_points)
+           return -ENODEV;
+
+       j=snprintf(buf, PAGE_SIZE, "# frequency voltage\n");
+
+       for (i=0; centrino_model[cpu]->op_points[i].frequency
+                    != CPUFREQ_TABLE_END; i++) {
+               /* Print lines of frequency and voltage */
+               j += snprintf(&buf[j], PAGE_SIZE-j, "%u %u\n",
+                             centrino_model[cpu]->op_points[i].frequency,
+                             VID_TO_VOLTAGE(centrino_model[cpu]->op_points[i].index & 0xff));
+       }
+       buf[PAGE_SIZE-1] = 0;
+       return j;
+}
+
+static ssize_t store_scaling_voltages(struct cpufreq_policy *policy,
+               const char *buf, size_t count)
+{
+       unsigned int cpu;
+       unsigned int frequency, voltage;
+       int ret, i, j;
+       int msr, vid;
+       unsigned int cur_freq;
+
+       if (!policy)
+           return -ENODEV;
+       cpu = policy->cpu;
+       if (!centrino_model[cpu] || !centrino_model[cpu]->op_points)
+           return -ENODEV;
+
+       /* Remember the original voltages, and don't let the user
+        * raise the voltages above those. As stated in
+        * centrino_init(), be paranoid about releasing people's
+        * valuable magic smoke. */
+
+       if (!original_table) {
+               original_table =
+                       kmalloc(sizeof(struct cpufreq_frequency_table *)*NR_CPUS,
+                               GFP_KERNEL);
+
+               if (!original_table)
+                       return -ENOMEM;
+
+               for (i=0; i < NR_CPUS; i++)
+                       original_table[i] = NULL;
+       }
+
+       if (!original_table[cpu]) {
+               /* Count number of frequencies and allocate memory for a copy */
+               for (i=0; centrino_model[cpu]->op_points[i].frequency
+                            != CPUFREQ_TABLE_END; i++);
+               original_table[cpu] = (struct cpufreq_frequency_table*)
+                       kmalloc(sizeof(struct cpufreq_frequency_table)*(i+1),
+                               GFP_KERNEL);
+
+               if (!original_table[cpu])
+                       return -ENOMEM;
+
+               /* Make copy of frequency/voltage pairs */
+               for (i=0; centrino_model[cpu]->op_points[i].frequency
+                            != CPUFREQ_TABLE_END; i++) {
+                       original_table[cpu][i].frequency =
+                               centrino_model[cpu]->op_points[i].frequency;
+                       original_table[cpu][i].index =
+                               centrino_model[cpu]->op_points[i].index;
+               }
+               original_table[cpu][i].frequency = CPUFREQ_TABLE_END;
+       }
+
+       /* Don't use sscanf, since we want to return the actual number
+        * of characters read. I don't feel comfortable using
+        * simple_stroul either, since I'm not sure that the buf
+        * really is zero-terminated. */
+
+       /* Eat non-digits */
+       for (ret = 0; ret < count && !isdigit(buf[ret]); ret++);
+       if (ret == count)
+           return ret;
+       /* Read frequency */
+       for (frequency = 0; ret < count && isdigit(buf[ret]); ret++)
+               frequency = 10*frequency + buf[ret] - '0';
+       /* Eat non-digits */
+       for (; ret < count && !isdigit(buf[ret]); ret++);
+       /* Read new voltage */
+       for (voltage = 0; ret < count && isdigit(buf[ret]); ret++)
+               voltage = 10*voltage + buf[ret] - '0';
+
+       if (frequency == 0 || voltage < 700)
+               return -EINVAL;
+
+       /* Check so that the voltage is not higher than the original one */
+       for (j=0; original_table[cpu][j].frequency != CPUFREQ_TABLE_END; j++)
+               if (frequency == original_table[cpu][j].frequency)
+                       break;
+       if (original_table[cpu][j].frequency == CPUFREQ_TABLE_END)
+               return -EINVAL;
+       if (voltage > VID_TO_VOLTAGE(original_table[cpu][j].index & 0xff))
+               return -EINVAL;
+
+       for (i=0; centrino_model[cpu]->op_points[i].frequency
+                    != CPUFREQ_TABLE_END; i++) {
+               if (frequency == centrino_model[cpu]->op_points[i].frequency)
+                       break;
+       }
+
+       if (centrino_model[cpu]->op_points[i].frequency == CPUFREQ_TABLE_END)
+               return -EINVAL;
+
+       msr = centrino_model[cpu]->op_points[i].index;
+       vid = VOLTAGE_TO_VID(voltage);
+       msr = (msr & ~0xff) | (vid & 0xff);
+
+       /* Double check so that the voltage id is not higher than the original one */
+       if (vid > (original_table[cpu][j].index & 0xff))
+               return -EINVAL;
+
+       dprintk(KERN_INFO PFX "altering centrino cpufreq table, to make %u kHz have "
+               "voltage %u mV (VID=%u)\n", frequency, voltage, vid);
+
+       centrino_model[cpu]->op_points[i].index = msr;
+
+
+       /* If the updated voltage applies to the frequency currently
+        * used, tell the CPU about the new voltage */
+       cur_freq = cpufreq_get(policy->cpu);
+       if (cur_freq == frequency)
+           centrino_target(policy, cur_freq, CPUFREQ_RELATION_L);
+
+       return ret;
+}
+
+#define define_one_rw(_name) \
+static struct freq_attr _name = \
+__ATTR(_name, 0644, show_##_name, store_##_name)
+
+define_one_rw(scaling_voltages);
+#endif /* CONFIG_X86_SPEEDSTEP_CENTRINO_ADJUST_VOLTAGES */
+
+/* end of sysfs voltage things */
+
 static struct freq_attr* centrino_attr[] = {
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ADJUST_VOLTAGES
+       &scaling_voltages,
+#endif
        &cpufreq_freq_attr_scaling_available_freqs,
        NULL,
 };
@@ -710,6 +870,17 @@ static int __init centrino_init(void)

 static void __exit centrino_exit(void)
 {
+#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ADJUST_VOLTAGES
+       if (original_table) {
+               int i;
+               for (i=0; i < NR_CPUS; i++) {
+                       if (original_table[i])
+                               kfree(original_table[i]);
+               }
+               kfree(original_table);
+       }
+#endif
+
        cpufreq_unregister_driver(&centrino_driver);
 }
