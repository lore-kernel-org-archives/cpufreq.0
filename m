From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 8/8]cpufreq:acpi-cpufreq: Add support for freq feedback from
	hardware
Date: Tue, 3 Oct 2006 12:38:45 -0700
Message-ID: <20061003123845.F31827@unix-os.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>


Enable ondemand governor and acpi-cpufreq to use IA32_APERF and IA32_MPERF =
MSR
to get active frequency feedback for the last sampling interval. This will
make ondemand take right frequency decisions when hardware coordination of
frequency is going on.

Without APERF/MPERF, ondemand can take wrong decision at times due
to underlying hardware coordination or TM2.
Example:
* CPU 0 and CPU 1 are hardware cooridnated.
* CPU 1 running at highest frequency.
* CPU 0 was running at highest freq. Now ondemand reduces it to
  some intermediate frequency based on utilization.
* Due to underlying hardware coordination with other CPU 1, CPU 0 continues=
 to
  run at highest frequency (as long as other CPU is at highest).
* When ondemand samples CPU 0 again next time, without actual frequency
  feedback from APERF/MPERF, it will think that previous frequency change
  was successful and can go to wrong target frequency. This is because it
  thinks that utilization it has got this sampling interval is when running=
 at
  intermediate frequency, rather than actual highest frequency.

More information about IA32_APERF IA32_MPERF MSR:
Refer to IA-32 Intel=C2=AE Architecture Software Developer's Manual at=20
http://developer.intel.com

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.18.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -58,10 +58,12 @@ enum {
 };
=20
 #define INTEL_MSR_RANGE		(0xffff)
+#define CPUID_6_ECX_APERFMPERF_CAPABILITY	(0x1)
=20
 struct acpi_cpufreq_data {
 	struct acpi_processor_performance *acpi_data;
 	struct cpufreq_frequency_table *freq_table;
+	unsigned int max_freq;
 	unsigned int resume;
 	unsigned int cpu_feature;
 };
@@ -258,6 +260,100 @@ static u32 get_cur_val(cpumask_t mask)
 	return cmd.val;
 }
=20
+/*
+ * Return the measured active (C0) frequency on this CPU since last call
+ * to this function.
+ * Input: cpu number
+ * Return: Average CPU frequency in terms of max frequency (zero on error)
+ *
+ * We use IA32_MPERF and IA32_APERF MSRs to get the measured performance
+ * over a period of time, while CPU is in C0 state.
+ * IA32_MPERF counts at the rate of max advertised frequency
+ * IA32_APERF counts at the rate of actual CPU frequency
+ * Only IA32_APERF/IA32_MPERF ratio is architecturally defined and
+ * no meaning should be associated with absolute values of these MSRs.
+ */
+static unsigned int get_measured_perf(unsigned int cpu)
+{
+	union {
+		struct {
+			u32 lo;
+			u32 hi;
+		} split;
+		u64 whole;
+	} aperf_cur, mperf_cur;
+
+	cpumask_t saved_mask;
+	unsigned int perf_percent;
+	unsigned int retval;
+
+	saved_mask =3D current->cpus_allowed;
+	set_cpus_allowed(current, cpumask_of_cpu(cpu));
+	if (get_cpu() !=3D cpu) {
+		/* We were not able to run on requested processor */
+		put_cpu();
+		return 0;
+	}
+
+	rdmsr(MSR_IA32_APERF, aperf_cur.split.lo, aperf_cur.split.hi);
+	rdmsr(MSR_IA32_MPERF, mperf_cur.split.lo, mperf_cur.split.hi);
+
+	wrmsr(MSR_IA32_APERF, 0,0);
+	wrmsr(MSR_IA32_MPERF, 0,0);
+
+#ifdef __i386__
+	/*
+	 * We dont want to do 64 bit divide with 32 bit kernel
+	 * Get an approximate value. Return failure in case we cannot get
+	 * an approximate value.
+	 */
+	if (unlikely(aperf_cur.split.hi || mperf_cur.split.hi)) {
+		int shift_count;
+		u32 h;
+
+		h =3D max_t(u32, aperf_cur.split.hi, mperf_cur.split.hi);
+		shift_count =3D fls(h);
+
+		aperf_cur.whole >>=3D shift_count;
+		mperf_cur.whole >>=3D shift_count;
+	}
+
+	if (((unsigned long)(-1) / 100) < aperf_cur.split.lo) {
+		int shift_count =3D 7;
+		aperf_cur.split.lo >>=3D shift_count;
+		mperf_cur.split.lo >>=3D shift_count;
+	}
+
+	if (aperf_cur.split.lo && mperf_cur.split.lo) {
+		perf_percent =3D (aperf_cur.split.lo * 100) / mperf_cur.split.lo;
+	} else {
+		perf_percent =3D 0;
+	}
+
+#else
+	if (unlikely(((unsigned long)(-1) / 100) < aperf_cur.whole)) {
+		int shift_count =3D 7;
+		aperf_cur.whole >>=3D shift_count;
+		mperf_cur.whole >>=3D shift_count;
+	}
+
+	if (aperf_cur.whole && mperf_cur.whole) {
+		perf_percent =3D (aperf_cur.whole * 100) / mperf_cur.whole;
+	} else {
+		perf_percent =3D 0;
+	}
+
+#endif
+
+	retval =3D drv_data[cpu]->max_freq * perf_percent / 100;
+
+	put_cpu();
+	set_cpus_allowed(current, saved_mask);
+
+	dprintk("cpu %d: performance percent %d\n", cpu, perf_percent);
+	return retval;
+}
+
 static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
 {
 	struct acpi_cpufreq_data *data =3D drv_data[cpu];
@@ -497,7 +593,6 @@ static int acpi_cpufreq_cpu_init(struct=20
 	unsigned int valid_states =3D 0;
 	unsigned int cpu =3D policy->cpu;
 	struct acpi_cpufreq_data *data;
-	unsigned int l, h;
 	unsigned int result =3D 0;
 	struct cpuinfo_x86 *c =3D &cpu_data[policy->cpu];
 	struct acpi_processor_performance *perf;
@@ -591,6 +686,7 @@ static int acpi_cpufreq_cpu_init(struct=20
 	}
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
=20
+	data->max_freq =3D perf->states[0].core_frequency * 1000;
 	/* table init */
 	for (i =3D 0; i < perf->state_count; i++) {
 		if (i > 0 && perf->states[i].core_frequency =3D=3D
@@ -625,6 +721,15 @@ static int acpi_cpufreq_cpu_init(struct=20
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
=20
+	/* Check for APERF/MPERF support in hardware */
+	if (c->x86_vendor =3D=3D X86_VENDOR_INTEL && c->cpuid_level >=3D 6) {
+		unsigned int ecx;
+		ecx =3D cpuid_ecx(6);
+		if (ecx & CPUID_6_ECX_APERFMPERF_CAPABILITY) {
+			acpi_cpufreq_driver.getavg =3D get_measured_perf;
+		}
+	}
+
 	dprintk("CPU%u - ACPI performance management activated.\n", cpu);
 	for (i =3D 0; i < perf->state_count; i++)
 		dprintk("     %cP%d: %d MHz, %d mW, %d uS\n",
Index: linux-2.6.18/drivers/cpufreq/cpufreq.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.18.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.18/drivers/cpufreq/cpufreq.c
@@ -1268,6 +1268,26 @@ int cpufreq_driver_target(struct cpufreq
 }
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
=20
+int cpufreq_driver_getavg(struct cpufreq_policy *policy)
+{
+	int ret =3D 0;
+
+	policy =3D cpufreq_cpu_get(policy->cpu);
+	if (!policy)
+		return -EINVAL;
+
+	mutex_lock(&policy->lock);
+
+	if (cpu_online(policy->cpu) && cpufreq_driver->getavg)
+		ret =3D cpufreq_driver->getavg(policy->cpu);
+
+	mutex_unlock(&policy->lock);
+
+	cpufreq_cpu_put(policy);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cpufreq_driver_getavg);
+
 /*
  * Locking: Must be called with the lock_cpu_hotplug() lock held
  * when "event" is CPUFREQ_GOV_LIMITS
Index: linux-2.6.18/drivers/cpufreq/cpufreq_ondemand.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.18.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.18/drivers/cpufreq/cpufreq_ondemand.c
@@ -393,8 +393,15 @@ static void dbs_check_cpu(struct cpu_dbs
 	 * policy. To be safe, we focus 10 points under the threshold.
 	 */
 	if (load < (dbs_tuners_ins.up_threshold - 10)) {
-		unsigned int freq_next =3D (policy->cur * load) /
+		unsigned int freq_next, freq_cur;
+
+		freq_cur =3D cpufreq_driver_getavg(policy);
+		if (!freq_cur)
+			freq_cur =3D policy->cur;
+
+		freq_next =3D (freq_cur * load) /
 			(dbs_tuners_ins.up_threshold - 10);
+
 		if (!dbs_tuners_ins.powersave_bias) {
 			__cpufreq_driver_target(policy, freq_next,
 					CPUFREQ_RELATION_L);
Index: linux-2.6.18/include/asm-i386/msr.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.18.orig/include/asm-i386/msr.h
+++ linux-2.6.18/include/asm-i386/msr.h
@@ -125,6 +125,9 @@ static inline void wrmsrl (unsigned long
 #define MSR_IA32_PERF_STATUS		0x198
 #define MSR_IA32_PERF_CTL		0x199
=20
+#define MSR_IA32_MPERF			0xE7
+#define MSR_IA32_APERF			0xE8
+
 #define MSR_IA32_THERM_CONTROL		0x19a
 #define MSR_IA32_THERM_INTERRUPT	0x19b
 #define MSR_IA32_THERM_STATUS		0x19c
Index: linux-2.6.18/include/asm-x86_64/msr.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.18.orig/include/asm-x86_64/msr.h
+++ linux-2.6.18/include/asm-x86_64/msr.h
@@ -307,6 +307,9 @@ static inline unsigned int cpuid_edx(uns
 #define MSR_IA32_PERF_STATUS		0x198
 #define MSR_IA32_PERF_CTL		0x199
=20
+#define MSR_IA32_MPERF			0xE7
+#define MSR_IA32_APERF			0xE8
+
 #define MSR_IA32_THERM_CONTROL		0x19a
 #define MSR_IA32_THERM_INTERRUPT	0x19b
 #define MSR_IA32_THERM_STATUS		0x19c
Index: linux-2.6.18/include/linux/cpufreq.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.18.orig/include/linux/cpufreq.h
+++ linux-2.6.18/include/linux/cpufreq.h
@@ -172,6 +172,8 @@ extern int __cpufreq_driver_target(struc
 				   unsigned int relation);
=20
=20
+extern int cpufreq_driver_getavg(struct cpufreq_policy *policy);
+
 int cpufreq_register_governor(struct cpufreq_governor *governor);
 void cpufreq_unregister_governor(struct cpufreq_governor *governor);
=20
@@ -204,6 +206,7 @@ struct cpufreq_driver {
 	unsigned int	(*get)	(unsigned int cpu);
=20
 	/* optional */
+	unsigned int (*getavg)	(unsigned int cpu);
 	int	(*exit)		(struct cpufreq_policy *policy);
 	int	(*suspend)	(struct cpufreq_policy *policy, pm_message_t pmsg);
 	int	(*resume)	(struct cpufreq_policy *policy);
