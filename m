From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-piix4.c,1.8,1.9
Date: Tue, 19 Aug 2003 14:45:02 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6nG-0005o5-Qo@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv22315

Modified Files:
	speedstep-piix4.c 
Log Message:
long standby bug in set_state.


Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.8
retrieving revision 1.9
diff -u -r1.8 -r1.9
--- speedstep-piix4.c	14 Jul 2003 11:51:53 -0000	1.8
+++ speedstep-piix4.c	19 Aug 2003 13:44:59 -0000	1.9
@@ -82,7 +82,7 @@
 		return;
 
 	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new = speedstep_freqs[SPEEDSTEP_LOW].frequency;
+	freqs.new = speedstep_freqs[state].frequency;
 	freqs.cpu = 0; /* speedstep.c is UP only driver */
 	
 	if (notify)
@@ -164,14 +164,11 @@
 	/* cleanup southbridge */
 	pci_write_config_dword(speedstep_chipset_dev, 0x48, cntb_save);
 
-	val32 = inl(pmbase + 0x34);
-	val32 = (val32 & (1 << gpo_hilo)) >> gpo_hilo;
-
 	/* enable IRQs */
 
 	local_irq_restore(flags);
 
-	if (state == (val32 & 1)) {
+	if (speedstep_get_processor_frequency(speedstep_processor) != freqs.old) {
 		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
 	} else {
 		printk(KERN_ERR "cpufreq: change failed\n");
