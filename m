From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/2] Move policy's governor initialisation out of low-level
	drivers into cpufreq core
Date: Fri, 20 Jul 2007 19:37:56 +0200
Message-ID: <1184953076.15328.258.camel@queen.suse.de>
Reply-To: trenn@suse.de
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

Move policy's governor initialisation out of low-level drivers into cpufreq core


Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 arch/arm/mach-imx/cpufreq.c                       |    1 -
 arch/arm/mach-sa1100/cpu-sa1110.c                 |    1 -
 arch/arm/plat-omap/cpu-omap.c                     |    1 -
 arch/blackfin/mach-bf533/cpu.c                    |    2 --
 arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c       |    1 -
 arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c    |    1 -
 arch/i386/kernel/cpu/cpufreq/e_powersaver.c       |    1 -
 arch/i386/kernel/cpu/cpufreq/elanfreq.c           |    1 -
 arch/i386/kernel/cpu/cpufreq/gx-suspmod.c         |    1 -
 arch/i386/kernel/cpu/cpufreq/longhaul.c           |    1 -
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c        |    1 -
 arch/i386/kernel/cpu/cpufreq/powernow-k6.c        |    1 -
 arch/i386/kernel/cpu/cpufreq/powernow-k7.c        |    2 --
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c        |    1 -
 arch/i386/kernel/cpu/cpufreq/sc520_freq.c         |    1 -
 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    1 -
 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c      |    1 -
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c      |    1 -
 arch/ia64/kernel/cpufreq/acpi-cpufreq.c           |    2 --
 arch/powerpc/platforms/cell/cbe_cpufreq.c         |    1 -
 arch/powerpc/platforms/pasemi/cpufreq.c           |    2 --
 arch/powerpc/platforms/powermac/cpufreq_32.c      |    1 -
 arch/powerpc/platforms/powermac/cpufreq_64.c      |    1 -
 arch/sh/kernel/cpufreq.c                          |    1 -
 arch/sparc64/kernel/us2e_cpufreq.c                |    1 -
 drivers/cpufreq/cpufreq.c                         |    2 ++
 26 files changed, 2 insertions(+), 29 deletions(-)

Index: cpufreq/drivers/cpufreq/cpufreq.c
===================================================================
--- cpufreq.orig/drivers/cpufreq/cpufreq.c
+++ cpufreq/drivers/cpufreq/cpufreq.c
@@ -763,6 +763,8 @@ static int cpufreq_add_dev (struct sys_d
 	init_completion(&policy->kobj_unregister);
 	INIT_WORK(&policy->update, handle_update);
 
+	/* Set governor before ->init, so that driver could check it */
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
 	 */
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
@@ -1208,7 +1208,6 @@ static int __cpuinit powernowk8_cpu_init
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
 
-	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	if (cpu_family == CPU_HW_PSTATE)
 		pol->cpus = cpumask_of_cpu(pol->cpu);
 	else
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
@@ -290,7 +290,6 @@ static int speedstep_cpu_init(struct cpu
 		(speed / 1000));
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -660,7 +660,6 @@ static int acpi_cpufreq_cpu_init(struct 
 			policy->cpuinfo.transition_latency =
 			    perf->states[i].transition_latency * 1000;
 	}
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	data->max_freq = perf->states[0].core_frequency * 1000;
 	/* table init */
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
@@ -363,7 +363,6 @@ static int nforce2_cpu_init(struct cpufr
 	policy->cur = nforce2_get(policy->cpu);
 	policy->min = policy->cpuinfo.min_freq;
 	policy->max = policy->cpuinfo.max_freq;
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	return 0;
 }
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
@@ -253,7 +253,6 @@ static int eps_cpu_init(struct cpufreq_p
 		f_table[k].frequency = CPUFREQ_TABLE_END;
 	}
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 140000; /* 844mV -> 700mV in ns */
 	policy->cur = fsb * current_multiplier;
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/elanfreq.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/elanfreq.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/elanfreq.c
@@ -219,7 +219,6 @@ static int elanfreq_cpu_init(struct cpuf
 	}
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = elanfreq_get_cpu_frequency(0);
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
@@ -420,7 +420,6 @@ static int cpufreq_gx_cpu_init(struct cp
 		policy->min = maxfreq / POLICY_MIN_DIV;
 	policy->max = maxfreq;
 	policy->cur = curfreq;
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = maxfreq / max_duration;
 	policy->cpuinfo.max_freq = maxfreq;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/longhaul.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -873,7 +873,6 @@ static int __init longhaul_cpu_init(stru
 	if ((longhaul_version != TYPE_LONGHAUL_V1) && (scale_voltage != 0))
 		longhaul_setup_voltagescaling();
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 200000;	/* nsec */
 	policy->cur = calc_speed(longhaul_get_cpu_mult());
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
@@ -229,7 +229,6 @@ static int cpufreq_p4_cpu_init(struct cp
 	cpufreq_frequency_table_get_attr(p4clockmod_table, policy->cpu);
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 1000000; /* assumed */
 	policy->cur = stock_freq;
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
@@ -160,7 +160,6 @@ static int powernow_k6_cpu_init(struct c
 	}
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = busfreq * max_multiplier;
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
@@ -637,8 +637,6 @@ static int __init powernow_cpu_init (str
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
 				minimum_speed/1000, maximum_speed/1000);
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cpuinfo.transition_latency = cpufreq_scale(2000000UL, fsb, latency);
 
 	policy->cur = powernow_get(0);
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
@@ -111,7 +111,6 @@ static int sc520_freq_cpu_init(struct cp
 		return -ENODEV;
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 1000000; /* 1ms */
 	policy->cur = sc520_freq_get_cpu_frequency(0);
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
@@ -393,7 +393,6 @@ static int centrino_cpu_init(struct cpuf
 
 	freq = get_cur_freq(policy->cpu);
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 10000; /* 10uS transition latency */
 	policy->cur = freq;
 
Index: cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
===================================================================
--- cpufreq.orig/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -348,7 +348,6 @@ static int speedstep_cpu_init(struct cpu
 		(speed / 1000));
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cur = speed;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
Index: cpufreq/arch/arm/mach-imx/cpufreq.c
===================================================================
--- cpufreq.orig/arch/arm/mach-imx/cpufreq.c
+++ cpufreq/arch/arm/mach-imx/cpufreq.c
@@ -269,7 +269,6 @@ static int __init imx_cpufreq_driver_ini
 		return -EINVAL;
 
 	policy->cur = policy->min = policy->max = imx_get_speed(0);
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 8000;
 	policy->cpuinfo.max_freq = 200000;
 	 /* Manual states, that PLL stabilizes in two CLK32 periods */
Index: cpufreq/arch/arm/mach-sa1100/cpu-sa1110.c
===================================================================
--- cpufreq.orig/arch/arm/mach-sa1100/cpu-sa1110.c
+++ cpufreq/arch/arm/mach-sa1100/cpu-sa1110.c
@@ -331,7 +331,6 @@ static int __init sa1110_cpu_init(struct
 	if (policy->cpu != 0)
 		return -EINVAL;
 	policy->cur = policy->min = policy->max = sa11x0_getspeed(0);
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 59000;
 	policy->cpuinfo.max_freq = 287000;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
Index: cpufreq/arch/arm/plat-omap/cpu-omap.c
===================================================================
--- cpufreq.orig/arch/arm/plat-omap/cpu-omap.c
+++ cpufreq/arch/arm/plat-omap/cpu-omap.c
@@ -108,7 +108,6 @@ static int __init omap_cpu_init(struct c
 	if (policy->cpu != 0)
 		return -EINVAL;
 	policy->cur = policy->min = policy->max = omap_getspeed(0);
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = clk_round_rate(mpu_clk, 0) / 1000;
 	policy->cpuinfo.max_freq = clk_round_rate(mpu_clk, VERY_HI_RATE) / 1000;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
Index: cpufreq/arch/blackfin/mach-bf533/cpu.c
===================================================================
--- cpufreq.orig/arch/blackfin/mach-bf533/cpu.c
+++ cpufreq/arch/blackfin/mach-bf533/cpu.c
@@ -118,8 +118,6 @@ static int __init __bf533_cpu_init(struc
 	if (policy->cpu != 0)
 		return -EINVAL;
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	/*Now ,only support one cpu */
 	policy->cur = bf533_getfreq(0);
Index: cpufreq/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
===================================================================
--- cpufreq.orig/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
+++ cpufreq/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
@@ -323,8 +323,6 @@ acpi_cpufreq_cpu_init (
 			    data->acpi_data.states[i].transition_latency * 1000;
 		}
 	}
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cur = processor_get_freq(data, policy->cpu);
 
 	/* table init */
Index: cpufreq/arch/powerpc/platforms/cell/cbe_cpufreq.c
===================================================================
--- cpufreq.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
+++ cpufreq/arch/powerpc/platforms/cell/cbe_cpufreq.c
@@ -238,7 +238,6 @@ static int cbe_cpufreq_cpu_init(struct c
 		pr_debug("%d: %d\n", i, cbe_freqs[i].frequency);
 	}
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	/* if DEBUG is enabled set_pmode() measures the correct latency of a transition */
 	policy->cpuinfo.transition_latency = 25000;
 
Index: cpufreq/arch/powerpc/platforms/pasemi/cpufreq.c
===================================================================
--- cpufreq.orig/arch/powerpc/platforms/pasemi/cpufreq.c
+++ cpufreq/arch/powerpc/platforms/pasemi/cpufreq.c
@@ -195,8 +195,6 @@ static int pas_cpufreq_cpu_init(struct c
 		pr_debug("%d: %d\n", i, pas_freqs[i].frequency);
 	}
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cpuinfo.transition_latency = get_gizmo_latency();
 
 	cur_astate = get_cur_astate(policy->cpu);
Index: cpufreq/arch/powerpc/platforms/powermac/cpufreq_32.c
===================================================================
--- cpufreq.orig/arch/powerpc/platforms/powermac/cpufreq_32.c
+++ cpufreq/arch/powerpc/platforms/powermac/cpufreq_32.c
@@ -410,7 +410,6 @@ static int pmac_cpufreq_cpu_init(struct 
 	if (policy->cpu != 0)
 		return -ENODEV;
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency	= CPUFREQ_ETERNAL;
 	policy->cur = cur_freq;
 
Index: cpufreq/arch/powerpc/platforms/powermac/cpufreq_64.c
===================================================================
--- cpufreq.orig/arch/powerpc/platforms/powermac/cpufreq_64.c
+++ cpufreq/arch/powerpc/platforms/powermac/cpufreq_64.c
@@ -357,7 +357,6 @@ static unsigned int g5_cpufreq_get_speed
 
 static int g5_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = g5_cpu_freqs[g5_query_freq()].frequency;
 	/* secondary CPUs are tied to the primary one by the
Index: cpufreq/arch/sh/kernel/cpufreq.c
===================================================================
--- cpufreq.orig/arch/sh/kernel/cpufreq.c
+++ cpufreq/arch/sh/kernel/cpufreq.c
@@ -159,7 +159,6 @@ static int sh_cpufreq_cpu_init(struct cp
 	sh_freqs[SH_FREQ_MIN].frequency = min_freq;
 
 	/* cpuinfo and default policy values */
-	policy->governor                   = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur                        = max_freq;
 
Index: cpufreq/arch/sparc64/kernel/us2e_cpufreq.c
===================================================================
--- cpufreq.orig/arch/sparc64/kernel/us2e_cpufreq.c
+++ cpufreq/arch/sparc64/kernel/us2e_cpufreq.c
@@ -326,7 +326,6 @@ static int __init us2e_freq_cpu_init(str
 	table[2].index = 5;
 	table[3].frequency = CPUFREQ_TABLE_END;
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 0;
 	policy->cur = clock_tick;
