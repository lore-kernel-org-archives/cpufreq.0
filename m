From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k8.c,1.1,1.1.2.1
Date: Tue, 30 Sep 2003 12:25:55 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1A4Idf-0006Yu-23@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv25208/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	powernow-k8.c 
Log Message:
Merge AMD Opteron/Athlon64 powernow driver.

Index: powernow-k8.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c,v
retrieving revision 1.1
retrieving revision 1.1.2.1
diff -u -r1.1 -r1.1.2.1
--- powernow-k8.c	30 Sep 2003 09:26:27 -0000	1.1
+++ powernow-k8.c	30 Sep 2003 11:25:51 -0000	1.1.2.1
@@ -76,7 +76,6 @@
 	.target = drv_target,
 	.init = drv_cpu_init,
 	.name = "cpufreq-amd64",
-	.owner = THIS_MODULE,
 };
 
 #define SEARCH_UP     1
@@ -494,7 +493,7 @@
 	struct cpuinfo_x86 *c = cpu_data;
 	u32 eax, ebx, ecx, edx;
 
-	if (num_online_cpus() != 1) {
+	if (smp_num_cpus != 1) {
 		printk(KERN_INFO PFX "multiprocessor systems not supported\n");
 		return 0;
 	}
