From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k8.c, 1.1.2.2,
	1.1.2.3
Date: Mon, 13 Dec 2004 13:31:07 +0000
Message-ID: <E1CdqI7-00070o-IX@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv26926/linux/arch/i386/kernel/cpufreq

Modified Files:
      Tag: LINUX_2_4
	powernow-k8.c 
Log Message:
fix compilation as module (from Dominik)


Index: powernow-k8.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c,v
retrieving revision 1.1.2.2
retrieving revision 1.1.2.3
diff -u -r1.1.2.2 -r1.1.2.3
--- powernow-k8.c	2 Mar 2004 10:07:50 -0000	1.1.2.2
+++ powernow-k8.c	13 Dec 2004 13:31:04 -0000	1.1.2.3
@@ -759,7 +759,7 @@
 }
 
 
-static int __exit drv_cpu_exit (struct cpufreq_policy *pol)
+static int drv_cpu_exit (struct cpufreq_policy *pol)
 {
 	if (pol->cpu != 0)
 		return -EINVAL;
