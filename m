From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq gx-suspmod.c, 1.1.1.1,
	1.1.1.2
Date: Tue, 31 Aug 2004 10:34:25 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C2521-00021v-M2@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv7797

Modified Files:
      Tag: LINUX_2_4
	gx-suspmod.c 
Log Message:
bugfixes from Hiroshi Miura, especially there were a mistake about on/off bits.


Index: gx-suspmod.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/gx-suspmod.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- gx-suspmod.c	25 Aug 2003 14:58:46 -0000	1.1.1.1
+++ gx-suspmod.c	31 Aug 2004 09:34:22 -0000	1.1.1.2
@@ -28,30 +28,34 @@
  *	with 'Suspend Modulation OFF Count Register'
  *	and 'Suspend Modulation ON Count Register'.
  *	These registers are 8bit counters that represent the number of 
- *	32us intervals which the SUSP# pin is asserted/de-asserted to the 
- *	processor.
+ *	32us intervals which the SUSP# pin is asserted(ON)/de-asserted(OFF)
+ *	to the processor.
  *
  *	These counters define a ratio which is the effective frequency 
  * 	of operation of the system.
  *
- *			       On Count
+ *			       OFF Count
  *	F_eff = Fgx * ----------------------
- *	                On Count + Off Count
+ *	                OFF Count + ON Count
  *
  *	0 <= On Count, Off Count <= 255
  *
  *	From these limits, we can get register values 
  *
- *	on_duration + off_duration <= MAX_DURATION
- *	off_duration = on_duration * (stock_freq - freq) / freq
+ *	off_duration + on_duration <= MAX_DURATION
+ *	on_duration = off_duration * (stock_freq - freq) / freq
  *
- *      on_duration  =  (freq * DURATION) / stock_freq 
- *      off_duration = DURATION - on_duration 
+ *      off_duration  =  (freq * DURATION) / stock_freq 
+ *      on_duration = DURATION - off_duration 
  *
  *
  *---------------------------------------------------------------------------
  *
  * ChangeLog:
+ * 	Dec. 12, 2003	Hiroshi Miura <miura@da-cha.org>
+ * 		- fix on/off register mistake
+ * 		- fix cpu_khz calc when it stops cpu modulation.
+ *
  *	Dec. 11, 2002 	Hiroshi Miura <miura@da-cha.org>
  *		- rewrite for Cyrix MediaGX Cx5510/5520 and 
  *		  NatSemi Geode Cs5530(A).
@@ -211,7 +215,7 @@
  *
  * Finds out at which efficient frequency the Cyrix MediaGX/NatSemi Geode CPU runs.
  */
-static int gx_get_cpuspeed(void)
+static unsigned int gx_get_cpuspeed(void)
 {
 	if ((gx_params->pci_suscfg & SUSMOD) == 0) 
 		return stock_freq;
@@ -233,13 +237,13 @@
 	int old_tmp_freq = stock_freq;
 	int tmp_freq;
 
-	*on_duration=1;
-	*off_duration=0;
+	*off_duration=1;
+	*on_duration=0;
 
 	for (i=max_duration; i>0; i--) {
-		tmp_on = ((khz * i) / stock_freq) & 0xff; 
-		tmp_off = i - tmp_on;
-		tmp_freq = (stock_freq * tmp_on) / i;
+		tmp_off = ((khz * i) / stock_freq) & 0xff; 
+		tmp_on = i - tmp_off;
+		tmp_freq = (stock_freq * tmp_off) / i;
 		/* if this relation is closer to khz, use this. If it's equal,
 		 * prefer it, too - lower latency */
 		if (abs(tmp_freq - khz) <= abs(old_tmp_freq - khz)) {
@@ -273,42 +277,37 @@
 
 	freqs.new = new_khz;
 
-	if (new_khz == stock_freq) {  /* if new khz == 100% of CPU speed, it is special case */
-		local_irq_save(flags);
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-		pci_write_config_byte(gx_params->cs55x0, PCI_SUSCFG, (gx_params->pci_suscfg & ~(SUSMOD)));
-		pci_read_config_byte(gx_params->cs55x0, PCI_SUSCFG, &(gx_params->pci_suscfg));
-		local_irq_restore(flags);
-		dprintk("suspend modulation disabled: cpu runs 100 percent speed.\n");
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-		return;
-	}
-
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-
 	local_irq_save(flags);
-	switch (gx_params->cs55x0->device) {
-	case PCI_DEVICE_ID_CYRIX_5530_LEGACY:
-		pmer1 = gx_params->pci_pmer1 | IRQ_SPDUP | VID_SPDUP;
-		/* FIXME: need to test other values -- Zwane,Miura */
-		pci_write_config_byte(gx_params->cs55x0, PCI_IRQTC, 4); /* typical 2 to 4ms */
-		pci_write_config_byte(gx_params->cs55x0, PCI_VIDTC, 100);/* typical 50 to 100ms */
-		pci_write_config_byte(gx_params->cs55x0, PCI_PMER1, pmer1);
-
-		if (gx_params->pci_rev < 0x10) {   /* CS5530(rev 1.2, 1.3) */
+	if (new_khz != stock_freq) {  /* if new khz == 100% of CPU speed, it is special case */
+		switch (gx_params->cs55x0->device) {
+		case PCI_DEVICE_ID_CYRIX_5530_LEGACY:
+			pmer1 = gx_params->pci_pmer1 | IRQ_SPDUP | VID_SPDUP;
+			/* FIXME: need to test other values -- Zwane,Miura */
+			pci_write_config_byte(gx_params->cs55x0, PCI_IRQTC, 4); /* typical 2 to 4ms */
+			pci_write_config_byte(gx_params->cs55x0, PCI_VIDTC, 100);/* typical 50 to 100ms */
+			pci_write_config_byte(gx_params->cs55x0, PCI_PMER1, pmer1);
+
+			if (gx_params->pci_rev < 0x10) {   /* CS5530(rev 1.2, 1.3) */
+				suscfg = gx_params->pci_suscfg | SUSMOD;
+			} else {                           /* CS5530A,B.. */
+				suscfg = gx_params->pci_suscfg | SUSMOD | PWRSVE;
+			}
+			break;
+		case PCI_DEVICE_ID_CYRIX_5520:
+		case PCI_DEVICE_ID_CYRIX_5510:
 			suscfg = gx_params->pci_suscfg | SUSMOD;
-		} else {                           /* CS5530A,B.. */
-			suscfg = gx_params->pci_suscfg | SUSMOD | PWRSVE;
+			break;
+		default:
+			local_irq_restore(flags);
+			dprintk("fatal: try to set unknown chipset.\n");
+			return;
 		}
-		break;
-	case PCI_DEVICE_ID_CYRIX_5520:
-	case PCI_DEVICE_ID_CYRIX_5510:
-		suscfg = gx_params->pci_suscfg | SUSMOD;
-		break;
-	default:
-		local_irq_restore(flags);
-		dprintk("fatal: try to set unknown chipset.\n");
-		return;
+	} else {
+		suscfg = gx_params->pci_suscfg & ~(SUSMOD);
+		gx_params->off_duration = 0;
+		gx_params->on_duration = 0;
+		dprintk("suspend modulation disabled: cpu runs 100 percent speed.\n");
 	}
 
 	pci_write_config_byte(gx_params->cs55x0, PCI_MODOFF, gx_params->off_duration);
@@ -406,7 +405,7 @@
 
 static int cpufreq_gx_cpu_init(struct cpufreq_policy *policy)
 {
-	int maxfreq, curfreq;
+	unsigned int maxfreq, curfreq;
 
 	if (!policy || policy->cpu != 0)
 		return -ENODEV;
