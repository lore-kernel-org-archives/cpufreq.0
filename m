From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.48,1.49
Date: Tue, 31 Aug 2004 09:29:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C2412-0001Ns-VG@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv5291/linux/include/linux

Modified Files:
	cpufreq.h 
Log Message:
The SA1100 and SA1110 platforms can handle situations well where the
CPU frequency is different to the value the cpufreq (and timing) code
thinks it is, e.g. when resuming from sleep. So, remove the flags
noting the opposite.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.de>


Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.48
retrieving revision 1.49
diff -u -r1.48 -r1.49
--- cpufreq.h	26 Aug 2004 16:40:19 -0000	1.48
+++ cpufreq.h	31 Aug 2004 08:29:17 -0000	1.49
@@ -209,13 +209,6 @@
 #define CPUFREQ_CONST_LOOPS 	0x02	/* loops_per_jiffy or other kernel
 					 * "constants" aren't affected by
 					 * frequency transitions */
-#define CPUFREQ_PANIC_OUTOFSYNC	0x04	/* panic if cpufreq's opinion of
-					 * current frequency differs from
-					 * actual frequency */
-#define CPUFREQ_PANIC_RESUME_OUTOFSYNC 0x08 /* panic if cpufreq's opinion of
-					 * current frequency differs from
-					 * actual frequency on resume
-					 * from sleep. */
 
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
