From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.5,1.1.1.6 patchin.sh,1.1.1.4,1.1.1.5
Date: Thu, 04 Sep 2003 11:54:33 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19url3-0002g6-7a@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv10284

Modified Files:
      Tag: LINUX_2_4
	patch patchin.sh 
Log Message:
- added speedstep-smi
- fix signature if int15 do not work


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.5
retrieving revision 1.1.1.6
diff -u -r1.1.1.5 -r1.1.1.6
--- patch	28 Aug 2003 13:37:50 -0000	1.1.1.5
+++ patch	4 Sep 2003 10:54:29 -0000	1.1.1.6
@@ -1,5 +1,5 @@
---- linux-2.4.22-rc4/Documentation/00-INDEX	Mon Aug 27 16:44:15 2001
-+++ linux-2.4.22-rc4-cpufreq/Documentation/00-INDEX	Mon Aug 25 14:08:52 2003
+--- linux-original/Documentation/00-INDEX	Mon Aug 27 16:44:15 2001
++++ linux/Documentation/00-INDEX	Thu Sep  4 11:51:38 2003
 @@ -52,6 +52,8 @@
  	- directory with information on the CD-ROM drivers that Linux has.
  computone.txt
@@ -9,9 +9,8 @@
  cpqarray.txt
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
-
---- linux-2.4.22/Documentation/Configure.help	Mon Aug 25 13:44:39 2003
-+++ linux-2.4.22-cpufreq/Documentation/Configure.help	Thu Aug 28 15:24:46 2003
+--- linux-original/Documentation/Configure.help	Mon Aug 25 13:44:39 2003
++++ linux/Documentation/Configure.help	Thu Sep  4 12:10:37 2003
 @@ -26977,16 +26977,6 @@
    Say Y if you want support for the ARM926T processor.
    Otherwise, say N.
@@ -29,7 +28,7 @@
  SiS
  CONFIG_DRM_SIS
    Choose this option if you have a SIS graphics card. AGP support is
-@@ -27387,6 +27377,138 @@
+@@ -27387,6 +27377,147 @@
  IPMI Watchdog Timer
  CONFIG_IPMI_WATCHDOG
    This enables the IPMI watchdog timer.
@@ -140,6 +139,15 @@
 +
 +  If in doubt, say N.
 +
++CONFIG_X86_SPEEDSTEP_SMI
++  This adds the CPUFreq driver for certain mobile Intel Pentium III
++  (Coppermine), all mobile Intel Pentium III-M (Tualatin)  
++  on systems which have an Intel 440BX/ZX/MX southbridge.
++
++  For details, take a look at linux/Documentation/cpu-freq.
++
++  If in doubt, say N.
++
 +CONFIG_X86_LONGRUN
 +  This adds the CPUFreq driver for Transmeta Crusoe processors which
 +  support LongRun.
@@ -168,8 +176,8 @@
  
  CRC32 functions
  CONFIG_CRC32
---- linux-2.4.22-rc4/Makefile	Mon Aug 25 13:40:23 2003
-+++ linux-2.4.22-rc4-cpufreq/Makefile	Mon Aug 25 14:08:52 2003
+--- linux-original/Makefile	Mon Aug 25 13:44:44 2003
++++ linux/Makefile	Thu Sep  4 11:51:38 2003
 @@ -194,6 +194,7 @@
  DRIVERS-$(CONFIG_HOTPLUG_PCI) += drivers/hotplug/vmlinux-obj.o
  DRIVERS-$(CONFIG_ISDN_BOOL) += drivers/isdn/vmlinux-obj.o
@@ -178,10 +186,9 @@
  
  DRIVERS := $(DRIVERS-y)
  
-
---- linux-2.4.22/arch/i386/config.in	Mon Aug 25 13:44:39 2003
-+++ linux-2.4.22-cpufreq/arch/i386/config.in	Thu Aug 28 15:25:45 2003
-@@ -194,6 +194,31 @@
+--- linux-original/arch/i386/config.in	Mon Aug 25 13:44:39 2003
++++ linux/arch/i386/config.in	Thu Sep  4 12:20:55 2003
+@@ -194,6 +194,32 @@
  
  bool 'Machine Check Exception' CONFIG_X86_MCE
  
@@ -202,6 +209,7 @@
 +   fi
 +   dep_tristate ' VIA Cyrix III Longhaul' CONFIG_X86_LONGHAUL $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Speedstep (PIIX4)' CONFIG_X86_SPEEDSTEP_PIIX4  $CONFIG_CPU_FREQ_TABLE
++   dep_tristate ' Intel SpeedStep on 440BX/ZX/MX chipsets (SMI interface)' CONFIG_X86_SPEEDSTEP_SMI  $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Speedstep (ICH)' CONFIG_X86_SPEEDSTEP_ICH  $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Pentium-M Enhanced SpeedStep' CONFIG_X86_SPEEDSTEP_CENTRINO $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Pentium 4 clock modulation' CONFIG_X86_P4_CLOCKMOD $CONFIG_CPU_FREQ_TABLE
@@ -213,9 +221,8 @@
  tristate 'Toshiba Laptop support' CONFIG_TOSHIBA
  tristate 'Dell laptop support' CONFIG_I8K
  
-
---- linux-2.4.22/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
-+++ linux-2.4.22-cpufreq/arch/i386/kernel/Makefile	Thu Aug 28 15:23:02 2003
+--- linux-original/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
++++ linux/arch/i386/kernel/Makefile	Thu Sep  4 12:14:03 2003
 @@ -14,7 +14,8 @@
  
  O_TARGET := kernel.o
@@ -226,7 +233,7 @@
  
  obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
  		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
-@@ -43,5 +44,15 @@
+@@ -43,5 +44,16 @@
  obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.o apic.o nmi.o
  obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
  obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
@@ -235,6 +242,7 @@
 +obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
 +obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
 +obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o speedstep-lib.o
++obj-$(CONFIG_X86_SPEEDSTEP_SMI)	+= speedstep-smi.o speedstep-lib.o
 +obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o speedstep-lib.o
 +obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 +obj-$(CONFIG_ELAN_CPUFREQ)	+= elanfreq.o
@@ -242,10 +250,17 @@
 +obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
  
  include $(TOPDIR)/Rules.make
-
---- linux-2.4.22-rc4/arch/i386/kernel/i386_ksyms.c	Fri Jun 13 16:51:29 2003
-+++ linux-2.4.22-rc4-cpufreq/arch/i386/kernel/i386_ksyms.c	Mon Aug 25 14:08:52 2003
-@@ -49,6 +49,7 @@
+--- linux-original/arch/i386/kernel/i386_ksyms.c	Fri Jun 13 16:51:29 2003
++++ linux/arch/i386/kernel/i386_ksyms.c	Thu Sep  4 12:43:17 2003
+@@ -28,6 +28,7 @@
+ #include <asm/desc.h>
+ #include <asm/pgtable.h>
+ #include <asm/pgalloc.h>
++#include <asm/ist.h>
+ 
+ extern void dump_thread(struct pt_regs *, struct user *);
+ extern spinlock_t rtc_lock;
+@@ -49,6 +50,7 @@
  EXPORT_SYMBOL(drive_info);
  #endif
  
@@ -253,15 +268,17 @@
  extern unsigned long get_cmos_time(void);
  
  /* platform dependent support */
-@@ -71,6 +72,7 @@
+@@ -71,7 +73,9 @@
  EXPORT_SYMBOL(pm_idle);
  EXPORT_SYMBOL(pm_power_off);
  EXPORT_SYMBOL(get_cmos_time);
 +EXPORT_SYMBOL(cpu_khz);
  EXPORT_SYMBOL(apm_info);
++EXPORT_SYMBOL(ist_info);
  EXPORT_SYMBOL(gdt);
  EXPORT_SYMBOL(empty_zero_page);
-@@ -130,7 +132,9 @@
+ 
+@@ -130,7 +134,9 @@
  EXPORT_SYMBOL(cpu_data);
  EXPORT_SYMBOL(kernel_flag_cacheline);
  EXPORT_SYMBOL(smp_num_cpus);
@@ -271,8 +288,42 @@
  EXPORT_SYMBOL_NOVERS(__write_lock_failed);
  EXPORT_SYMBOL_NOVERS(__read_lock_failed);
  
---- linux-2.4.22-rc4/arch/i386/kernel/time.c	Fri Jun 13 16:51:29 2003
-+++ linux-2.4.22-rc4-cpufreq/arch/i386/kernel/time.c	Mon Aug 25 14:08:52 2003
+--- linux-original/arch/i386/kernel/setup.c	Mon Aug 25 13:44:39 2003
++++ linux/arch/i386/kernel/setup.c	Thu Sep  4 12:00:19 2003
+@@ -120,6 +120,7 @@
+ #include <asm/dma.h>
+ #include <asm/mpspec.h>
+ #include <asm/mmu_context.h>
++#include <asm/ist.h>
+ /*
+  * Machine setup..
+  */
+@@ -156,6 +157,7 @@
+ struct drive_info_struct { char dummy[32]; } drive_info;
+ struct screen_info screen_info;
+ struct apm_info apm_info;
++struct ist_info ist_info;
+ struct sys_desc_table_struct {
+ 	unsigned short length;
+ 	unsigned char table[0];
+@@ -201,6 +203,7 @@
+ #define E820_MAP_NR (*(char*) (PARAM+E820NR))
+ #define E820_MAP    ((struct e820entry *) (PARAM+E820MAP))
+ #define APM_BIOS_INFO (*(struct apm_bios_info *) (PARAM+0x40))
++#define IST_INFO (*(struct ist_info *) (PARAM+0x60))
+ #define DRIVE_INFO (*(struct drive_info_struct *) (PARAM+0x80))
+ #define SYS_DESC_TABLE (*(struct sys_desc_table_struct*)(PARAM+0xa0))
+ #define MOUNT_ROOT_RDONLY (*(unsigned short *) (PARAM+0x1F2))
+@@ -1137,6 +1140,7 @@
+  	drive_info = DRIVE_INFO;
+  	screen_info = SCREEN_INFO;
+ 	apm_info.bios = APM_BIOS_INFO;
++	ist_info = IST_INFO;
+ 	if( SYS_DESC_TABLE.length != 0 ) {
+ 		MCA_bus = SYS_DESC_TABLE.table[3] &0x2;
+ 		machine_id = SYS_DESC_TABLE.table[0];
+--- linux-original/arch/i386/kernel/time.c	Fri Jun 13 16:51:29 2003
++++ linux/arch/i386/kernel/time.c	Thu Sep  4 11:51:38 2003
 @@ -55,6 +55,7 @@
  #include <linux/mc146818rtc.h>
  #include <linux/timex.h>
@@ -341,8 +392,8 @@
  		}
  	}
  
---- linux-2.4.22-rc4/drivers/Makefile	Mon Aug 25 13:40:24 2003
-+++ linux-2.4.22-rc4-cpufreq/drivers/Makefile	Mon Aug 25 14:08:52 2003
+--- linux-original/drivers/Makefile	Mon Aug 25 13:44:40 2003
++++ linux/drivers/Makefile	Thu Sep  4 11:51:38 2003
 @@ -8,12 +8,13 @@
  
  mod-subdirs :=	dio hil mtd sbus video macintosh usb input telephony ide \
@@ -358,8 +409,43 @@
  subdir-$(CONFIG_DIO)		+= dio
  subdir-$(CONFIG_PCI)		+= pci
  subdir-$(CONFIG_GSC)		+= gsc
---- linux-2.4.22-rc4/include/asm-i386/msr.h	Mon Aug 25 13:40:27 2003
-+++ linux-2.4.22-rc4-cpufreq/include/asm-i386/msr.h	Mon Aug 25 14:36:15 2003
+--- /dev/null	Thu Jan  1 01:00:00 1970
++++ linux/include/asm-i386/ist.h	Thu Sep  4 11:55:46 2003
+@@ -0,0 +1,32 @@
++#ifndef _ASM_IST_H
++#define _ASM_IST_H
++
++/*
++ * Include file for the interface to IST BIOS
++ * Copyright 2002 Andy Grover <andrew.grover@intel.com>
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License as published by the
++ * Free Software Foundation; either version 2, or (at your option) any
++ * later version.
++ *
++ * This program is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ */
++
++
++#ifdef __KERNEL__
++
++struct ist_info {
++	unsigned long	signature;
++	unsigned long	command;
++	unsigned long	event;
++	unsigned long	perf_level;
++};
++
++extern struct ist_info ist_info;
++
++#endif	/* __KERNEL__ */
++#endif	/* _ASM_IST_H */
+--- linux-original/include/asm-i386/msr.h	Mon Aug 25 13:44:43 2003
++++ linux/include/asm-i386/msr.h	Thu Sep  4 11:51:38 2003
 @@ -17,6 +17,21 @@
  			  : /* no outputs */ \
  			  : "c" (msr), "a" (val1), "d" (val2))
@@ -391,8 +477,8 @@
  
  /* Centaur-Hauls/IDT defined MSRs. */
  #define MSR_IDT_FCR1			0x107
---- linux-2.4.22-rc4/include/asm-i386/smp.h	Fri Nov 29 00:53:15 2002
-+++ linux-2.4.22-rc4-cpufreq/include/asm-i386/smp.h	Mon Aug 25 14:15:31 2003
+--- linux-original/include/asm-i386/smp.h	Fri Nov 29 00:53:15 2002
++++ linux/include/asm-i386/smp.h	Thu Sep  4 12:37:44 2003
 @@ -95,6 +95,8 @@
  	return GET_APIC_LOGICAL_ID(*(unsigned long *)(APIC_BASE+APIC_LDR));
  }
@@ -402,8 +488,8 @@
  #endif /* !__ASSEMBLY__ */
  
  #define NO_PROC_ID		0xFF		/* No processor magic marker */
---- linux-2.4.22-rc4/include/linux/smp.h	Thu Nov 22 20:46:19 2001
-+++ linux-2.4.22-rc4-cpufreq/include/linux/smp.h	Mon Aug 25 14:15:31 2003
+--- linux-original/include/linux/smp.h	Thu Nov 22 20:46:19 2001
++++ linux/include/linux/smp.h	Thu Sep  4 12:37:44 2003
 @@ -86,6 +86,7 @@
  #define cpu_number_map(cpu)			0
  #define smp_call_function(func,info,retry,wait)	({ 0; })

Index: patchin.sh
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patchin.sh,v
retrieving revision 1.1.1.4
retrieving revision 1.1.1.5
diff -u -r1.1.1.4 -r1.1.1.5
--- patchin.sh	28 Aug 2003 16:16:38 -0000	1.1.1.4
+++ patchin.sh	4 Sep 2003 10:54:29 -0000	1.1.1.5
@@ -29,6 +29,7 @@
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.h $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-centrino.c $1/arch/i386/kernel
+ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-smi.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-ich.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c $1/arch/i386/kernel
 ln -sf $cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.h $1/arch/i386/kernel
