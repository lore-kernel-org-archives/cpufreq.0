From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.2,1.1.1.3
Date: Wed, 27 Aug 2003 14:45:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19s0cF-0000ra-0N@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv3312

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
move kernel/cpufreq.c to driver/cpufreq (Dominik Brodowski)

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.2
retrieving revision 1.1.1.3
diff -u -r1.1.1.2 -r1.1.1.3
--- patch	27 Aug 2003 10:53:06 -0000	1.1.1.2
+++ patch	27 Aug 2003 13:45:35 -0000	1.1.1.3
@@ -159,14 +159,14 @@
  CONFIG_CRC32
 --- linux-2.4.22-rc4/Makefile	Mon Aug 25 13:40:23 2003
 +++ linux-2.4.22-rc4-cpufreq/Makefile	Mon Aug 25 14:08:52 2003
-@@ -136,6 +136,7 @@
- DRIVERS-  :=
+@@ -194,6 +194,7 @@
+ DRIVERS-$(CONFIG_HOTPLUG_PCI) += drivers/hotplug/vmlinux-obj.o
+ DRIVERS-$(CONFIG_ISDN_BOOL) += drivers/isdn/vmlinux-obj.o
+ DRIVERS-$(CONFIG_CRYPTO) += crypto/crypto.o
++DRIVERS-$(CONFIG_CPU_FREQ) += drivers/cpufreq/built-in.o
+ 
+ DRIVERS := $(DRIVERS-y)
  
- DRIVERS-$(CONFIG_ACPI_BOOT) += drivers/acpi/acpi.o
-+DRIVERS-$(CONFIG_CPU_FREQ) += drivers/cpufreq/cpufreq.o
- DRIVERS-$(CONFIG_PARPORT) += drivers/parport/driver.o
- DRIVERS-y += drivers/char/char.o \
- 	drivers/block/block.o \
 --- linux-2.4.22-rc4/arch/i386/config.in	Mon Aug 25 13:40:23 2003
 +++ linux-2.4.22-rc4-cpufreq/arch/i386/config.in	Mon Aug 25 14:08:52 2003
 @@ -194,6 +194,30 @@
@@ -396,22 +396,3 @@
  
  #endif
  #endif
---- linux-2.4.22-rc4/kernel/Makefile	Mon Sep 17 06:22:40 2001
-+++ linux-2.4.22-rc4-cpufreq/kernel/Makefile	Mon Aug 25 14:08:52 2003
-@@ -9,7 +9,7 @@
- 
- O_TARGET := kernel.o
- 
--export-objs = signal.o sys.o kmod.o context.o ksyms.o pm.o exec_domain.o printk.o
-+export-objs = signal.o sys.o kmod.o context.o ksyms.o pm.o exec_domain.o printk.o cpufreq.o
- 
- obj-y     = sched.o dma.o fork.o exec_domain.o panic.o printk.o \
- 	    module.o exit.o itimer.o info.o time.o softirq.o resource.o \
-@@ -19,6 +19,7 @@
- obj-$(CONFIG_UID16) += uid16.o
- obj-$(CONFIG_MODULES) += ksyms.o
- obj-$(CONFIG_PM) += pm.o
-+obj-$(CONFIG_CPU_FREQ) += cpufreq.o
- 
- ifneq ($(CONFIG_IA64),y)
- # According to Alan Modra <alan@linuxcare.com.au>, the -fno-omit-frame-pointer is
