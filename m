From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq Makefile,1.1.1.1,1.1.1.2
Date: Wed, 27 Aug 2003 14:45:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19s0cF-0000re-9j@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv3312/linux/drivers/cpufreq

Modified Files:
      Tag: LINUX_2_4
	Makefile 
Log Message:
move kernel/cpufreq.c to driver/cpufreq (Dominik Brodowski)

Index: Makefile
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/Makefile,v
retrieving revision 1.1.1.1
retrieving revision 1.1.1.2
diff -u -r1.1.1.1 -r1.1.1.2
--- Makefile	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ Makefile	27 Aug 2003 13:45:36 -0000	1.1.1.2
@@ -1,4 +1,7 @@
-O_TARGET        := cpufreq.o
+O_TARGET        := built-in.o
+
+# CPUfreq core
+obj-$(CONFIG_CPU_FREQ)			+= cpufreq.o
 
 # CPUfreq governors 
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= userspace.o
@@ -7,6 +10,6 @@
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o
 obj-$(CONFIG_CPU_FREQ_PROC_INTF)	+= proc_intf.o
 
-export-objs	:= userspace.o freq_table.o
+export-objs	:= userspace.o freq_table.o cpufreq.o
 
 include $(TOPDIR)/Rules.make
