From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
	1.6 cpu-sa1110.c, 1.12, 1.13
Date: Thu, 26 Aug 2004 14:25:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0KGF-0006od-0A@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100
In directory flint:/tmp/cvs-serv26017/linux/arch/arm/mach-sa1100

Modified Files:
	cpu-sa1100.c cpu-sa1110.c 
Log Message:
merge with current cpufreq bk tree and 2.6.9-r1

Index: cpu-sa1100.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1100.c,v
retrieving revision 1.5
retrieving revision 1.6
diff -u -r1.5 -r1.6
--- cpu-sa1100.c	5 Nov 2003 18:27:41 -0000	1.5
+++ cpu-sa1100.c	26 Aug 2004 13:25:17 -0000	1.6
@@ -180,7 +180,7 @@
 			 unsigned int target_freq,
 			 unsigned int relation)
 {
-	unsigned int cur = sa11x0_getspeed();
+	unsigned int cur = sa11x0_getspeed(0);
 	unsigned int new_ppcr;
 
 	struct cpufreq_freqs freqs;
@@ -221,7 +221,7 @@
 {
 	if (policy->cpu != 0)
 		return -EINVAL;
-	policy->cur = policy->min = policy->max = sa11x0_getspeed();
+	policy->cur = policy->min = policy->max = sa11x0_getspeed(0);
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 59000;
 	policy->cpuinfo.max_freq = 287000;
@@ -230,15 +230,18 @@
 }
 
 static struct cpufreq_driver sa1100_driver = {
+	.flags		= CPUFREQ_STICKY |
+			  CPUFREQ_PANIC_OUTOFSYNC | 
+			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1100_target,
+	.get		= sa11x0_getspeed,
 	.init		= sa1100_cpu_init,
 	.name		= "sa1100",
 };
 
 static int __init sa1100_dram_init(void)
 {
-	cpufreq_gov_userspace_init();
  	if ((processor_id & CPU_SA1100_MASK) == CPU_SA1100_ID)
 		return cpufreq_register_driver(&sa1100_driver);
 	else

Index: cpu-sa1110.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1110.c,v
retrieving revision 1.12
retrieving revision 1.13
diff -u -r1.12 -r1.13
--- cpu-sa1110.c	6 Nov 2003 11:11:44 -0000	1.12
+++ cpu-sa1110.c	26 Aug 2004 13:25:17 -0000	1.13
@@ -238,7 +238,7 @@
 		return -EINVAL;
 	}
 
-	freqs.old = sa11x0_getspeed();
+	freqs.old = sa11x0_getspeed(0);
 	freqs.new = sa11x0_ppcr_to_freq(ppcr);
 	freqs.cpu = 0;
 
@@ -320,7 +320,7 @@
 {
 	if (policy->cpu != 0)
 		return -EINVAL;
-	policy->cur = policy->min = policy->max = sa11x0_getspeed();
+	policy->cur = policy->min = policy->max = sa11x0_getspeed(0);
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 59000;
 	policy->cpuinfo.max_freq = 287000;
@@ -329,8 +329,12 @@
 }
 
 static struct cpufreq_driver sa1110_driver = {
+	.flags		= CPUFREQ_STICKY |
+			  CPUFREQ_PANIC_OUTOFSYNC | 
+			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1110_target,
+	.get		= sa11x0_getspeed,
 	.init		= sa1110_cpu_init,
 	.name		= "sa1110",
 };
@@ -354,8 +358,6 @@
 			sdram->tck, sdram->trcd, sdram->trp,
 			sdram->twr, sdram->refresh, sdram->cas_latency);
 
-		cpufreq_gov_userspace_init();
- 
 		memcpy(&sdram_params, sdram, sizeof(sdram_params));
 
 		return cpufreq_register_driver(&sa1110_driver);
