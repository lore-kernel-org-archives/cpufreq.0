From: Hendrik Muhs <Hendrik.Muhs@web.de>
Subject: [Patch] powernow-k7-manual was Re: [Patch] small cleanup for
	powernow-k7.c
Date: Tue, 25 Jan 2005 21:47:58 +0100
Message-ID: <200501252147.59169.Hendrik.Muhs@web.de>
References: <200501202138.35324.Hendrik.Muhs@web.de>
	<20050121015736.GB32430@redhat.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_/Br9BEbI7c5Z9ou"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
In-Reply-To: <20050121015736.GB32430@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Adam Jones <adam@yggdrasl.demon.co.uk>, cpufreq@zenii.linux.org.uk, Jarkko Lavinen <jlavi@iki.fi>

--Boundary-00=_/Br9BEbI7c5Z9ou
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

[...]
>  > I see that this feature is not official supported by vendors and
>  > although I have implemented some mechanisms which should prevent serious
>  > CPU damage it can not (by design) completly safe (system may freeze on
>  > some setups).
>
> I've slowly warmed to the *idea* of having some means for supporting
> mobile chips in desktops, as it does seem to be happening more and more
> for some reason. I didn't look at your last patch to be honest, so I can't
> comment on whether its fit for merging before I take a look.

An updated version of the patch is attached to this mail. It is against 
2.6.11-rc2, so you should not have problems to appy it.

To be ready for testing and maybe inclusion into one of the next kernel 
releases (or mm tree) i have made it optional (see the Kconfig patch). The 
txt file explains how to use it (for Documentation/cpu-freq).

(the patch also readds a fix for a comment, this was not included with the 
last patch)

>
>  > On the other side their is demand for this feature (not only for me). I
>  > do not know what to do with it in the future. If the door for inclusion
>  > in mainline is closed I would consider make some kind of source package
>  > and forking/renaming the driver so that it can be build independent from
>  > kernel.
>
> Lets see what we can do to get it included.  Maintaining out of tree
> modules is a real pain in the ass for all concerned, including end-users.
> Rather than see endless support requests for 'why wont it build' on
> cpufreq-list I'd rather we did what we could to get things like this
> included.
>

Ack, and making it optional gives distributors the chance to decide if they 
want this feature in their precompiled kernels. 

> I'm holding off on 'feature' type things for 2.6.11 from now on, the next
> round of cpufreq bits going to Linus should be only bug fixes, so hopefully
> by 2.6.12 time, we can close the book on this one. This gives us enough
> time to give it some exposure in Andrew's -mm tree too.

No, stress. 

Just having enough time to discuss it. 

To the list: Please complain now!

Hendrik
P.S. I have used this patch nearly 4 months now without any problems, also  
people on the list reported success. I use it for a HTPC which has a MATX 
mainboard and a XP-M 2400+. With reduced Vcore (BIOS setting), FSB of 100 Mhz 
(instead of 133 Mhz) and this patch I am able to run the CPU without a fan.
P.P.S. Kudos also to Adam Jones which inspired the patch, Jarkko Lavinen for 
improving it (fsb option) and all others not named here

--Boundary-00=_/Br9BEbI7c5Z9ou
Content-Type: text/plain; charset="iso-8859-1";
	name="cpufreq-powernow-k7-manual.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="cpufreq-powernow-k7-manual.txt"

The powernow-k7-manual option lets you manual set the PST table
(powerswitching table) with module options.

This is useful if you have a laptop with a broken BIOS or if you use a
mobile CPU on a desktop motherboard, which BIOS does not have PST tables.


The modules has the following options:

    overwrite_table:    activates the manually settings, set it to >=1
    multiplier:         specifies an array of multipliers
    voltage:            specifies an array of VCore voltages (default
                        BIOS settings)
    switch_latency:     sets the state transition latency in
                        microseconds (default 200us)
    fsb:                sets the frontsidebus (default calculated from
                        BIOS settings)

Odd multipliers must be multiplied by 10, for example a multiplier of
6.5 becomes 65.

Voltages must be given in mV, the following voltages are valid:
925, 950, 975, 1000, 1025, 1050, 1075, 1100, 1125, 1150, 1175, 1200,
1225, 1250, 1275, 1300, 1350, 1400, 1450, 1500, 1550, 1600, 1650, 1700,
1750, 1800, 1850, 1900, 1950, 2000.

The patch does not allow overclocking: higher multipliers and/or voltages than
the maximum specified on CPU will be ignored.
You do not have to specify voltages, in this case the CPU default will be used
(on some boards voltage switching is not possible anyway).

example usage:

modprobe powernow-k7 overwrite_table=1 multiplier=3,4,5,6,7,8,9,10

Disclaimer:
It should not be possible to burn the CPU, but some combinations could crash
the system. We give no guaranty  that it works for your system and/or any
possibly resulting hardware damage.

--Boundary-00=_/Br9BEbI7c5Z9ou
Content-Type: text/x-diff; charset="iso-8859-1";
	name="powernow-k7-manual.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="powernow-k7-manual.patch"

--- linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c.orig	2005-01-25 19:54:10.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2005-01-25 20:06:12.000000000 +0100
@@ -66,7 +66,7 @@
 };
 #endif
 
-#ifdef CONFIG_CPU_FREQ_DEBUG
+#if defined CONFIG_CPU_FREQ_DEBUG || defined CONFIG_X86_POWERNOW_K7_MANUAL
 /* divide by 1000 to get VCore voltage in V. */
 static int mobile_vid_table[32] = {
     2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
@@ -76,7 +76,7 @@
 };
 #endif
 
-/* divide by 10 to get FID. */
+/* divide by 10 to get multiplier. */
 static int fid_codes[32] = {
     110, 115, 120, 125, 50, 55, 60, 65,
     70, 75, 80, 85, 90, 95, 100, 105,
@@ -84,6 +84,31 @@
     150, 225, 160, 165, 170, 180, -1, -1,
 };
 
+#ifdef CONFIG_X86_POWERNOW_K7_MANUAL
+/* translation table for even multiplier to fid */
+static int even_multiplier[20] = {
+       16, 18, 4, 6, 8, 10, 12, 14,    // 3, 4, 5, 6, 7 ,8 , 9, 10
+       0, 2, 20, 22, 24, 26, 28, 29,   // 11, 12, 13, 14, 15, 16, 17, 18
+       17, 19, 23, 25,         // 19, 20, 21, 22
+};
+
+/* translation table for odd multiplier to fid*/
+static int odd_multiplier[9] = {
+       5, 7, 9, 11, 13, 15, 1, 3,      // 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5, 12.5
+       21,                     // 13.5
+};
+
+/* This parameters can be used to manually overwrite the tables */
+static int overwrite_table = 0;
+#define MAX_PST 10
+static int multiplier_arr_size = MAX_PST;
+static int voltage_arr_size = MAX_PST;
+static int multiplier[MAX_PST] = {[0 ... (MAX_PST - 1)] = 0 };
+static int voltage[MAX_PST] = {[0 ... (MAX_PST - 1)] = 0 };
+static int switch_latency = 0;
+#endif /* CONFIG_X86_POWERNOW_K7_MANUAL */
+
+
 /* This parameter is used in order to force ACPI instead of legacy method for
  * configuration purpose.
  */
@@ -97,7 +122,7 @@
 static unsigned int minimum_speed=-1;
 static unsigned int maximum_speed;
 static unsigned int number_scales;
-static unsigned int fsb;
+static unsigned int fsb=0;
 static unsigned int latency;
 static char have_a0;
 
@@ -413,6 +438,143 @@
 }
 #endif
 
+#ifdef CONFIG_X86_POWERNOW_K7_MANUAL
+static int powernow_manual_settings(union msr_fidvidstatus *fidvidstatus)
+{
+       int i, k, validentry;
+       unsigned int max_multiplier, max_voltage;
+       unsigned int speed, cm;
+       u8 vid, fid;
+       static struct cpufreq_frequency_table *powernow_table_tmp;
+
+       if (switch_latency > 0) {
+               if (switch_latency < 100) {
+                       printk(KERN_INFO PFX
+                              "Settling time passed as %d microseconds."
+                              "Should be at least 100. Correcting.\n",
+                              switch_latency);
+                       switch_latency = 100;
+               }
+               latency = switch_latency;
+       } else {
+               latency = 200;
+       }
+       dprintk("Settling Time: %d microseconds.\n", latency);
+
+       /* get number of specified multipliers */
+       number_scales = multiplier_arr_size;
+       for (i = 0; i < multiplier_arr_size; i++) {
+               if (multiplier[i] == 0) {
+                       number_scales = i;
+                       break;
+               }
+       }
+
+       /* get maximum values */
+       max_multiplier = fid_codes[fidvidstatus->bits.MFID];
+       max_voltage = mobile_vid_table[fidvidstatus->bits.MVID];
+
+       /* allocate memory */
+       powernow_table =
+           kmalloc((sizeof(struct cpufreq_frequency_table) *
+                    (number_scales + 1)), GFP_KERNEL);
+       if (!powernow_table)
+               return -ENOMEM;
+       memset(powernow_table, 0,
+              (sizeof(struct cpufreq_frequency_table) * (number_scales + 1)));
+
+       k = 0;
+       for (i = 0; i < number_scales; i++) {
+               validentry = 0;
+               if (multiplier[i] != 0) {
+                       /* fix multiplier */
+                       if (multiplier[i] < 30)
+                               multiplier[i] = multiplier[i] * 10;
+                       if (multiplier[i] < max_multiplier) {
+                               cm = (multiplier[i] / 10);
+
+                               /* check if odd or even muliplier */
+                               if (multiplier[i] % 10) {
+                                       /* odd multiplier */
+                                       if (cm == 16) {
+                                               /* hardcoded because 14.5 and 15.5 fids not possible */
+                                               fid = 27;
+                                               validentry = 1;
+                                       } else if ((cm > 4) && (cm < 14)) {
+                                               fid = odd_multiplier[cm - 5];
+                                               validentry = 1;
+                                       }
+                               } else {
+                                       /* even_multiplier */
+                                       if ((cm < 23) && (cm > 2)) {
+                                               fid = even_multiplier[cm - 3];
+                                               validentry = 1;
+                                       }
+                               }
+                       }
+               }
+
+               if (validentry) {
+                       /* if no voltage specified use CPU default */
+                       if (voltage[i] == 0)
+                               voltage[i] = max_voltage;
+                       /* we do not allow higher voltages than the CPU's maximum 925 mV is the minimum */
+                       if ((voltage[i] <= max_voltage) && (voltage[i] >= 925)) {
+                               if (voltage[i] >= 1300) {
+                                       vid = 40 - (voltage[i] / 50);
+                               } else {
+                                       vid = 67 - (voltage[i] / 25);
+                               }
+                               /* calculate speed */
+                               speed = fsb * fid_codes[fid] / 10;
+                               powernow_table[k].frequency = speed;
+                               powernow_table[k].index = fid;  /*lower 8 bits */
+                               powernow_table[k].index |= (vid << 8);  /*upper 8 bits */
+
+                               if (speed < minimum_speed)
+                                       minimum_speed = speed;
+                               if (speed > maximum_speed)
+                                       maximum_speed = speed;
+
+                               dprintk("   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
+                                       fid_codes[fid] / 10,
+                                       fid_codes[fid] % 10, speed / 1000);
+                               dprintk("VID: 0x%x (%d.%03dV)\n", vid,
+                                       mobile_vid_table[vid] / 1000,
+                                       mobile_vid_table[vid] % 1000);
+                               k++;
+                       }
+               } else {
+                       // invalid entry
+                       dprintk("Entry %d is invalid\n", i + 1);
+               }
+       }
+       if (k < number_scales) {
+               /* some entrys were invalid need to realloc table */
+               number_scales = k;
+               powernow_table_tmp =
+                   kmalloc((sizeof(struct cpufreq_frequency_table) *
+                            (number_scales + 1)), GFP_KERNEL);
+               if (!powernow_table_tmp) {
+                       kfree(powernow_table);
+                       return -ENOMEM;
+               }
+               memcpy(powernow_table_tmp, powernow_table,
+                      (sizeof(struct cpufreq_frequency_table) *
+                       (number_scales + 1)));
+               kfree(powernow_table);
+               powernow_table = powernow_table_tmp;
+       }
+
+       /* Terminate frequency list */
+       powernow_table[number_scales].frequency = CPUFREQ_TABLE_END;
+       powernow_table[number_scales].index = 0;
+
+       return 0;
+}
+#endif /* CONFIG_X86_POWERNOW_K7_MANUAL */
+
+
 static int powernow_decode_bios (int maxfid, int startvid)
 {
 	struct psb_s *psb;
@@ -585,6 +747,18 @@
 		return -ENODEV;
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
+#ifdef CONFIG_X86_POWERNOW_K7_MANUAL
+       if (fsb) {
+               if (fsb < 1000)
+                       fsb *= 1000;
+
+               if (fsb < 1000 || fsb > 1000000) {
+                       printk(KERN_WARNING PFX "FSB %ukhz out of range\n",
+                              fsb);
+                       return -EINVAL;
+               }
+       } else
+#endif
 
 	/* A K7 with powernow technology is set to max frequency by BIOS */
 	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
@@ -597,6 +771,12 @@
 	if (dmi_check_system(powernow_dmi_table) || acpi_force) {
 		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
 		result = powernow_acpi_init();
+#ifdef CONFIG_X86_POWERNOW_K7_MANUAL
+        } else if (overwrite_table) {
+                printk(KERN_INFO PFX
+                       "Overwriting PST table with manual settings\n");
+                result = powernow_manual_settings(&fidvidstatus);
+#endif
 	} else {
 		result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
 		if (result) {
@@ -681,6 +861,22 @@
 module_param(acpi_force,  int, 0444);
 MODULE_PARM_DESC(acpi_force, "Force ACPI to be used.");
 
+#ifdef CONFIG_X86_POWERNOW_K7_MANUAL
+module_param(overwrite_table, int, 0444);
+MODULE_PARM_DESC(overwrite_table, "overwrite table with manually settings");
+module_param(fsb, uint, 0444);
+MODULE_PARM_DESC(fsb, "(MHz) overrides the calculated FSB");
+module_param_array(multiplier, int, &multiplier_arr_size, 0444);
+MODULE_PARM_DESC(multiplier,
+                "Specifiy up to 10 multipliers, multiply them by 10: 5->50, 5.5->55");
+module_param_array(voltage, int, &voltage_arr_size, 0444);
+MODULE_PARM_DESC(voltage,
+                "Specify voltages in respect to the given multipliers, specify them in mV: 1.275V -> 1275");
+module_param(switch_latency, int, 0444);
+MODULE_PARM_DESC(switch_latency,
+                "Set state transition latency in microseconds (default 200us)");
+#endif
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");

--Boundary-00=_/Br9BEbI7c5Z9ou
Content-Type: text/x-diff; charset="iso-8859-1";
	name="powernow-k7-Kconfig.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="powernow-k7-Kconfig.patch"

--- linux/arch/i386/kernel/cpu/cpufreq/Kconfig.orig	2005-01-25 19:54:17.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2005-01-25 20:07:52.000000000 +0100
@@ -71,6 +71,17 @@
 	depends on ((X86_POWERNOW_K7 = "m" && ACPI_PROCESSOR) || (X86_POWERNOW_K7 = "y" && ACPI_PROCESSOR = "y"))
 	default y
 
+config X86_POWERNOW_K7_MANUAL
+        bool "Manual setting of PowerNow! table for AMD Mobile Athlon/Duron."
+        depends on X86_POWERNOW_K7
+        default n
+        help
+          This adds the possibility to manual change the PST table.
+
+          For details, take a look at <file:Documentation/cpu-freq/>.
+
+          If in doubt, say N.
+
 config X86_POWERNOW_K8
 	tristate "AMD Opteron/Athlon64 PowerNow!"
 	depends on CPU_FREQ_TABLE && EXPERIMENTAL

--Boundary-00=_/Br9BEbI7c5Z9ou
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_/Br9BEbI7c5Z9ou--

