From: John Steele Scott <toojays@toojays.net>
Subject: [PATCH] cpufreq support for 7447A on 2004 iBooks
Date: Sat, 5 Jun 2004 18:45:58 +0930
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200406051846.50718.toojays@toojays.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: Text/Plain; charset="us-ascii"
To: linuxppc-dev list <linuxppc-dev@lists.linuxppc.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christiaan Welvaart <cjw@daneel.dyndns.org>, cpufreq@www.linux.org.uk

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Okay, thanks to some tips from Benjamin Herrenschmidt, I now have a patch=20
against 2.6.6 which lets you control dynamic frequency scaling on the lates=
t=20
model iBook G4. I imagine that this same method would apply to the new=20
PowerBooks as well.

cheers,

John

diff -upr -X dontdiff linux/arch/ppc/kernel/misc.S=20
linux-2.6.6-dfs/arch/ppc/kernel/misc.S
=2D --- linux/arch/ppc/kernel/misc.S	2004-06-05 18:02:48.000000000 +0930
+++ linux-2.6.6-dfs/arch/ppc/kernel/misc.S	2004-05-28 12:47:22.000000000 +0=
930
@@ -253,6 +253,24 @@ _GLOBAL(low_choose_750fx_pll)
 	mtmsr	r7
 	blr
=20
+_GLOBAL(choose_7447a_dfs)
+	/* Clear MSR:EE */
+	mfmsr	r7
+	rlwinm	r0,r7,0,17,15
+	mtmsr	r0
+=09
+	/* Calc new HID1 value */
+	mfspr	r4,SPRN_HID1
+	insrwi	r4,r3,1,9	/* insert parameter into bit 9 */
+	sync
+	mtspr	SPRN_HID1,r4
+	sync
+	isync
+
+	/* Return */
+	mtmsr	r7
+	blr
+
 #endif /* CONFIG_CPU_FREQ_PMAC && CONFIG_6xx */
=20
 /* void local_save_flags_ptr(unsigned long *flags) */
diff -upr -X dontdiff linux/arch/ppc/platforms/pmac_cpufreq.c=20
linux-2.6.6-dfs/arch/ppc/platforms/pmac_cpufreq.c
=2D --- linux/arch/ppc/platforms/pmac_cpufreq.c	2004-06-05 18:02:48.0000000=
00=20
+0930
+++ linux-2.6.6-dfs/arch/ppc/platforms/pmac_cpufreq.c	2004-06-05=20
18:08:06.000000000 +0930
@@ -47,6 +47,7 @@
 #warning "WARNING, CPUFREQ not recommended on SMP kernels"
 #endif
=20
+extern void choose_7447a_dfs(int dfs);
 extern void low_choose_750fx_pll(int pll);
 extern void low_sleep_handler(void);
 extern void openpic_suspend(struct sys_device *sysdev, u32 state);
@@ -61,6 +62,7 @@ static unsigned int cur_freq;
 /* Clean that up some day ... use a func ptr or at least an enum... */
 static int cpufreq_uses_pmu;
 static int cpufreq_uses_gpios;
+static int cpufreq_uses_dfs;
=20
 static u32 voltage_gpio;
 static u32 frequency_gpio;
@@ -123,6 +125,29 @@ static int __pmac cpu_750fx_cpu_speed(in
 	return 0;
 }
=20
+/* Switch CPU speed using DFS */
+static int __pmac dfs_set_cpu_speed(int low_speed)
+{
+	/* If ramping up, set voltage first */
+	if (low_speed =3D=3D 0) {
+		pmac_call_feature(PMAC_FTR_WRITE_GPIO, NULL, voltage_gpio, 0x05);
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		schedule_timeout(HZ/1000);
+	}
+
+	/* set frequency */
+	choose_7447a_dfs(low_speed);
+
+	/* If ramping down, set voltage last */
+	if (low_speed =3D=3D 1) {
+		pmac_call_feature(PMAC_FTR_WRITE_GPIO, NULL, voltage_gpio, 0x04);
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		schedule_timeout(HZ/1000);
+	}
+
+	return 0;
+}
+
 /* Switch CPU speed using slewing GPIOs
  */
 static int __pmac gpios_set_cpu_speed(unsigned int low_speed)
@@ -273,6 +298,8 @@ static int __pmac do_set_cpu_speed(int s
 		rc =3D pmu_set_cpu_speed(speed_mode);
 	else if (cpufreq_uses_gpios)
 		rc =3D gpios_set_cpu_speed(speed_mode);
+	else if (cpufreq_uses_dfs)
+		rc =3D dfs_set_cpu_speed(speed_mode);
 	else
 		rc =3D cpu_750fx_cpu_speed(speed_mode);
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
@@ -346,6 +373,7 @@ static struct cpufreq_driver pmac_cpufre
  *  - iBook2 500 (PMU based, 400Mhz & 500Mhz)
  *  - iBook2 700 (CPU based, 400Mhz & 700Mhz, support low voltage)
  *  - Recent MacRISC3 machines
+ *  - iBook G4s with 7447A CPUs
  */
 static int __init pmac_cpufreq_setup(void)
 {
@@ -375,6 +403,32 @@ static int __init pmac_cpufreq_setup(voi
 		struct device_node *freq_gpio_np =3D of_find_node_by_name(NULL,=20
"frequency-gpio");
 		struct device_node *slew_done_gpio_np =3D of_find_node_by_name(NULL,=20
"slewing-done");
=20
+		/*  Check for 7447A based iBook G4 */
+		if (machine_is_compatible("PowerBook6,5")) {
+			/* OF only reports the high frequency */
+			hi_freq =3D cur_freq;
+			low_freq =3D cur_freq/2;
+			if(mfspr(HID1) & HID1_DFS)
+				cur_freq =3D low_freq;
+			else
+				cur_freq =3D hi_freq;
+
+			volt_gpio_np =3D of_find_node_by_name(NULL, "cpu-vcore-select");
+			if (!volt_gpio_np){
+				printk(KERN_ERR "cpufreq: missing cpu-vcore-select gpio\n");
+				goto out;
+			}
+
+			u32 *reg =3D (u32 *)get_property(volt_gpio_np, "reg", NULL);
+			voltage_gpio =3D *reg;
+
+			cpufreq_uses_pmu =3D 0;
+			cpufreq_uses_gpios =3D 0;
+			cpufreq_uses_dfs =3D 1;
+			has_freq_ctl =3D 1;
+			goto out;
+		}
+
 		/*
 		 * Check to see if it's GPIO driven or PMU only
 		 *
@@ -497,7 +551,7 @@ out:
 	printk(KERN_INFO "Registering PowerMac CPU frequency driver\n");
 	printk(KERN_INFO "Low: %d Mhz, High: %d Mhz, Boot: %d Mhz, switch method:=
=20
%s\n",
 	       low_freq/1000, hi_freq/1000, cur_freq/1000,
=2D -	       cpufreq_uses_pmu ? "PMU" : (cpufreq_uses_gpios ? "GPIOs" : "CP=
U"));
+	       cpufreq_uses_pmu ? "PMU" : (cpufreq_uses_gpios ? "GPIOs" :=20
(cpufreq_uses_dfs ? "DFS" : "CPU")));
=20
 	return cpufreq_register_driver(&pmac_cpufreq_driver);
 }
diff -upr -X dontdiff linux/include/asm-ppc/reg.h=20
linux-2.6.6-dfs/include/asm-ppc/reg.h
=2D --- linux/include/asm-ppc/reg.h	2004-06-05 18:02:48.000000000 +0930
+++ linux-2.6.6-dfs/include/asm-ppc/reg.h	2004-06-05 18:37:00.778149544 +09=
30
@@ -174,6 +174,7 @@
=20
 #define SPRN_HID1	0x3F1		/* Hardware Implementation Register 1 */
 #define HID1_EMCP	(1<<31)		/* 7450 Machine Check Pin Enable */
+#define HID1_DFS	(1<<22)		/* 7447A Dynamic Frequency Scaling */
 #define HID1_PC0	(1<<16)		/* 7450 PLL_CFG[0] */
 #define HID1_PC1	(1<<15)		/* 7450 PLL_CFG[1] */
 #define HID1_PC2	(1<<14)		/* 7450 PLL_CFG[2] */
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Messages with missing or bad signatures may have been forged or mo=
dified in transit!

iD8DBQFAwY9T0BW7kPcXjRURAmobAKCcfS0ezlP/HFZ5m9fIH/8W+yjW1QCeJuPa
gY7l4GGoGBdqkrHs92w4M2o=3D
=3D4dca
=2D----END PGP SIGNATURE-----
