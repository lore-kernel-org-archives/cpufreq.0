From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.c, 1.93.2.6,
	1.93.2.7
Date: Tue, 13 Apr 2004 16:47:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1BDQ85-0003Zl-0E@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv13583

Modified Files:
      Tag: LINUX_2_4
	longhaul.c 
Log Message:
I can't get the spec from VIA for the Nehemiah case.  Therefore, unless VIA do
give me necessary information for this model, it will not be made in CVS.


Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.6
retrieving revision 1.93.2.7
diff -u -r1.93.2.6 -r1.93.2.7
--- longhaul.c	1 Mar 2004 15:13:14 -0000	1.93.2.6
+++ longhaul.c	13 Apr 2004 15:47:13 -0000	1.93.2.7
@@ -467,8 +467,12 @@
 		return -ENODEV;
 
 	switch (c->x86_model) {
-	case 6 ... 9:
+	case 6 ... 8:
 		return cpufreq_register_driver(&longhaul_driver);
+	case 9:
+		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
+						"from VIA before this is usable.\n");
+		break;
 	default:
 		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 	}
