From: Jarkko Lavinen <jlavi@iki.fi>
Subject: Re: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Mon, 17 Jan 2005 18:31:43 +0200
Message-ID: <20050117163143.GA25937@smooth.piipiip.net>
References: <20050114114656.GA8185@smooth.piipiip.net>
	<200501171621.52998.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="5vNYLRcllDrimb99"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200501171621.52998.Hendrik.Muhs@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Hendrik Muhs <Hendrik.Muhs@web.de>
Cc: cpufreq@zenII.linux.org.uk, Jarkko Lavinen <jlavi@iki.fi>


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 04:21:52PM +0100, Hendrik Muhs wrote:
> Which motherboard do you have?

My motherboard is Abit KD7A. I am using FSB 133 and multiplier 9 at BIOS and
the CPU is running at 1200MHz when kernel boots.

In powernow_cpu_init() the multiploer is asked by:

  rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);

  /* A K7 with powernow technology is set to max frequency by BIOS */
  fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];

14 is then used here as divisor and FSB 87.050MHz is used.

Either overriding FSB or overriding the multiplier would avoid wrong 
FSB being used.  I think your suggestion to specify FSB would be
more user friedly and intuitive.  One could then calculate the
real multiplier and the precise FSB.

> Anyway, I miss your patch. You have forgotten to attach it!

Attached. I didn't intend to send it to the list at all since it
is 96% the same as the patch you sent previously.

Cheers
Jarkko

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="powernow-k7.c.diff"

--- powernow-k7.c.orig	2005-01-14 12:14:02.000000000 +0200
+++ powernow-k7.c	2005-01-14 13:31:21.000000000 +0200
@@ -71,7 +71,7 @@
     2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
     1600, 1550, 1500, 1450, 1400, 1350, 1300, 0,
     1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
-    1075, 1050, 1024, 1000, 975, 950, 925, 0,
+    1075, 1050, 1025, 1000, 975, 950, 925, 0,
 };
 
 /* divide by 10 to get FID. */
@@ -79,9 +79,23 @@
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
@@ -89,6 +103,15 @@
 static int acpi_force;
 static int debug;
 
+/* This parameters can be used to manually overwrite the tables */
+static int overwrite_table = 0;
+static int multiplier_limit = 0;
+#define MAX_PST 10
+static int maxPSTSize = MAX_PST;
+static int multiplier[MAX_PST] = {[0 ... (MAX_PST - 1)] = 0 };
+static int voltage[MAX_PST] = {[0 ... (MAX_PST - 1)] = 0 };
+static int switch_latency = 0;
+
 static struct cpufreq_frequency_table *powernow_table;
 
 static unsigned int can_scale_bus;
@@ -420,6 +443,131 @@
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
+	dprintk (KERN_INFO PFX "Settling Time: %d microseconds.\n", latency);
+
+	/* get number of specified multipliers */
+	for (i=0; i< MAX_PST; i++) {
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
+	for(i=0; i<number_scales; i++)
+	{
+		validentry = 0;
+		if (multiplier[i] != 0) {
+			/* fix multiplier */
+			if (multiplier[i] < 30)
+				multiplier[i]=multiplier[i] * 10;
+
+			if (multiplier[i] < max_multiplier) {
+				cm = (multiplier[i]/10);
+				/* check if odd or even muliplier */
+				if (multiplier[i]%10) {
+					/* odd multiplier */
+					if (cm == 16) {
+						/* hardcoded because 14.5 and 15.5 fids not possible */
+						fid = 27;
+						validentry = 1;
+					}else if ((cm > 4) && (cm < 14)) {
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
+				dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid, fid_codes[fid] / 10, fid_codes[fid] % 10, speed/1000);
+				dprintk ("VID: 0x%x (%d.%03dV)\n", vid, mobile_vid_table[vid]/1000, mobile_vid_table[vid]%1000);
+				k++;
+			}
+		} else {
+			// invalid entry
+			dprintk (KERN_INFO PFX "Entry %d is invalid\n", i+1);
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
@@ -589,7 +737,7 @@
 static int __init powernow_cpu_init (struct cpufreq_policy *policy)
 {
 	union msr_fidvidstatus fidvidstatus;
-	int result;
+	int result, max_div;
 
 	if (policy->cpu != 0)
 		return -ENODEV;
@@ -597,7 +745,16 @@
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
 	/* A K7 with powernow technology is set to max frequency by BIOS */
-	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	max_div = fid_codes[fidvidstatus.bits.MFID];
+	if (multiplier_limit) {
+		if (multiplier_limit < 30)
+			multiplier_limit *= 10;  // Even multiplier
+		
+		if (multiplier_limit < max_div)
+			max_div = multiplier_limit;
+	}
+
+	fsb = (10 * cpu_khz) / max_div;
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;
@@ -607,6 +764,9 @@
 	if (dmi_check_system(powernow_dmi_table) || acpi_force) {
 		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
 		result = powernow_acpi_init();
+        } else if (overwrite_table){
+		printk(KERN_INFO PFX "Overwriting PST table with manual settings\n");
+		result = powernow_manual_settings(&fidvidstatus);
 	} else {
 		result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
 		if (result) {
@@ -690,6 +850,17 @@
 module_param(acpi_force,  int, 0444);
 MODULE_PARM_DESC(acpi_force, "Force ACPI to be used.");
 
+module_param(overwrite_table,int,0444);
+MODULE_PARM_DESC(overwrite_table, "overwrite table with manually settings");
+module_param(multiplier_limit, int, 0444);
+MODULE_PARM_DESC(overwrite_table, "The highest allowed multiplier even x1, odd x10");
+module_param_array(multiplier, int, maxPSTSize, 0444);
+MODULE_PARM_DESC(multiplier, "Specifiy up to 10 multipliers, multiply them by 10: 5->50, 5.5->55");
+module_param_array(voltage, int, maxPSTSize, 0444);
+MODULE_PARM_DESC(voltage, "Specify voltages in respect to the given multipliers, specify them in mV: 1.275V -> 1275");
+module_param(switch_latency,  int, 0444);
+MODULE_PARM_DESC(switch_latency, "Set state transition latency in microseconds (default 200us)");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");

--5vNYLRcllDrimb99
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--5vNYLRcllDrimb99--

