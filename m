From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.5,
	1.93.2.6
Date: Mon, 01 Mar 2004 15:13:17 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Axp6b-0007uG-4A@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv30382

Modified Files:
      Tag: LINUX_2_4
	longhaul.c 
Log Message:
Try to enable Nehemiah.


Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.5
retrieving revision 1.93.2.6
diff -u -r1.93.2.5 -r1.93.2.6
--- longhaul.c	1 Mar 2004 15:11:25 -0000	1.93.2.5
+++ longhaul.c	1 Mar 2004 15:13:14 -0000	1.93.2.6
@@ -467,12 +467,8 @@
 		return -ENODEV;
 
 	switch (c->x86_model) {
-	case 6 ... 8:
+	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
-	case 9:
-		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
-						"from VIA before this is usable.\n");
-		break;
 	default:
 		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 	}
