From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c,1.3,1.4
Date: Fri, 27 Jun 2003 13:37:37 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19VsTx-0006sg-MI@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv26445

Modified Files:
	speedstep-piix4.c 
Log Message:
+ use GPOs as byte, not double word.
+ more debug messages stuff.


Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- speedstep-piix4.c	18 Jun 2003 11:01:50 -0000	1.3
+++ speedstep-piix4.c	27 Jun 2003 12:37:34 -0000	1.4
@@ -39,6 +39,9 @@
 /* the GPO line the Intel SpeedStep Control Logic is connected to */
 static int				gpo_hilo = -1;
 
+static int				gpo_hilo_port;
+static int				gpo_hilo_shift;
+
 /* 
  *   There are only two frequency states for each processor. Values
  * are in kHz for the time being.
@@ -53,7 +56,7 @@
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
-//#define SPEEDSTEP_DEBUG
+/#define SPEEDSTEP_DEBUG
 
 #ifdef SPEEDSTEP_DEBUG
 #define dprintk(msg...) printk(msg)
@@ -73,7 +76,7 @@
 	u32			pmbase;
 	u32			pcntrl, pcntrl_save;
 	u32			cntb, cntb_save;
-	u32			val32;
+	u8			value;
 	u8			pm2_blk;
 	unsigned long		flags;
 	struct cpufreq_freqs	freqs;
@@ -112,14 +115,17 @@
 	cntb |= (0x1f << 6);    /* CPU_LCK */
 	cntb |= (1 << 5);       /* CPU_SEL = 1 */
 
+	dprintk(KERN_DEBUG "cntb before: 0x%.8x\n", cntb_save);
+	dprintk(KERN_DEBUG "cntb after:  0x%.8x\n", cntb_save);
+
 	pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb);
 
 	/* read state */
-	val32 = inl(pmbase + 0x34);
+	value = inb_p(pmbase + gpo_hilo_port);
 
 	/* write new state */
-	val32 &= ~(1 << gpo_hilo);
-	val32 |= state << gpo_hilo;
+	value &= ~(1 << gpo_hilo_shift);
+	value |= state << gpo_hilo_shift;
 
 	/* disable bus master arbitration */
 	pm2_blk = inb(0x22);
@@ -136,10 +142,13 @@
 	pcntrl |= 1 << 9;               /* CC_EN = 1 */
 	pcntrl &= ~(1 << 4);            /* THT_EN = 0 */
 
+	dprintk(KERN_DEBUG "pcntrl before: 0x%.8x\n", pcntrl_save);
+	dprintk(KERN_DEBUG "pcntrl after:  0x%.8x\n", pcntrl);
+
 	outl_p(pcntrl, pmbase + 0x10);
 
 	/* Write to GPO (HI/LO)#, then enter C3. */
-	outl(val32, pmbase + 0x34);
+	outb_p(value, pmbase + gpo_hilo_port);
 	wbinvd();
 	inb_p(pmbase + 0x15);
 
@@ -149,25 +158,22 @@
 	/* cleanup */
 
 	outl_p(pcntrl_save, pmbase + 0x10);
-	/* restore bus master arbitration */
 
+	/* restore bus master arbitration */
 	pm2_blk &= 0xfe;
 	outb_p(pm2_blk, 0x22);
 
 	/* cleanup southbridge */
 	pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb_save);
 
-	val32 = inl(pmbase + 0x34);
-	val32 = (val32 & (1 << gpo_hilo)) >> gpo_hilo;
-
 	/* enable IRQs */
 
 	local_irq_restore(flags);
 
-	if (state == (val32 & 1)) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
-	} else {
+	if (speedstep_get_processor_frequency(speedstep_processor) == freqs.old) {
 		printk(KERN_ERR "cpufreq: change failed\n");
+	} else {
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
 	}
 
 	if (notify)
@@ -314,6 +320,9 @@
 #ifdef CONFIG_APM
 	printk(KERN_WARNING "SpeedStep and APM seems to be problematic.  Continuing anyway.\n");
 #endif
+
+	gpo_hilo_port = 0x34 + (gpo_hilo / 8);
+	gpo_hilo_shift = (gpo_hilo % 8);
 
 	return cpufreq_register_driver(&speedstep_driver);
 }
