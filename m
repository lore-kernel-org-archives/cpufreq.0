From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.6,
	1.7 cpu-sa1110.c, 1.13, 1.14
Date: Tue, 31 Aug 2004 09:29:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C2412-0001Nj-2t@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv5291/linux/arch/arm/mach-sa1100

Modified Files:
	cpu-sa1100.c cpu-sa1110.c 
Log Message:
The SA1100 and SA1110 platforms can handle situations well where the
CPU frequency is different to the value the cpufreq (and timing) code
thinks it is, e.g. when resuming from sleep. So, remove the flags
noting the opposite.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.de>


Index: cpu-sa1100.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1100.c,v
retrieving revision 1.6
retrieving revision 1.7
diff -u -r1.6 -r1.7
--- cpu-sa1100.c	26 Aug 2004 13:25:17 -0000	1.6
+++ cpu-sa1100.c	31 Aug 2004 08:29:16 -0000	1.7
@@ -230,9 +230,7 @@
 }
 
 static struct cpufreq_driver sa1100_driver = {
-	.flags		= CPUFREQ_STICKY |
-			  CPUFREQ_PANIC_OUTOFSYNC | 
-			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
+	.flags		= CPUFREQ_STICKY,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1100_target,
 	.get		= sa11x0_getspeed,

Index: cpu-sa1110.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1110.c,v
retrieving revision 1.13
retrieving revision 1.14
diff -u -r1.13 -r1.14
--- cpu-sa1110.c	26 Aug 2004 13:25:17 -0000	1.13
+++ cpu-sa1110.c	31 Aug 2004 08:29:16 -0000	1.14
@@ -329,9 +329,7 @@
 }
 
 static struct cpufreq_driver sa1110_driver = {
-	.flags		= CPUFREQ_STICKY |
-			  CPUFREQ_PANIC_OUTOFSYNC | 
-			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
+	.flags		= CPUFREQ_STICKY,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1110_target,
 	.get		= sa11x0_getspeed,
