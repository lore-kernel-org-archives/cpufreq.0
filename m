From: Xavier Bachelot <xb_ml@kelkoo.net>
Subject: Fix for longhaul deadlock ?
Date: Thu, 11 May 2006 01:22:27 +0200
Message-ID: <446275B3.8010802@kelkoo.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050304040901000301090908"
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
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------050304040901000301090908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

VIA recently pretended to have fixed the long-known longhaul bug. I've 
diff'ed the longhaul.c file from kernel tree against their patched 
version. Result is attached. I didn't tested it and I don't pretend to 
understand what the patch does, but I though I just post it here in case 
someone more knowledgeable could kindly take a look.
For reference, here is the link to VIA site : 
http://www.viaarena.com/default.aspx?PageID=420&OSID=30&CatID=2800

Regards,

Xavier

--------------050304040901000301090908
Content-Type: text/x-patch;
 name="longhaul.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="longhaul.patch"

--- longhaul.c.kernel	2006-05-11 01:07:31.000000000 +0200
+++ longhaul.c.via	2006-05-11 01:03:08.000000000 +0200
@@ -14,7 +14,7 @@
  *   until we have code that gets it right.
  *  Version 3 of longhaul got renamed to Powersaver and redesigned
  *   to use the POWERSAVER MSR at 0x110a.
- *   It is present in Ezra-T (C5M), Nehemiah (C5X) and above.
+ *   It is present in Ezra-T (C5M), Nehemiah (C5XLOE/C5XLOH/C5P) and above.
  *   It's pretty much the same feature wise to longhaul v2, though
  *   there is provision for scaling FSB too, but this doesn't work
  *   too well in practice so we don't even try to use this.
@@ -60,9 +60,12 @@
 /* Module parameters */
 static int dont_scale_voltage;
 
-
+#define CPUFREQ_DEBUG_DRIVER 2
+#define halt()          __asm__ __volatile__("hlt": : :"memory")
+#define self_halt()     __asm__ __volatile__("sti; hlt": : :"memory")
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longhaul", msg)
-
+#define DEFINE_SPINLOCK(x) spinlock_t x = SPIN_LOCK_UNLOCKED
+static DEFINE_SPINLOCK(disable_ratelimit_lock);
 
 /* Clock ratios multiplied by 10 */
 static int clock_ratio[32];
@@ -71,24 +74,37 @@
 static unsigned int highest_speed, lowest_speed; /* kHz */
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
+static unsigned int debug;
+static unsigned int debug_ratelimit = 1;
+static unsigned int disable_ratelimit = 1;
+
+void cpufreq_debug_printk(unsigned int type, const char *prefix, const char *fmt, ...)
+{
+	char s[256];
+	va_list args;
+	unsigned int len;
+	unsigned long flags;
+	
+	WARN_ON(!prefix);
+	if (type & debug) {
+		spin_lock_irqsave(&disable_ratelimit_lock, flags);
+		if (!disable_ratelimit && debug_ratelimit && !printk_ratelimit()) {
+			spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
+			return;
+		}
+		spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
 
-#ifdef CONFIG_CPU_FREQ_DEBUG
-static char speedbuffer[8];
+		len = snprintf(s, 256, KERN_DEBUG "%s: ", prefix);
 
-static char *print_speed(int speed)
-{
-	if (speed > 1000) {
-		if (speed%1000 == 0)
-			sprintf (speedbuffer, "%dGHz", speed/1000);
-		else
-			sprintf (speedbuffer, "%d.%dGHz", speed/1000, (speed%1000)/100);
-	} else
-		sprintf (speedbuffer, "%dMHz", speed);
+		va_start(args, fmt);
+		len += vsnprintf(&s[len], (256 - len), fmt, args);
+		va_end(args);
 
-	return speedbuffer;
-}
-#endif
+		printk(s);
 
+		WARN_ON(len < 5);
+	}
+}
 
 static unsigned int calc_speed(int mult)
 {
@@ -118,10 +134,10 @@
 static void do_powersaver(union msr_longhaul *longhaul,
 			unsigned int clock_ratio_index)
 {
-	struct pci_dev *dev;
+	int version;
 	unsigned long flags;
 	unsigned int tmp_mask;
-	int version;
+	struct pci_dev *dev;
 	int i;
 	u16 pci_cmd;
 	u16 cmd_state[64];
@@ -227,8 +243,8 @@
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
-			fsb, mult/10, mult%10, print_speed(speed/1000));
+	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%d)\n",
+			fsb, mult/10, mult%10, speed/1000);
 
 	switch (longhaul_version) {
 
@@ -258,7 +274,8 @@
 		break;
 
 	/*
-	 * Longhaul v3 (aka Powersaver). (Ezra-T [C5M] & Nehemiah [C5N])
+	 * Longhaul v3 (aka Powersaver). (Ezra-T [C5M] & Nehemiah 
+         * [C5XLOE/C5XLOH/C5P]
 	 * We can scale voltage with this too, but that's currently
 	 * disabled until we come up with a decent 'match freq to voltage'
 	 * algorithm.
@@ -280,6 +297,7 @@
  * Centaur decided to make life a little more tricky.
  * Only longhaul v1 is allowed to read EBLCR BSEL[0:1].
  * Samuel2 and above have to try and guess what the FSB is.
+ #define hlt()     __asm__ __volatile__("hlt": : :"memory")
  * We do this by assuming we booted at maximum multiplier, and interpolate
  * between that value multiplied by possible FSBs and cpu_mhz which
  * was calculated at boot time. Really ugly, but no other way to do this.
@@ -329,6 +347,7 @@
 	unsigned int eblcr_fsb_table_v1[] = { 66, 133, 100, -1 };
 	unsigned int eblcr_fsb_table_v2[] = { 133, 100, -1, 66 };
 
+        unsigned long deviceid=0,cpufreqdiv=0; // FSB 200 MHz
 	switch (longhaul_version) {
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
@@ -377,19 +396,59 @@
 			 *   We're possibly using something undocumented and unsupported,
 			 *   But it works, so we don't grumble.
 			 */
-			minmult=40;
-			maxmult=longhaul_get_cpu_mult();
 
-			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
-			if ((cpu_khz/1000) > 1200)
-				fsb = 200;
-			else
-				fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
-		}
+/* VIA improved the 200MHz FSB by Eddy Fu (2005-05-18) */
+                       // started
+                       __asm__ (
+                		"movl    $0x80000200, %%eax\n\r"
+                                "movl    $0x0cf8, %%edx\n\r"
+                                "outl    %%eax, %%dx\n\r"
+                   
+                                "movl    $0x0cfc, %%edx\n\r"
+                                "inl     %%dx, %%eax\n\r"
+                                "movl    %%eax, %0\n\r"
+	                        :"=m" (deviceid)
+                               );
+                               // printk("deviceid=%lx\n",deviceid);
+                      if (deviceid == 0x22591106) {    
+                      // Read System Frequency Divider Rx54[7:5]
+
+                              __asm__ (
+                     	               "movl    $0x80000254, %%eax\n\r"
+                                       "movl    $0x0cf8, %%edx\n\r"
+                          	       "outl    %%eax, %%dx\n\r"
+                       
+                                       "movl    $0x0cfc, %%edx\n\r"
+                                       "inl     %%dx, %%eax\n\r"
+                    		       "andl    $0x000000e0, %%eax\n\r"
+                       	               "movl    %%eax, %0\n\r"
+                                       :"=m" (cpufreqdiv)
+	                              );
+		              // dprintk("cpufreqdiv = %lx\n", cpufreqdiv);
+	    	              if (cpufreqdiv == 0x00) 
+	                           fsb = 100;
+	                      if (cpufreqdiv == 0x20) 
+	                           fsb = 133;
+	    	              if (cpufreqdiv == 0x40) 
+                	           fsb = 200;
+		              // dprintk ("VIA Nehemiah CPU's FSB=%d.\n", fsb);
+                      }
+	              else
+	  	      { 
+                              rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+	                      fsb = eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+                      }
+      	        minmult=40;
+		maxmult=longhaul_get_cpu_mult();
+		// dprintk ("VIA Nehemiah CPU's maxmult = %d .\n", maxmult);
+		// dprintk ("VIA Nehemiah CPU's FSB = %d .\n", fsb);
+                // finished
+		break;
+	    }
+
 	}
 
-	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
+	printk (KERN_INFO PFX "MinMult: %d.%d x MaxMult: %d.%d x\n",
 		 minmult/10, minmult%10, maxmult/10, maxmult%10);
 
 	if (fsb == -1) {
@@ -399,9 +458,9 @@
 
 	highest_speed = calc_speed(maxmult);
 	lowest_speed = calc_speed(minmult);
-	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
-		 print_speed(lowest_speed/1000), 
-		 print_speed(highest_speed/1000));
+	printk (KERN_INFO PFX "FSB: %d MHz  Lowest speed: %d   Highest speed: %d\n", fsb, 
+                lowest_speed/1000, 
+                highest_speed/1000);
 
 	if (lowest_speed == highest_speed) {
 		printk (KERN_INFO PFX "highestspeed == lowest, aborting.\n");
@@ -467,11 +526,11 @@
 	}
 
 	if (vrmrev==0) {
-		dprintk ("VRM 8.5\n");
+		dprintk ("VRM 8.5 \n");
 		memcpy (voltage_table, vrm85scales, sizeof(voltage_table));
 		numvscales = (voltage_table[maxvid]-voltage_table[minvid])/25;
 	} else {
-		dprintk ("Mobile VRM\n");
+		dprintk ("Mobile VRM \n");
 		memcpy (voltage_table, mobilevrmscales, sizeof(voltage_table));
 		numvscales = (voltage_table[maxvid]-voltage_table[minvid])/5;
 	}
@@ -578,17 +637,17 @@
 		numscales=32;
 		switch (c->x86_mask) {
 		case 0 ... 1:
-			cpuname = "C3 'Nehemiah A' [C5N]";
+			cpuname = "C3 'Nehemiah A' [C5XLOE]";
 			memcpy (clock_ratio, nehemiah_a_clock_ratio, sizeof(nehemiah_a_clock_ratio));
 			memcpy (eblcr_table, nehemiah_a_eblcr, sizeof(nehemiah_a_eblcr));
 			break;
 		case 2 ... 4:
-			cpuname = "C3 'Nehemiah B' [C5N]";
+			cpuname = "C3 'Nehemiah B' [C5XLOH]";
 			memcpy (clock_ratio, nehemiah_b_clock_ratio, sizeof(nehemiah_b_clock_ratio));
 			memcpy (eblcr_table, nehemiah_b_eblcr, sizeof(nehemiah_b_eblcr));
 			break;
 		case 5 ... 15:
-			cpuname = "C3 'Nehemiah C' [C5N]";
+			cpuname = "C3 'Nehemiah C' [C5P]";
 			memcpy (clock_ratio, nehemiah_c_clock_ratio, sizeof(nehemiah_c_clock_ratio));
 			memcpy (eblcr_table, nehemiah_c_eblcr, sizeof(nehemiah_c_eblcr));
 			break;

--------------050304040901000301090908
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------050304040901000301090908--

