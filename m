From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c,1.7,1.8
Date: Mon, 14 Jul 2003 12:51:56 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19c1s4-0006g8-Eo@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv25668

Modified Files:
	speedstep-piix4.c 
Log Message:
Revert to an hopefully working driver:
- remove gpo read as bytes.


Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.7
retrieving revision 1.8
diff -u -r1.7 -r1.8
--- speedstep-piix4.c	11 Jul 2003 15:51:06 -0000	1.7
+++ speedstep-piix4.c	14 Jul 2003 11:51:53 -0000	1.8
@@ -39,9 +39,6 @@
 /* the GPO line the Intel SpeedStep Control Logic is connected to */
 static int				gpo_hilo = -1;
 
-static int				gpo_hilo_port;
-static int				gpo_hilo_shift;
-
 /* 
  *   There are only two frequency states for each processor. Values
  * are in kHz for the time being.
@@ -76,7 +73,7 @@
 	u32			pmbase;
 	u32			pcntrl, pcntrl_save;
 	u32			cntb, cntb_save;
-	u8			value;
+	u32			val32;
 	u8			pm2_blk;
 	unsigned long		flags;
 	struct cpufreq_freqs	freqs;
@@ -117,21 +114,21 @@
 
 	dprintk(KERN_DEBUG "cntb before: 0x%.8x\n", cntb_save);
 	dprintk(KERN_DEBUG "cntb after:  0x%.8x\n", cntb);
-
 	pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb);
 
 	/* read state */
-	value = inb_p(pmbase + gpo_hilo_port);
-
-	/* compute new state */
-	value = state ? (value | (1 << gpo_hilo_shift)) : \
-		        (value & ~(1 << gpo_hilo_shift));
+	val32 = inl_p(pmbase + 0x34);
+	dprintk(KERN_DEBUG "reading %.8x from %.4x\n", val32, pmbase + 0x34);
 
+	/* write new state */
+	val32 &= ~(1 << gpo_hilo);
+	val32 |= state << gpo_hilo;
+	dprintk(KERN_DEBUG "new gpo: %.8x\n", val32);
 
 	/* disable bus master arbitration */
 	pm2_blk = inb(0x22);
 	pm2_blk |= 0x01;
-	outb(pm2_blk, 0x22);
+	outb_p(pm2_blk, 0x22);
 
 	/* program southbridge for a deep sleep transition */
 	pcntrl_save = pcntrl = inl(pmbase + 0x10);
@@ -140,6 +137,7 @@
 	pcntrl |= 1 << 12;              /* STPCLK_EN = 1 */
 	pcntrl |= 1 << 11;              /* SLEEP_EN = 1 */
 	pcntrl &= ~(1 << 10);           /* BURST_EN = 0 */
+	pcntrl |= 1 << 9;               /* CC_EN = 1 */
 	pcntrl &= ~(1 << 4);            /* THT_EN = 0 */
 
 	dprintk(KERN_DEBUG "pcntrl before: 0x%.8x\n", pcntrl_save);
@@ -148,29 +146,35 @@
 	outl_p(pcntrl, pmbase + 0x10);
 
 	/* Write to GPO (HI/LO)#, then enter C3. */
-	outb_p(value, pmbase + gpo_hilo_port);
+	outl_p(val32, pmbase + 0x34);
 	wbinvd();
 	inb_p(pmbase + 0x15);
 
+	/* We may have to do a dummy read after C3. */
+	inb(0x80);
+
 	/* cleanup */
 
 	outl_p(pcntrl_save, pmbase + 0x10);
-
 	/* restore bus master arbitration */
+
 	pm2_blk &= 0xfe;
 	outb_p(pm2_blk, 0x22);
 
 	/* cleanup southbridge */
 	pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb_save);
 
+	val32 = inl(pmbase + 0x34);
+	val32 = (val32 & (1 << gpo_hilo)) >> gpo_hilo;
+
 	/* enable IRQs */
 
 	local_irq_restore(flags);
 
-	if (speedstep_get_processor_frequency(speedstep_processor) == freqs.old) {
-		printk(KERN_ERR "cpufreq: change failed\n");
-	} else {
+	if (state == (val32 & 1)) {
 		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
+	} else {
+		printk(KERN_ERR "cpufreq: change failed\n");
 	}
 
 	if (notify)
@@ -317,9 +321,6 @@
 #ifdef CONFIG_APM
 	printk(KERN_WARNING "SpeedStep and APM seems to be problematic.  Continuing anyway.\n");
 #endif
-
-	gpo_hilo_port = 0x34 + (gpo_hilo / 8);
-	gpo_hilo_shift = (gpo_hilo % 8);
 
 	return cpufreq_register_driver(&speedstep_driver);
 }
