From: Jarkko Lavinen <jlavi@iki.fi>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Wed, 19 Jan 2005 17:35:09 +0200
Message-ID: <20050119153509.GA1409@smooth.piipiip.net>
References: <20050114114656.GA8185@smooth.piipiip.net>
	<200501171621.52998.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="82I3+IH0IqGh5yIs"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200501171621.52998.Hendrik.Muhs@web.de>
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
To: cpufreq@zenII.linux.org.uk
Cc: Hendrik Muhs <Hendrik.Muhs@web.de>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 04:21:52PM +0100, Hendrik Muhs wrote:
> Why not let the user specify the FSB? I mean if this is the issue, why do you 
> take the multiplier? I would add a module option "fsb" instead.

Attached is a patch for 2.6.10 with user specified fsb, as suggested above.
It is based on Hendrik's earlier patch.

It seems cpu clock value is so coarsely known that the FSB cannot be
accurately calculated from it even if the multiplier can be calculated.  
It is indeed better to just let user to specify fixed fsb value. 

I load the module with parameters:

  powernow-k7 overwrite_table=1 fsb=133333 multiplier=3,4,5,6,7,8,9

The fsb frequency can be given either in khz or mhz. khz will give more
digits and rounded cpu frequencies will look prettier. 

Using cpufreq.debug=2 on kernel command line. Dmesg says:

  powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
  powernow-k7: MSR reported multiplier 14.0
  powernow-k7: Current multiplier 9.0. CPU running at 1222MHz
  powernow-k7: FSB: 133.333 MHz
  powernow: Overwriting PST table with manual settings
  powernow-k7: Settling Time: 200 microseconds.
  powernow-k7:    FID: 0x10 (3.0x [400MHz])       VID: 0xb (1.450V)
  powernow-k7:    FID: 0x12 (4.0x [533MHz])       VID: 0xb (1.450V)
  powernow-k7:    FID: 0x4 (5.0x [667MHz])        VID: 0xb (1.450V)
  powernow-k7:    FID: 0x6 (6.0x [800MHz])        VID: 0xb (1.450V)
  powernow-k7:    FID: 0x8 (7.0x [933MHz])        VID: 0xb (1.450V)
  powernow-k7:    FID: 0xa (8.0x [1067MHz])       VID: 0xb (1.450V)
  powernow-k7:    FID: 0xc (9.0x [1200MHz])       VID: 0xb (1.450V)
  powernow: Minimum speed 400 MHz. Maximum speed 1200 MHz.


Frequency scaling works well and my system is stable. Voltage scaling 
is not available and I keep Vcore at 1.15V.

Jarkko Lavinen

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="powernow-k7.c-2610.diff"

--- linux-2.6.10/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-12-24 23:33:49.000000000 +0200
+++ linux-2.6.10-new/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2005-01-19 17:01:23.000000000 +0200
@@ -72,7 +72,7 @@
     2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
     1600, 1550, 1500, 1450, 1400, 1350, 1300, 0,
     1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
-    1075, 1050, 1024, 1000, 975, 950, 925, 0,
+    1075, 1050, 1025, 1000, 975, 950, 925, 0,
 };
 #endif
 
@@ -81,15 +81,39 @@
     110, 115, 120, 125, 50, 55, 60, 65,
     70, 75, 80, 85, 90, 95, 100, 105,
     30, 190, 40, 200, 130, 135, 140, 210,
-    150, 225, 160, 165, 170, 180, -1, -1,
+    150, 220, 160, 165, 170, 180, -1, -1,
 };
 
+/* translation table for even multiplier to fid */
+static int even_multiplier[20] = {
+    16, 18, 4, 6, 8, 10, 12, 14,	// 3, 4, 5, 6, 7 ,8 , 9, 10
+    0, 2, 20, 22, 24, 26, 28, 29,	// 11, 12, 13, 14, 15, 16, 17, 18
+    17, 19, 23, 25,		        // 19, 20, 21, 22
+};
+
+/* translation table for odd multiplier to fid*/
+static int odd_multiplier[9] = {
+    5, 7, 9, 11, 13, 15, 1, 3,	// 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5, 12.5
+    21,				// 13.5
+};
+
+
 /* This parameter is used in order to force ACPI instead of legacy method for
  * configuration purpose.
  */
 
 static int acpi_force;
 
+/* This parameters can be used to manually overwrite the tables */
+static int overwrite_table = 0;
+#define MAX_PST 10
+static int multiplier_arr_size = MAX_PST;
+static int voltage_arr_size = MAX_PST;
+static int multiplier[MAX_PST] = {[0 ... (MAX_PST - 1)] = 0 };
+static int voltage[MAX_PST] = {[0 ... (MAX_PST - 1)] = 0 };
+static int switch_latency = 0;
+static unsigned int fsb = 0;
+
 static struct cpufreq_frequency_table *powernow_table;
 
 static unsigned int can_scale_bus;
@@ -97,7 +121,6 @@
 static unsigned int minimum_speed=-1;
 static unsigned int maximum_speed;
 static unsigned int number_scales;
-static unsigned int fsb;
 static unsigned int latency;
 static char have_a0;
 
@@ -200,7 +223,7 @@
 
 		dprintk ("   FID: 0x%x (%d.%dx [%dMHz])  "
 			 "VID: 0x%x (%d.%03dV)\n", fid, fid_codes[fid] / 10, 
-			 fid_codes[fid] % 10, speed/1000, vid,	
+			 fid_codes[fid] % 10, (speed + 500)/1000, vid,	
 			 mobile_vid_table[vid]/1000,
 			 mobile_vid_table[vid]%1000);
 	}
@@ -374,7 +397,7 @@
 
 		dprintk ("   FID: 0x%x (%d.%dx [%dMHz])  "
 			 "VID: 0x%x (%d.%03dV)\n", fid, fid_codes[fid] / 10, 
-			 fid_codes[fid] % 10, speed/1000, vid,	
+			 fid_codes[fid] % 10, (speed + 500)/1000, vid,	
 			 mobile_vid_table[vid]/1000,
 			 mobile_vid_table[vid]%1000);
 
@@ -413,6 +436,131 @@
 }
 #endif
 
+static int powernow_manual_settings(union msr_fidvidstatus *fidvidstatus)
+{
+	int i,k, validentry;
+	unsigned int max_multiplier, max_voltage;
+	unsigned int speed, cm;
+	u8 vid, fid;
+	static struct cpufreq_frequency_table *powernow_table_tmp;
+	
+	if (switch_latency > 0) {
+		if (switch_latency < 100) {
+			printk (KERN_INFO PFX "Settling time passed as %d microseconds."
+				"Should be at least 100. Correcting.\n", switch_latency);
+			switch_latency = 100;
+		}
+		latency = switch_latency;
+	} else {
+		latency = 200;
+	}
+	dprintk ("Settling Time: %d microseconds.\n", latency);
+
+	/* get number of specified multipliers */
+	number_scales = multiplier_arr_size;
+	for (i=0; i < multiplier_arr_size; i++) {
+		if (multiplier[i] == 0) {
+			number_scales=i;
+			break;
+		}
+	}
+
+	/* get maximum values */
+	max_multiplier = fid_codes[fidvidstatus->bits.MFID];
+	max_voltage = mobile_vid_table[fidvidstatus->bits.MVID];
+
+	/* allocate memory */
+	powernow_table=kmalloc((sizeof(struct cpufreq_frequency_table) * (number_scales + 1)), GFP_KERNEL);
+	if (!powernow_table)
+		return -ENOMEM;
+	memset(powernow_table,0,(sizeof(struct cpufreq_frequency_table)*(number_scales+1)));
+
+	k=0;
+	for(i=0; i<number_scales; i++) {
+		validentry = 0;
+		if (multiplier[i] != 0) {
+			/* fix multiplier */
+			if (multiplier[i] < 30)
+				multiplier[i]=multiplier[i] * 10;
+
+			if (multiplier[i] < max_multiplier) {
+				cm = (multiplier[i]/10);
+
+				/* check if odd or even muliplier */
+				if (multiplier[i]%10) {
+					/* odd multiplier */
+					if (cm == 16) {
+						/* hardcoded because 14.5 and 15.5 fids not possible */
+						fid = 27;
+						validentry = 1;
+					} else if ((cm > 4) && (cm < 14)) {
+						fid= odd_multiplier[cm-5];
+						validentry = 1;
+					}
+				} else {
+					/* even_multiplier */
+					if ((cm < 23) && (cm > 2)) {
+						fid = even_multiplier[cm-3];
+						validentry=1;
+					}
+				}
+			}
+		}
+
+		if (validentry) {
+			/* if no voltage specified use CPU default */
+			if (voltage[i] == 0)
+				voltage[i] = max_voltage;
+
+			/* we do not allow higher voltages than the CPU's maximum
+			   925 mV is the minimum */
+			if ((voltage[i] <= max_voltage) && (voltage[i] >= 925)) {
+				if (voltage[i] >= 1300) {
+					vid = 40 - (voltage[i]/50);
+				} else {
+					vid = 67 - (voltage[i]/25);
+				}
+				/* calculate speed */
+				speed = fsb * fid_codes[fid] / 10;
+				powernow_table[k].frequency = speed;
+				powernow_table[k].index=fid; /*lower 8 bits*/
+				powernow_table[k].index|= (vid << 8); /*upper 8 bits*/
+
+				if (speed < minimum_speed)
+					minimum_speed = speed;
+				if (speed > maximum_speed)
+					maximum_speed = speed;
+
+				dprintk ("   FID: 0x%x (%d.%dx [%dMHz])\t", fid, fid_codes[fid] / 10, fid_codes[fid] % 10, (speed + 500)/1000);
+				printk ("VID: 0x%x (%d.%03dV)\n", vid, mobile_vid_table[vid]/1000, mobile_vid_table[vid]%1000);
+				k++;
+			}
+		} else {
+			// invalid entry
+			dprintk ("Entry %d is invalid\n", i+1);
+		}
+	}
+
+	if (k < number_scales) {
+		/* some entrys were invalid need to realloc table */
+		number_scales = k;
+		powernow_table_tmp = kmalloc((sizeof(struct cpufreq_frequency_table) * (number_scales + 1)), GFP_KERNEL);
+		if (!powernow_table_tmp) {
+			kfree(powernow_table);
+			return -ENOMEM;
+		}
+		memcpy(powernow_table_tmp,powernow_table,(sizeof(struct cpufreq_frequency_table) * (number_scales + 1)));
+		kfree(powernow_table);
+		powernow_table=powernow_table_tmp;
+	}
+
+	/* Terminate frequency list */
+	powernow_table[number_scales].frequency = CPUFREQ_TABLE_END;
+	powernow_table[number_scales].index = 0;
+       
+	return 0;
+}
+
 static int powernow_decode_bios (int maxfid, int startvid)
 {
 	struct psb_s *psb;
@@ -586,8 +734,28 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
+	if (fsb) {
+		unsigned int mult;
+
+		if (fsb < 1000)
+			fsb *= 1000;
+
+		if (fsb < 1000 || fsb > 1000000) {
+			printk(KERN_WARNING PFX "FSB %ukhz out of range\n", fsb);
+			return -EINVAL;
+		}
+
+		mult = ((2*cpu_khz + fsb/2) / fsb) * 5;
+		if (mult != fid_codes[fidvidstatus.bits.MFID])
+			dprintk("MSR reported multiplier %u.%u\n", fid_codes[fidvidstatus.bits.MFID]/10, fid_codes[fidvidstatus.bits.MFID]%10);
+
+		dprintk("Current multiplier %u.%u. CPU running at %luMHz\n", mult/10, mult%10, (cpu_khz + 500)/1000);
+		if (mult < 30 || mult >= 230)
+			dprintk("Multiplier %u.%u not possible\n", mult/10, mult%10);
+	} else
 	/* A K7 with powernow technology is set to max frequency by BIOS */
 	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;
@@ -597,6 +765,9 @@
 	if (dmi_check_system(powernow_dmi_table) || acpi_force) {
 		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
 		result = powernow_acpi_init();
+        } else if (overwrite_table){
+		printk(KERN_INFO PFX "Overwriting PST table with manual settings\n");
+		result = powernow_manual_settings(&fidvidstatus);
 	} else {
 		result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
 		if (result) {
@@ -620,7 +791,7 @@
 		return result;
 
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
-				minimum_speed/1000, maximum_speed/1000);
+				(minimum_speed + 500)/1000, (maximum_speed + 500)/1000);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
@@ -678,6 +849,17 @@
 module_param(acpi_force,  int, 0444);
 MODULE_PARM_DESC(acpi_force, "Force ACPI to be used.");
 
+module_param(overwrite_table,int,0444);
+MODULE_PARM_DESC(overwrite_table, "overwrite table with manually settings");
+module_param(fsb, uint, 0444);
+MODULE_PARM_DESC(fsb, "(MHz) overrides the calculated FSB");
+module_param_array(multiplier, int, &multiplier_arr_size, 0444);
+MODULE_PARM_DESC(multiplier, "Specifiy up to 10 multipliers, multiply them by 10: 5->50, 5.5->55");
+module_param_array(voltage, int, &voltage_arr_size, 0444);
+MODULE_PARM_DESC(voltage, "Specify voltages in respect to the given multipliers, specify them in mV: 1.275V -> 1275");
+module_param(switch_latency,  int, 0444);
+MODULE_PARM_DESC(switch_latency, "Set state transition latency in microseconds (default 200us)");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--82I3+IH0IqGh5yIs--

