From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq speedstep-centrino.c, 1.1.1.1,
	1.1.1.2
Date: Tue, 09 Dec 2003 08:57:09 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1ATdg5-0006mJ-9V@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv26051

Modified Files:
      Tag: LINUX_2_4
	speedstep-centrino.c 
Log Message:
Add support for Ultra Low Voltage Intel Pentium M processor at 1000MHz (Jeremy Fitzhardinge)


Index: speedstep-centrino.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-centrino.c,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- speedstep-centrino.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ speedstep-centrino.c	9 Dec 2003 08:57:06 -0000	1.1.1.2
@@ -73,6 +73,16 @@
 	{ .frequency = CPUFREQ_TABLE_END }
 };
 
+/* Ultra Low Voltage Intel Pentium M processor 1000MHz */
+static struct cpufreq_frequency_table op_1000[] =
+{
+	OP(600,  844),
+	OP(800,  972),
+	OP(900,  988),
+	OP(1000, 1004),
+	{ .frequency = CPUFREQ_TABLE_END }
+};
+
 /* Low Voltage Intel Pentium M processor 1.10GHz */
 static struct cpufreq_frequency_table op_1100[] =
 {
@@ -165,6 +175,7 @@
 static const struct cpu_model models[] = 
 {
        _CPU( 900, " 900"),
+	CPU(1000),
 	CPU(1100),
 	CPU(1200),
 	CPU(1300),
