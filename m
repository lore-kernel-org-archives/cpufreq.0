From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES 1/5] speedstep-centrino: p4m support
Date: Sat, 29 Jan 2005 20:42:27 +0100
Message-ID: <20050129194227.GA9382@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

The Pentium 4 - Ms (HT) with CPUID 0xF34 and 0xF41 seem to support
centrino-like enhanced speedstep; however, no "table" support is possible.
Therefore, put NULL entries into speedstep-centrino.c

Signed-off-by: Dominik Brodowski <linux@brodo.de>

Index: 2.6.11-rc2+/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
===================================================================
--- 2.6.11-rc2+.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-01-29 19:39:48.000000000 +0100
+++ 2.6.11-rc2+/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-01-29 20:16:00.000000000 +0100
@@ -54,6 +54,8 @@
 	CPU_DOTHAN_A1,
 	CPU_DOTHAN_A2,
 	CPU_DOTHAN_B0,
+	CPU_MP4HT_D0,
+	CPU_MP4HT_E0,
 };
 
 static const struct cpu_id cpu_ids[] = {
@@ -61,6 +63,8 @@
 	[CPU_DOTHAN_A1]	= { 6, 13, 1 },
 	[CPU_DOTHAN_A2]	= { 6, 13, 2 },
 	[CPU_DOTHAN_B0]	= { 6, 13, 6 },
+	[CPU_MP4HT_D0]	= {15,  3, 4 },
+	[CPU_MP4HT_E0]	= {15,  4, 1 },
 };
 #define N_IDS	(sizeof(cpu_ids)/sizeof(cpu_ids[0]))
 
@@ -226,6 +230,8 @@
 	{ &cpu_ids[CPU_DOTHAN_A1], NULL, 0, NULL },
 	{ &cpu_ids[CPU_DOTHAN_A2], NULL, 0, NULL },
 	{ &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
+	{ &cpu_ids[CPU_MP4HT_D0], NULL, 0, NULL },
+	{ &cpu_ids[CPU_MP4HT_E0], NULL, 0, NULL },
 
 	{ NULL, }
 };
