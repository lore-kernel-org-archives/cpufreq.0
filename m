From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-integrator cpu.c,1.7,1.8
Date: Wed, 05 Nov 2003 18:28:14 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E1AHSO6-0000ZY-HE@flint.arm.linux.org.uk>
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
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator
In directory flint:/tmp/cvs-serv2114/linux/arch/arm/mach-integrator

Modified Files:
	cpu.c 
Log Message:
Merge with davej cpufreq bk tree.

Index: cpu.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator/cpu.c,v
retrieving revision 1.7
retrieving revision 1.8
diff -u -r1.7 -r1.8
--- cpu.c	19 Aug 2003 13:38:31 -0000	1.7
+++ cpu.c	5 Nov 2003 18:27:41 -0000	1.8
@@ -11,7 +11,6 @@
  *
  * CPU support functions
  */
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -170,7 +169,7 @@
 	vco.r = 22;
 
 	/* set default policy and cpuinfo */
-	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.max_freq = 160000;
 	policy->cpuinfo.min_freq = 12000;
 	policy->cpuinfo.transition_latency = 1000; /* 1 ms, assumed */
