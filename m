From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c,1.5,1.6
Date: Fri, 11 Jul 2003 14:11:18 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19axgE-00076e-Mj@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv27166

Modified Files:
	speedstep-piix4.c 
Log Message:
- typo fix in a dprintk statement (pcntrl was printed as the same).
- Touching the CC_EN bit in the PCNTRL IO register seems to be a really bad
  idea, actually.  That break in fact more systems than it resolve.
- seems that we do not need to do a dummy read with port 0x80 after all.


Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.5
retrieving revision 1.6
diff -u -r1.5 -r1.6
--- speedstep-piix4.c	27 Jun 2003 12:43:57 -0000	1.5
+++ speedstep-piix4.c	11 Jul 2003 13:11:15 -0000	1.6
@@ -116,14 +116,14 @@
 	cntb |= (1 << 5);       /* CPU_SEL = 1 */
 
 	dprintk(KERN_DEBUG "cntb before: 0x%.8x\n", cntb_save);
-	dprintk(KERN_DEBUG "cntb after:  0x%.8x\n", cntb_save);
+	dprintk(KERN_DEBUG "cntb after:  0x%.8x\n", cntb);
 
 	pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb);
 
 	/* read state */
 	value = inb_p(pmbase + gpo_hilo_port);
 
-	/* write new state */
+	/* compute new state */
 	value &= ~(1 << gpo_hilo_shift);
 	value |= state << gpo_hilo_shift;
 
@@ -139,7 +139,6 @@
 	pcntrl |= 1 << 12;              /* STPCLK_EN = 1 */
 	pcntrl |= 1 << 11;              /* SLEEP_EN = 1 */
 	pcntrl &= ~(1 << 10);           /* BURST_EN = 0 */
-	pcntrl |= 1 << 9;               /* CC_EN = 1 */
 	pcntrl &= ~(1 << 4);            /* THT_EN = 0 */
 
 	dprintk(KERN_DEBUG "pcntrl before: 0x%.8x\n", pcntrl_save);
@@ -151,9 +150,6 @@
 	outb_p(value, pmbase + gpo_hilo_port);
 	wbinvd();
 	inb_p(pmbase + 0x15);
-
-	/* We may have to do a dummy read after C3. */
-	inb(0x80);
 
 	/* cleanup */
