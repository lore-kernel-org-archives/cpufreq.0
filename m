From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.9,1.1.1.10
Date: Fri, 05 Dec 2003 23:17:02 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1ASPC2-0006LD-HE@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv24372

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
Merge with linux-2.4.23


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.9
retrieving revision 1.1.1.10
diff -u -r1.1.1.9 -r1.1.1.10
--- patch	30 Sep 2003 11:25:50 -0000	1.1.1.9
+++ patch	5 Dec 2003 23:16:59 -0000	1.1.1.10
@@ -1,5 +1,5 @@
 --- linux-original/Documentation/00-INDEX	2001-08-27 16:44:15.000000000 +0200
-+++ linux/Documentation/00-INDEX	2003-09-30 11:47:07.000000000 +0200
++++ linux/Documentation/00-INDEX	2003-12-05 23:54:51.000000000 +0100
 @@ -52,6 +52,8 @@
  	- directory with information on the CD-ROM drivers that Linux has.
  computone.txt
@@ -9,9 +9,9 @@
  cpqarray.txt
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
---- linux-original/Documentation/Configure.help	2003-08-25 13:44:39.000000000 +0200
-+++ linux/Documentation/Configure.help	2003-09-30 11:49:20.000000000 +0200
-@@ -26977,16 +26977,6 @@
+--- linux-original/Documentation/Configure.help	2003-11-28 19:26:19.000000000 +0100
++++ linux/Documentation/Configure.help	2003-12-05 23:54:51.000000000 +0100
+@@ -27904,16 +27904,6 @@
    Say Y if you want support for the ARM926T processor.
    Otherwise, say N.
  
@@ -28,7 +28,7 @@
  SiS
  CONFIG_DRM_SIS
    Choose this option if you have a SIS graphics card. AGP support is
-@@ -27388,6 +27378,154 @@
+@@ -28321,6 +28311,154 @@
  CONFIG_IPMI_WATCHDOG
    This enables the IPMI watchdog timer.
  
@@ -183,9 +183,9 @@
  CRC32 functions
  CONFIG_CRC32
    This option is provided for the case where no in-kernel-tree
---- linux-original/Makefile	2003-08-25 13:44:44.000000000 +0200
-+++ linux/Makefile	2003-09-30 11:47:07.000000000 +0200
-@@ -194,6 +194,7 @@
+--- linux-original/Makefile	2003-11-28 19:26:21.000000000 +0100
++++ linux/Makefile	2003-12-05 23:54:51.000000000 +0100
+@@ -195,6 +195,7 @@
  DRIVERS-$(CONFIG_HOTPLUG_PCI) += drivers/hotplug/vmlinux-obj.o
  DRIVERS-$(CONFIG_ISDN_BOOL) += drivers/isdn/vmlinux-obj.o
  DRIVERS-$(CONFIG_CRYPTO) += crypto/crypto.o
@@ -193,8 +193,29 @@
  
  DRIVERS := $(DRIVERS-y)
  
---- linux-original/arch/i386/config.in	2003-08-25 13:44:39.000000000 +0200
-+++ linux/arch/i386/config.in	2003-09-30 11:50:20.000000000 +0200
+--- linux-original/arch/i386/boot/setup.S	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/boot/setup.S	2003-12-05 23:54:51.000000000 +0100
+@@ -488,6 +488,18 @@
+ 	movw	$0xAA, (0x1ff)			# device present
+ no_psmouse:
+ 
++#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODULE)
++	movl	$0x0000E980, %eax		# IST Support 
++	movl	$0x47534943, %edx		# Request value
++	int	$0x15
++
++	movl	%eax, (96)
++	movl	%ebx, (100)
++	movl	%ecx, (104)
++	movl	%edx, (108)
++#endif
++
++
+ #if defined(CONFIG_APM) || defined(CONFIG_APM_MODULE)
+ # Then check for an APM BIOS...
+ 						# %ds points to the bootsector
+--- linux-original/arch/i386/config.in	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/config.in	2003-12-05 23:54:51.000000000 +0100
 @@ -194,6 +194,33 @@
  
  bool 'Machine Check Exception' CONFIG_X86_MCE
@@ -229,29 +250,8 @@
  tristate 'Toshiba Laptop support' CONFIG_TOSHIBA
  tristate 'Dell laptop support' CONFIG_I8K
  
---- linux-original/arch/i386/boot/setup.S	2002-08-03 02:39:42.000000000 +0200
-+++ linux/arch/i386/boot/setup.S	2003-09-30 11:47:07.000000000 +0200
-@@ -483,6 +483,18 @@
- 	movw	$0xAA, (0x1ff)			# device present
- no_psmouse:
- 
-+#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODULE)
-+	movl	$0x0000E980, %eax		# IST Support 
-+	movl	$0x47534943, %edx		# Request value
-+	int	$0x15
-+
-+	movl	%eax, (96)
-+	movl	%ebx, (100)
-+	movl	%ecx, (104)
-+	movl	%edx, (108)
-+#endif
-+
-+
- #if defined(CONFIG_APM) || defined(CONFIG_APM_MODULE)
- # Then check for an APM BIOS...
- 						# %ds points to the bootsector
---- linux-original/arch/i386/kernel/Makefile	2003-08-25 13:44:39.000000000 +0200
-+++ linux/arch/i386/kernel/Makefile	2003-09-30 11:51:01.000000000 +0200
+--- linux-original/arch/i386/kernel/Makefile	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/kernel/Makefile	2003-12-05 23:58:51.000000000 +0100
 @@ -14,7 +14,8 @@
  
  O_TARGET := kernel.o
@@ -263,9 +263,9 @@
  obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
  		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
 @@ -43,5 +44,17 @@
- obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.o apic.o nmi.o
  obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
  obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
+ obj-$(CONFIG_EDD)             	+= edd.o
 +obj-$(CONFIG_X86_POWERNOW_K6)	+= powernow-k6.o
 +obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
 +obj-$(CONFIG_X86_POWERNOW_K8)	+= powernow-k8.o
@@ -280,17 +280,17 @@
 +obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
  
  include $(TOPDIR)/Rules.make
---- linux-original/arch/i386/kernel/i386_ksyms.c	2003-06-13 16:51:29.000000000 +0200
-+++ linux/arch/i386/kernel/i386_ksyms.c	2003-09-30 11:47:08.000000000 +0200
+--- linux-original/arch/i386/kernel/i386_ksyms.c	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/kernel/i386_ksyms.c	2003-12-06 00:00:46.000000000 +0100
 @@ -28,6 +28,7 @@
  #include <asm/desc.h>
  #include <asm/pgtable.h>
  #include <asm/pgalloc.h>
 +#include <asm/ist.h>
+ #include <asm/edd.h>
  
  extern void dump_thread(struct pt_regs *, struct user *);
- extern spinlock_t rtc_lock;
-@@ -49,6 +50,7 @@
+@@ -50,6 +51,7 @@
  EXPORT_SYMBOL(drive_info);
  #endif
  
@@ -298,7 +298,7 @@
  extern unsigned long get_cmos_time(void);
  
  /* platform dependent support */
-@@ -71,7 +73,9 @@
+@@ -72,7 +74,9 @@
  EXPORT_SYMBOL(pm_idle);
  EXPORT_SYMBOL(pm_power_off);
  EXPORT_SYMBOL(get_cmos_time);
@@ -308,7 +308,7 @@
  EXPORT_SYMBOL(gdt);
  EXPORT_SYMBOL(empty_zero_page);
  
-@@ -130,7 +134,9 @@
+@@ -131,7 +135,9 @@
  EXPORT_SYMBOL(cpu_data);
  EXPORT_SYMBOL(kernel_flag_cacheline);
  EXPORT_SYMBOL(smp_num_cpus);
@@ -318,17 +318,17 @@
  EXPORT_SYMBOL_NOVERS(__write_lock_failed);
  EXPORT_SYMBOL_NOVERS(__read_lock_failed);
  
---- linux-original/arch/i386/kernel/setup.c	2003-08-25 13:44:39.000000000 +0200
-+++ linux/arch/i386/kernel/setup.c	2003-09-30 11:47:08.000000000 +0200
+--- linux-original/arch/i386/kernel/setup.c	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/kernel/setup.c	2003-12-06 00:02:09.000000000 +0100
 @@ -120,6 +120,7 @@
  #include <asm/dma.h>
  #include <asm/mpspec.h>
  #include <asm/mmu_context.h>
 +#include <asm/ist.h>
+ #include <asm/io_apic.h>
+ #include <asm/edd.h>
  /*
-  * Machine setup..
-  */
-@@ -156,6 +157,7 @@
+@@ -158,6 +159,7 @@
  struct drive_info_struct { char dummy[32]; } drive_info;
  struct screen_info screen_info;
  struct apm_info apm_info;
@@ -344,7 +344,7 @@
  #define DRIVE_INFO (*(struct drive_info_struct *) (PARAM+0x80))
  #define SYS_DESC_TABLE (*(struct sys_desc_table_struct*)(PARAM+0xa0))
  #define MOUNT_ROOT_RDONLY (*(unsigned short *) (PARAM+0x1F2))
-@@ -1137,6 +1140,7 @@
+@@ -1160,6 +1163,7 @@
   	drive_info = DRIVE_INFO;
   	screen_info = SCREEN_INFO;
  	apm_info.bios = APM_BIOS_INFO;
@@ -352,8 +352,8 @@
  	if( SYS_DESC_TABLE.length != 0 ) {
  		MCA_bus = SYS_DESC_TABLE.table[3] &0x2;
  		machine_id = SYS_DESC_TABLE.table[0];
---- linux-original/arch/i386/kernel/time.c	2003-06-13 16:51:29.000000000 +0200
-+++ linux/arch/i386/kernel/time.c	2003-09-30 11:47:08.000000000 +0200
+--- linux-original/arch/i386/kernel/time.c	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/kernel/time.c	2003-12-05 23:54:51.000000000 +0100
 @@ -55,6 +55,7 @@
  #include <linux/mc146818rtc.h>
  #include <linux/timex.h>
@@ -362,7 +362,7 @@
  
  #include <asm/fixmap.h>
  #include <asm/cobalt.h>
-@@ -833,6 +834,49 @@
+@@ -835,6 +836,49 @@
  	return 0;
  }
  
@@ -412,7 +412,7 @@
  void __init time_init(void)
  {
  	extern int x86_udelay_tsc;
-@@ -901,6 +945,9 @@
+@@ -903,6 +947,9 @@
  	                	"0" (eax), "1" (edx));
  				printk("Detected %lu.%03lu MHz processor.\n", cpu_khz / 1000, cpu_khz % 1000);
  			}
@@ -422,14 +422,14 @@
  		}
  	}
  
---- linux-original/drivers/Makefile	2003-08-25 13:44:40.000000000 +0200
-+++ linux/drivers/Makefile	2003-09-30 11:47:08.000000000 +0200
+--- linux-original/drivers/Makefile	2003-11-28 19:26:19.000000000 +0100
++++ linux/drivers/Makefile	2003-12-06 00:04:30.000000000 +0100
 @@ -8,12 +8,13 @@
  
  mod-subdirs :=	dio hil mtd sbus video macintosh usb input telephony ide \
  		message/i2o message/fusion scsi md ieee1394 pnp isdn atm \
--		fc4 net/hamradio i2c acpi bluetooth
-+		fc4 net/hamradio i2c acpi bluetooth cpufreq
+-		fc4 net/hamradio i2c acpi bluetooth usb/gadget
++		fc4 net/hamradio i2c acpi bluetooth cpufreq usb/gadget
  
  subdir-y :=	parport char block net sound misc media cdrom hotplug
  subdir-m :=	$(subdir-y)
@@ -439,8 +439,8 @@
  subdir-$(CONFIG_DIO)		+= dio
  subdir-$(CONFIG_PCI)		+= pci
  subdir-$(CONFIG_GSC)		+= gsc
---- /dev/null	2002-08-05 14:30:58.000000000 +0200
-+++ linux/include/asm-i386/ist.h	2003-09-30 11:47:08.000000000 +0200
+--- linux-original/include/asm-i386/ist.h	1970-01-01 01:00:00.000000000 +0100
++++ linux/include/asm-i386/ist.h	2003-12-05 23:54:51.000000000 +0100
 @@ -0,0 +1,32 @@
 +#ifndef _ASM_IST_H
 +#define _ASM_IST_H
@@ -474,8 +474,8 @@
 +
 +#endif	/* __KERNEL__ */
 +#endif	/* _ASM_IST_H */
---- linux-original/include/asm-i386/msr.h	2003-08-25 13:44:43.000000000 +0200
-+++ linux/include/asm-i386/msr.h	2003-09-30 11:47:08.000000000 +0200
+--- linux-original/include/asm-i386/msr.h	2003-11-28 19:26:21.000000000 +0100
++++ linux/include/asm-i386/msr.h	2003-12-05 23:54:51.000000000 +0100
 @@ -17,6 +17,21 @@
  			  : /* no outputs */ \
  			  : "c" (msr), "a" (val1), "d" (val2))
@@ -508,7 +508,7 @@
  /* Centaur-Hauls/IDT defined MSRs. */
  #define MSR_IDT_FCR1			0x107
 --- linux-original/include/asm-i386/smp.h	2002-11-29 00:53:15.000000000 +0100
-+++ linux/include/asm-i386/smp.h	2003-09-30 11:47:08.000000000 +0200
++++ linux/include/asm-i386/smp.h	2003-12-05 23:54:51.000000000 +0100
 @@ -95,6 +95,8 @@
  	return GET_APIC_LOGICAL_ID(*(unsigned long *)(APIC_BASE+APIC_LDR));
  }
@@ -519,7 +519,7 @@
  
  #define NO_PROC_ID		0xFF		/* No processor magic marker */
 --- linux-original/include/linux/smp.h	2001-11-22 20:46:19.000000000 +0100
-+++ linux/include/linux/smp.h	2003-09-30 11:47:08.000000000 +0200
++++ linux/include/linux/smp.h	2003-12-05 23:54:51.000000000 +0100
 @@ -86,6 +86,7 @@
  #define cpu_number_map(cpu)			0
  #define smp_call_function(func,info,retry,wait)	({ 0; })
