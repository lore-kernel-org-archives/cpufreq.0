From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1110.c,1.11,1.12
Date: Thu, 06 Nov 2003 11:11:47 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E1AHi3H-0000Wy-Dk@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100
In directory flint:/tmp/cvs-serv1993

Modified Files:
	cpu-sa1110.c 
Log Message:
Coding style fix.


Index: cpu-sa1110.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1110.c,v
retrieving revision 1.11
retrieving revision 1.12
diff -u -r1.11 -r1.12
--- cpu-sa1110.c	5 Nov 2003 18:27:41 -0000	1.11
+++ cpu-sa1110.c	6 Nov 2003 11:11:44 -0000	1.12
@@ -271,8 +271,8 @@
 	 */
 	sdram_set_refresh(2);
 	if (!irqs_disabled()) {
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(20 * HZ / 1000);
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		schedule_timeout(20 * HZ / 1000);
 	} else {
 		mdelay(20);
 	}
