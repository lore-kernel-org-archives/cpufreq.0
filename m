From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k7.c, 1.1.1.1,
	1.1.1.2
Date: Fri, 19 Sep 2003 17:47:46 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1A0OQ6-0003kK-OT@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv14397/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	powernow-k7.c 
Log Message:
Backport some bug fixes from trunk.  This is needed for a correct operation
of powernow-k7.


Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- powernow-k7.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ powernow-k7.c	19 Sep 2003 16:47:43 -0000	1.1.1.2
@@ -1,6 +1,7 @@
 /*
  *  AMD K7 Powernow driver.
  *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs.
+ *  (C) 2003 Dave Jones <davej@redhat.com>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
@@ -190,10 +191,11 @@
 {
 	union msr_fidvidctl fidvidctl;
 
+	rdmsrl (MSR_K7_FID_VID_CTL, fidvidctl.val);
 	if (fidvidctl.bits.FID != fid) {
-		rdmsrl (MSR_K7_FID_VID_CTL, fidvidctl.val);
 		fidvidctl.bits.SGTC = latency;
 		fidvidctl.bits.FID = fid;
+		fidvidctl.bits.VIDC = 0;
 		fidvidctl.bits.FIDC = 1;
 		wrmsrl (MSR_K7_FID_VID_CTL, fidvidctl.val);
 	}
@@ -204,9 +206,11 @@
 {
 	union msr_fidvidctl fidvidctl;
 
+	rdmsrl (MSR_K7_FID_VID_CTL, fidvidctl.val);
 	if (fidvidctl.bits.VID != vid) {
-		rdmsrl (MSR_K7_FID_VID_CTL, fidvidctl.val);
+		fidvidctl.bits.SGTC = latency;
 		fidvidctl.bits.VID = vid;
+		fidvidctl.bits.FIDC = 0;
 		fidvidctl.bits.VIDC = 1;
 		wrmsrl (MSR_K7_FID_VID_CTL, fidvidctl.val);
 	}
@@ -296,8 +300,14 @@
 			dprintk (" voltage regulator)\n");
 
 			latency = psb->settlingtime;
+			if (latency < 100) {
+				printk (KERN_INFO PFX "BIOS set settling time to %d microseconds."
+						"Should be at least 100. Correcting.\n", latency);
+				latency = 100;
+			}
 			dprintk (KERN_INFO PFX "Settling Time: %d microseconds.\n", psb->settlingtime);
 			dprintk (KERN_INFO PFX "Has %d PST tables. (Only dumping ones relevant to this CPU).\n", psb->numpst);
+			latency *= 100;	/* SGTC needs to be in units of 10ns */
 
 			p += sizeof (struct psb_s);
 
@@ -325,6 +335,8 @@
 						p+=2;
 				}
 			}
+			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
+			printk ("This is indicative of a broken BIOS. Email davej@redhat.com\n");
 			return -EINVAL;
 		}
 		p++;
