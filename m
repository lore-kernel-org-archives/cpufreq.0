From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-integrator cpu.c,1.8,1.9
Date: Tue, 20 Jan 2004 17:03:33 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AizHp-0007rl-J1@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator
In directory flint:/tmp/cvs-serv30228/linux/arch/arm/mach-integrator

Modified Files:
	cpu.c 
Log Message:
Merge with latest davej cpufreq bk tree.

Index: cpu.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator/cpu.c,v
retrieving revision 1.8
retrieving revision 1.9
diff -u -r1.8 -r1.9
--- cpu.c	5 Nov 2003 18:27:41 -0000	1.8
+++ cpu.c	20 Jan 2004 17:03:30 -0000	1.9
@@ -172,7 +172,7 @@
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.max_freq = 160000;
 	policy->cpuinfo.min_freq = 12000;
-	policy->cpuinfo.transition_latency = 1000; /* 1 ms, assumed */
+	policy->cpuinfo.transition_latency = 1000000; /* 1 ms, assumed */
 	policy->cur = policy->min = policy->max =
 		icst525_khz(&cclk_params, vco); /* current freq */
