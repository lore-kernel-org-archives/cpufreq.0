From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.8,1.1.1.9 patchin.sh,1.1.1.5,1.1.1.6
Date: Tue, 30 Sep 2003 12:25:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1A4Ide-0006Yt-UG@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv25208

Modified Files:
      Tag: LINUX_2_4
	patch patchin.sh 
Log Message:
Merge AMD Opteron/Athlon64 powernow driver.

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.8
retrieving revision 1.1.1.9
diff -u -r1.1.1.8 -r1.1.1.9
--- patch	4 Sep 2003 16:19:03 -0000	1.1.1.8
+++ patch	30 Sep 2003 11:25:50 -0000	1.1.1.9
@@ -1,5 +1,5 @@
---- linux-original/Documentation/00-INDEX	Mon Aug 27 16:44:15 2001
-+++ linux/Documentation/00-INDEX	Thu Sep  4 11:51:38 2003
+--- linux-original/Documentation/00-INDEX	2001-08-27 16:44:15.000000000 +0200
++++ linux/Documentation/00-INDEX	2003-09-30 11:47:07.000000000 +0200
 @@ -52,6 +52,8 @@
  	- directory with information on the CD-ROM drivers that Linux has.
  computone.txt
@@ -9,8 +9,8 @@
  cpqarray.txt
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
---- linux-original/Documentation/Configure.help	Mon Aug 25 13:44:39 2003
-+++ linux/Documentation/Configure.help	Thu Sep  4 12:10:37 2003
+--- linux-original/Documentation/Configure.help	2003-08-25 13:44:39.000000000 +0200
++++ linux/Documentation/Configure.help	2003-09-30 11:49:20.000000000 +0200
 @@ -26977,16 +26977,6 @@
    Say Y if you want support for the ARM926T processor.
    Otherwise, say N.
@@ -28,11 +28,10 @@
  SiS
  CONFIG_DRM_SIS
    Choose this option if you have a SIS graphics card. AGP support is
-@@ -27387,6 +27377,147 @@
- IPMI Watchdog Timer
+@@ -27388,6 +27378,154 @@
  CONFIG_IPMI_WATCHDOG
    This enables the IPMI watchdog timer.
-+
+ 
 +CONFIG_CPU_FREQ
 +  Clock scaling allows you to change the clock speed of CPUs on the
 +  fly. This is a nice method to save battery power on notebooks,
@@ -75,6 +74,13 @@
 +
 +  If in doubt, say N.
 +
++CONFIG_X86_POWERNOW_K8
++  This adds the CPUFreq driver for mobile AMD Opteron/Athlon64 processors.
++
++  For details, take a look at linux/Documentation/cpu-freq.
++
++  If in doubt, say N.
++
 +CONFIG_X86_P4_CLOCKMOD
 +  This adds the CPUFreq driver for Intel Pentium 4 / XEON
 +  processors.
@@ -173,11 +179,12 @@
 +  For details, take a look at linux/Documentation/cpu-freq. 
 +
 +  If in doubt, say Y.
- 
++
  CRC32 functions
  CONFIG_CRC32
---- linux-original/Makefile	Mon Aug 25 13:44:44 2003
-+++ linux/Makefile	Thu Sep  4 11:51:38 2003
+   This option is provided for the case where no in-kernel-tree
+--- linux-original/Makefile	2003-08-25 13:44:44.000000000 +0200
++++ linux/Makefile	2003-09-30 11:47:07.000000000 +0200
 @@ -194,6 +194,7 @@
  DRIVERS-$(CONFIG_HOTPLUG_PCI) += drivers/hotplug/vmlinux-obj.o
  DRIVERS-$(CONFIG_ISDN_BOOL) += drivers/isdn/vmlinux-obj.o
@@ -186,9 +193,9 @@
  
  DRIVERS := $(DRIVERS-y)
  
---- linux-original/arch/i386/config.in	Mon Aug 25 13:44:39 2003
-+++ linux/arch/i386/config.in	Thu Sep  4 12:20:55 2003
-@@ -194,6 +194,32 @@
+--- linux-original/arch/i386/config.in	2003-08-25 13:44:39.000000000 +0200
++++ linux/arch/i386/config.in	2003-09-30 11:50:20.000000000 +0200
+@@ -194,6 +194,33 @@
  
  bool 'Machine Check Exception' CONFIG_X86_MCE
  
@@ -204,6 +211,7 @@
 +   comment 'CPUFreq processor drivers'
 +   dep_tristate ' AMD Mobile K6-2/K6-3 PowerNow!' CONFIG_X86_POWERNOW_K6 $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' AMD Mobile Athlon/Duron K7 PowerNow!' CONFIG_X86_POWERNOW_K7 $CONFIG_CPU_FREQ_TABLE
++   dep_tristate ' AMD Opteron/Athlon64 PowerNow!' CONFIG_X86_POWERNOW_K8 $CONFIG_CPU_FREQ_TABLE
 +   if [ "$CONFIG_MELAN" = "y" ]; then
 +       dep_tristate ' AMD Elan' CONFIG_ELAN_CPUFREQ $CONFIG_CPU_FREQ_TABLE
 +   fi
@@ -221,8 +229,8 @@
  tristate 'Toshiba Laptop support' CONFIG_TOSHIBA
  tristate 'Dell laptop support' CONFIG_I8K
  
---- linux-original/arch/i386/boot/setup.S	Sat Aug  3 02:39:42 2002
-+++ linux/arch/i386/boot/setup.S	Thu Sep  4 18:18:46 2003
+--- linux-original/arch/i386/boot/setup.S	2002-08-03 02:39:42.000000000 +0200
++++ linux/arch/i386/boot/setup.S	2003-09-30 11:47:07.000000000 +0200
 @@ -483,6 +483,18 @@
  	movw	$0xAA, (0x1ff)			# device present
  no_psmouse:
@@ -242,8 +250,8 @@
  #if defined(CONFIG_APM) || defined(CONFIG_APM_MODULE)
  # Then check for an APM BIOS...
  						# %ds points to the bootsector
---- linux-original/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
-+++ linux/arch/i386/kernel/Makefile	Thu Sep  4 12:14:03 2003
+--- linux-original/arch/i386/kernel/Makefile	2003-08-25 13:44:39.000000000 +0200
++++ linux/arch/i386/kernel/Makefile	2003-09-30 11:51:01.000000000 +0200
 @@ -14,7 +14,8 @@
  
  O_TARGET := kernel.o
@@ -254,12 +262,13 @@
  
  obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
  		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
-@@ -43,5 +44,16 @@
+@@ -43,5 +44,17 @@
  obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.o apic.o nmi.o
  obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
  obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
 +obj-$(CONFIG_X86_POWERNOW_K6)	+= powernow-k6.o
 +obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
++obj-$(CONFIG_X86_POWERNOW_K8)	+= powernow-k8.o
 +obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
 +obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
 +obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o speedstep-lib.o
@@ -271,8 +280,8 @@
 +obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
  
  include $(TOPDIR)/Rules.make
---- linux-original/arch/i386/kernel/i386_ksyms.c	Fri Jun 13 16:51:29 2003
-+++ linux/arch/i386/kernel/i386_ksyms.c	Thu Sep  4 12:43:17 2003
+--- linux-original/arch/i386/kernel/i386_ksyms.c	2003-06-13 16:51:29.000000000 +0200
++++ linux/arch/i386/kernel/i386_ksyms.c	2003-09-30 11:47:08.000000000 +0200
 @@ -28,6 +28,7 @@
  #include <asm/desc.h>
  #include <asm/pgtable.h>
@@ -309,8 +318,8 @@
  EXPORT_SYMBOL_NOVERS(__write_lock_failed);
  EXPORT_SYMBOL_NOVERS(__read_lock_failed);
  
---- linux-original/arch/i386/kernel/setup.c	Mon Aug 25 13:44:39 2003
-+++ linux/arch/i386/kernel/setup.c	Thu Sep  4 12:00:19 2003
+--- linux-original/arch/i386/kernel/setup.c	2003-08-25 13:44:39.000000000 +0200
++++ linux/arch/i386/kernel/setup.c	2003-09-30 11:47:08.000000000 +0200
 @@ -120,6 +120,7 @@
  #include <asm/dma.h>
  #include <asm/mpspec.h>
@@ -343,8 +352,8 @@
  	if( SYS_DESC_TABLE.length != 0 ) {
  		MCA_bus = SYS_DESC_TABLE.table[3] &0x2;
  		machine_id = SYS_DESC_TABLE.table[0];
---- linux-original/arch/i386/kernel/time.c	Fri Jun 13 16:51:29 2003
-+++ linux/arch/i386/kernel/time.c	Thu Sep  4 11:51:38 2003
+--- linux-original/arch/i386/kernel/time.c	2003-06-13 16:51:29.000000000 +0200
++++ linux/arch/i386/kernel/time.c	2003-09-30 11:47:08.000000000 +0200
 @@ -55,6 +55,7 @@
  #include <linux/mc146818rtc.h>
  #include <linux/timex.h>
@@ -413,8 +422,8 @@
  		}
  	}
  
---- linux-original/drivers/Makefile	Mon Aug 25 13:44:40 2003
-+++ linux/drivers/Makefile	Thu Sep  4 11:51:38 2003
+--- linux-original/drivers/Makefile	2003-08-25 13:44:40.000000000 +0200
++++ linux/drivers/Makefile	2003-09-30 11:47:08.000000000 +0200
 @@ -8,12 +8,13 @@
  
  mod-subdirs :=	dio hil mtd sbus video macintosh usb input telephony ide \
@@ -430,8 +439,8 @@
  subdir-$(CONFIG_DIO)		+= dio
  subdir-$(CONFIG_PCI)		+= pci
  subdir-$(CONFIG_GSC)		+= gsc
---- /dev/null	Thu Jan  1 01:00:00 1970
-+++ linux/include/asm-i386/ist.h	Thu Sep  4 11:55:46 2003
+--- /dev/null	2002-08-05 14:30:58.000000000 +0200
++++ linux/include/asm-i386/ist.h	2003-09-30 11:47:08.000000000 +0200
 @@ -0,0 +1,32 @@
 +#ifndef _ASM_IST_H
 +#define _ASM_IST_H
@@ -465,8 +474,8 @@
 +
 +#endif	/* __KERNEL__ */
 +#endif	/* _ASM_IST_H */
---- linux-original/include/asm-i386/msr.h	Mon Aug 25 13:44:43 2003
-+++ linux/include/asm-i386/msr.h	Thu Sep  4 11:51:38 2003
+--- linux-original/include/asm-i386/msr.h	2003-08-25 13:44:43.000000000 +0200
++++ linux/include/asm-i386/msr.h	2003-09-30 11:47:08.000000000 +0200
 @@ -17,6 +17,21 @@
  			  : /* no outputs */ \
  			  : "c" (msr), "a" (val1), "d" (val2))
@@ -498,8 +507,8 @@
  
  /* Centaur-Hauls/IDT defined MSRs. */
  #define MSR_IDT_FCR1			0x107
---- linux-original/include/asm-i386/smp.h	Fri Nov 29 00:53:15 2002
-+++ linux/include/asm-i386/smp.h	Thu Sep  4 12:37:44 2003
+--- linux-original/include/asm-i386/smp.h	2002-11-29 00:53:15.000000000 +0100
++++ linux/include/asm-i386/smp.h	2003-09-30 11:47:08.000000000 +0200
 @@ -95,6 +95,8 @@
  	return GET_APIC_LOGICAL_ID(*(unsigned long *)(APIC_BASE+APIC_LDR));
  }
@@ -509,8 +518,8 @@
  #endif /* !__ASSEMBLY__ */
  
  #define NO_PROC_ID		0xFF		/* No processor magic marker */
---- linux-original/include/linux/smp.h	Thu Nov 22 20:46:19 2001
-+++ linux/include/linux/smp.h	Thu Sep  4 12:37:44 2003
+--- linux-original/include/linux/smp.h	2001-11-22 20:46:19.000000000 +0100
++++ linux/include/linux/smp.h	2003-09-30 11:47:08.000000000 +0200
 @@ -86,6 +86,7 @@
  #define cpu_number_map(cpu)			0
  #define smp_call_function(func,info,retry,wait)	({ 0; })

Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.5
retrieving revision 1.1.1.6
diff -u -r1.1.1.5 -r1.1.1.6
--- patchin.sh	4 Sep 2003 10:54:29 -0000	1.1.1.5
+++ patchin.sh	30 Sep 2003 11:25:51 -0000	1.1.1.6
@@ -28,6 +28,8 @@
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k6.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.h $1/arch/i386/kernel
+ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c $1/arch/i386/kernel
+ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.h $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-centrino.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-ich.c $1/arch/i386/kernel
