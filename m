From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.10,1.1.1.11
Date: Fri, 09 Jul 2004 23:02:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Bj3Re-0000Th-G8@flint.arm.linux.org.uk>
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

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv1824

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
 * update to kernel 2.4.26
 * fix smp build


Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.10
retrieving revision 1.1.1.11
diff -u -r1.1.1.10 -r1.1.1.11
--- patch	5 Dec 2003 23:16:59 -0000	1.1.1.10
+++ patch	9 Jul 2004 22:02:10 -0000	1.1.1.11
@@ -1,6 +1,6 @@
---- linux-original/Documentation/00-INDEX	2001-08-27 16:44:15.000000000 +0200
-+++ linux/Documentation/00-INDEX	2003-12-05 23:54:51.000000000 +0100
-@@ -52,6 +52,8 @@
+--- linux.original/Documentation/00-INDEX	2001-08-27 16:44:15.000000000 +0200
++++ linux/Documentation/00-INDEX	2004-07-09 14:30:15.000000000 +0200
+@@ -52,6 +52,8 @@ cdrom/
  	- directory with information on the CD-ROM drivers that Linux has.
  computone.txt
  	- info on Computone Intelliport II/Plus Multiport Serial Driver
@@ -9,9 +9,9 @@
  cpqarray.txt
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
---- linux-original/Documentation/Configure.help	2003-11-28 19:26:19.000000000 +0100
-+++ linux/Documentation/Configure.help	2003-12-05 23:54:51.000000000 +0100
-@@ -27904,16 +27904,6 @@
+--- linux.original/Documentation/Configure.help	2004-04-14 15:05:24.000000000 +0200
++++ linux/Documentation/Configure.help	2004-07-09 14:30:15.000000000 +0200
+@@ -28178,16 +28178,6 @@ CONFIG_CPU_ARM926T
    Say Y if you want support for the ARM926T processor.
    Otherwise, say N.
  
@@ -28,7 +28,7 @@
  SiS
  CONFIG_DRM_SIS
    Choose this option if you have a SIS graphics card. AGP support is
-@@ -28321,6 +28311,154 @@
+@@ -28603,6 +28593,154 @@ IPMI Watchdog Timer
  CONFIG_IPMI_WATCHDOG
    This enables the IPMI watchdog timer.
  
@@ -183,9 +183,9 @@
  CRC32 functions
  CONFIG_CRC32
    This option is provided for the case where no in-kernel-tree
---- linux-original/Makefile	2003-11-28 19:26:21.000000000 +0100
-+++ linux/Makefile	2003-12-05 23:54:51.000000000 +0100
-@@ -195,6 +195,7 @@
+--- linux.original/Makefile	2004-04-14 15:05:41.000000000 +0200
++++ linux/Makefile	2004-07-09 14:30:15.000000000 +0200
+@@ -194,6 +194,7 @@ DRIVERS-$(CONFIG_BLUEZ) += drivers/bluet
  DRIVERS-$(CONFIG_HOTPLUG_PCI) += drivers/hotplug/vmlinux-obj.o
  DRIVERS-$(CONFIG_ISDN_BOOL) += drivers/isdn/vmlinux-obj.o
  DRIVERS-$(CONFIG_CRYPTO) += crypto/crypto.o
@@ -193,9 +193,9 @@
  
  DRIVERS := $(DRIVERS-y)
  
---- linux-original/arch/i386/boot/setup.S	2003-11-28 19:26:19.000000000 +0100
-+++ linux/arch/i386/boot/setup.S	2003-12-05 23:54:51.000000000 +0100
-@@ -488,6 +488,18 @@
+--- linux.original/arch/i386/boot/setup.S	2004-02-18 14:36:30.000000000 +0100
++++ linux/arch/i386/boot/setup.S	2004-07-09 14:30:15.000000000 +0200
+@@ -490,6 +490,18 @@ no_mca:
  	movw	$0xAA, (0x1ff)			# device present
  no_psmouse:
  
@@ -214,9 +214,9 @@
  #if defined(CONFIG_APM) || defined(CONFIG_APM_MODULE)
  # Then check for an APM BIOS...
  						# %ds points to the bootsector
---- linux-original/arch/i386/config.in	2003-11-28 19:26:19.000000000 +0100
-+++ linux/arch/i386/config.in	2003-12-05 23:54:51.000000000 +0100
-@@ -194,6 +194,33 @@
+--- linux.original/arch/i386/config.in	2004-02-18 14:36:30.000000000 +0100
++++ linux/arch/i386/config.in	2004-07-09 14:30:15.000000000 +0200
+@@ -194,6 +194,33 @@ fi
  
  bool 'Machine Check Exception' CONFIG_X86_MCE
  
@@ -250,9 +250,9 @@
  tristate 'Toshiba Laptop support' CONFIG_TOSHIBA
  tristate 'Dell laptop support' CONFIG_I8K
  
---- linux-original/arch/i386/kernel/Makefile	2003-11-28 19:26:19.000000000 +0100
-+++ linux/arch/i386/kernel/Makefile	2003-12-05 23:58:51.000000000 +0100
-@@ -14,7 +14,8 @@
+--- linux.original/arch/i386/kernel/Makefile	2003-11-28 19:26:19.000000000 +0100
++++ linux/arch/i386/kernel/Makefile	2004-07-09 14:30:15.000000000 +0200
+@@ -14,7 +14,8 @@ all: kernel.o head.o init_task.o
  
  O_TARGET := kernel.o
  
@@ -262,7 +262,7 @@
  
  obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
  		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
-@@ -43,5 +44,17 @@
+@@ -43,5 +44,17 @@ obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.
  obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
  obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
  obj-$(CONFIG_EDD)             	+= edd.o
@@ -280,8 +280,8 @@
 +obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
  
  include $(TOPDIR)/Rules.make
---- linux-original/arch/i386/kernel/i386_ksyms.c	2003-11-28 19:26:19.000000000 +0100
-+++ linux/arch/i386/kernel/i386_ksyms.c	2003-12-06 00:00:46.000000000 +0100
+--- linux.original/arch/i386/kernel/i386_ksyms.c	2004-04-14 15:05:25.000000000 +0200
++++ linux/arch/i386/kernel/i386_ksyms.c	2004-07-09 15:02:19.000000000 +0200
 @@ -28,6 +28,7 @@
  #include <asm/desc.h>
  #include <asm/pgtable.h>
@@ -290,7 +290,7 @@
  #include <asm/edd.h>
  
  extern void dump_thread(struct pt_regs *, struct user *);
-@@ -50,6 +51,7 @@
+@@ -50,6 +51,7 @@ extern struct drive_info_struct drive_in
  EXPORT_SYMBOL(drive_info);
  #endif
  
@@ -298,28 +298,19 @@
  extern unsigned long get_cmos_time(void);
  
  /* platform dependent support */
-@@ -72,7 +74,9 @@
+@@ -71,8 +73,10 @@ EXPORT_SYMBOL(probe_irq_mask);
+ EXPORT_SYMBOL(kernel_thread);
  EXPORT_SYMBOL(pm_idle);
  EXPORT_SYMBOL(pm_power_off);
- EXPORT_SYMBOL(get_cmos_time);
 +EXPORT_SYMBOL(cpu_khz);
+ EXPORT_SYMBOL(get_cmos_time);
  EXPORT_SYMBOL(apm_info);
 +EXPORT_SYMBOL(ist_info);
  EXPORT_SYMBOL(gdt);
  EXPORT_SYMBOL(empty_zero_page);
  
-@@ -131,7 +135,9 @@
- EXPORT_SYMBOL(cpu_data);
- EXPORT_SYMBOL(kernel_flag_cacheline);
- EXPORT_SYMBOL(smp_num_cpus);
-+EXPORT_SYMBOL(smp_num_siblings);
- EXPORT_SYMBOL(cpu_online_map);
-+EXPORT_SYMBOL(cpu_sibling_map);
- EXPORT_SYMBOL_NOVERS(__write_lock_failed);
- EXPORT_SYMBOL_NOVERS(__read_lock_failed);
- 
---- linux-original/arch/i386/kernel/setup.c	2003-11-28 19:26:19.000000000 +0100
-+++ linux/arch/i386/kernel/setup.c	2003-12-06 00:02:09.000000000 +0100
+--- linux.original/arch/i386/kernel/setup.c	2004-04-14 15:05:25.000000000 +0200
++++ linux/arch/i386/kernel/setup.c	2004-07-09 14:30:15.000000000 +0200
 @@ -120,6 +120,7 @@
  #include <asm/dma.h>
  #include <asm/mpspec.h>
@@ -328,7 +319,7 @@
  #include <asm/io_apic.h>
  #include <asm/edd.h>
  /*
-@@ -158,6 +159,7 @@
+@@ -158,6 +159,7 @@ static unsigned int highmem_pages __init
  struct drive_info_struct { char dummy[32]; } drive_info;
  struct screen_info screen_info;
  struct apm_info apm_info;
@@ -336,7 +327,7 @@
  struct sys_desc_table_struct {
  	unsigned short length;
  	unsigned char table[0];
-@@ -201,6 +203,7 @@
+@@ -202,6 +204,7 @@ extern int blk_nohighio;
  #define E820_MAP_NR (*(char*) (PARAM+E820NR))
  #define E820_MAP    ((struct e820entry *) (PARAM+E820MAP))
  #define APM_BIOS_INFO (*(struct apm_bios_info *) (PARAM+0x40))
@@ -344,7 +335,7 @@
  #define DRIVE_INFO (*(struct drive_info_struct *) (PARAM+0x80))
  #define SYS_DESC_TABLE (*(struct sys_desc_table_struct*)(PARAM+0xa0))
  #define MOUNT_ROOT_RDONLY (*(unsigned short *) (PARAM+0x1F2))
-@@ -1160,6 +1163,7 @@
+@@ -1190,6 +1193,7 @@ void __init setup_arch(char **cmdline_p)
   	drive_info = DRIVE_INFO;
   	screen_info = SCREEN_INFO;
  	apm_info.bios = APM_BIOS_INFO;
@@ -352,8 +343,8 @@
  	if( SYS_DESC_TABLE.length != 0 ) {
  		MCA_bus = SYS_DESC_TABLE.table[3] &0x2;
  		machine_id = SYS_DESC_TABLE.table[0];
---- linux-original/arch/i386/kernel/time.c	2003-11-28 19:26:19.000000000 +0100
-+++ linux/arch/i386/kernel/time.c	2003-12-05 23:54:51.000000000 +0100
+--- linux.original/arch/i386/kernel/time.c	2004-02-18 14:36:30.000000000 +0100
++++ linux/arch/i386/kernel/time.c	2004-07-09 14:30:15.000000000 +0200
 @@ -55,6 +55,7 @@
  #include <linux/mc146818rtc.h>
  #include <linux/timex.h>
@@ -362,7 +353,7 @@
  
  #include <asm/fixmap.h>
  #include <asm/cobalt.h>
-@@ -835,6 +836,49 @@
+@@ -834,6 +835,49 @@ bad_ctc:
  	return 0;
  }
  
@@ -412,7 +403,7 @@
  void __init time_init(void)
  {
  	extern int x86_udelay_tsc;
-@@ -903,6 +947,9 @@
+@@ -902,6 +946,9 @@ void __init time_init(void)
  	                	"0" (eax), "1" (edx));
  				printk("Detected %lu.%03lu MHz processor.\n", cpu_khz / 1000, cpu_khz % 1000);
  			}
@@ -422,8 +413,8 @@
  		}
  	}
  
---- linux-original/drivers/Makefile	2003-11-28 19:26:19.000000000 +0100
-+++ linux/drivers/Makefile	2003-12-06 00:04:30.000000000 +0100
+--- linux.original/drivers/Makefile	2003-11-28 19:26:19.000000000 +0100
++++ linux/drivers/Makefile	2004-07-09 14:30:15.000000000 +0200
 @@ -8,12 +8,13 @@
  
  mod-subdirs :=	dio hil mtd sbus video macintosh usb input telephony ide \
@@ -439,8 +430,8 @@
  subdir-$(CONFIG_DIO)		+= dio
  subdir-$(CONFIG_PCI)		+= pci
  subdir-$(CONFIG_GSC)		+= gsc
---- linux-original/include/asm-i386/ist.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux/include/asm-i386/ist.h	2003-12-05 23:54:51.000000000 +0100
+--- /dev/null	2004-06-22 21:52:41.000000000 +0200
++++ linux/include/asm-i386/ist.h	2004-07-09 14:30:15.000000000 +0200
 @@ -0,0 +1,32 @@
 +#ifndef _ASM_IST_H
 +#define _ASM_IST_H
@@ -474,8 +465,8 @@
 +
 +#endif	/* __KERNEL__ */
 +#endif	/* _ASM_IST_H */
---- linux-original/include/asm-i386/msr.h	2003-11-28 19:26:21.000000000 +0100
-+++ linux/include/asm-i386/msr.h	2003-12-05 23:54:51.000000000 +0100
+--- linux.original/include/asm-i386/msr.h	2003-11-28 19:26:21.000000000 +0100
++++ linux/include/asm-i386/msr.h	2004-07-09 14:30:15.000000000 +0200
 @@ -17,6 +17,21 @@
  			  : /* no outputs */ \
  			  : "c" (msr), "a" (val1), "d" (val2))
@@ -507,9 +498,9 @@
  
  /* Centaur-Hauls/IDT defined MSRs. */
  #define MSR_IDT_FCR1			0x107
---- linux-original/include/asm-i386/smp.h	2002-11-29 00:53:15.000000000 +0100
-+++ linux/include/asm-i386/smp.h	2003-12-05 23:54:51.000000000 +0100
-@@ -95,6 +95,8 @@
+--- linux.original/include/asm-i386/smp.h	2002-11-29 00:53:15.000000000 +0100
++++ linux/include/asm-i386/smp.h	2004-07-09 14:42:36.000000000 +0200
+@@ -95,6 +95,8 @@ static __inline int logical_smp_processo
  	return GET_APIC_LOGICAL_ID(*(unsigned long *)(APIC_BASE+APIC_LDR));
  }
  
@@ -518,9 +509,9 @@
  #endif /* !__ASSEMBLY__ */
  
  #define NO_PROC_ID		0xFF		/* No processor magic marker */
---- linux-original/include/linux/smp.h	2001-11-22 20:46:19.000000000 +0100
-+++ linux/include/linux/smp.h	2003-12-05 23:54:51.000000000 +0100
-@@ -86,6 +86,7 @@
+--- linux.original/include/linux/smp.h	2001-11-22 20:46:19.000000000 +0100
++++ linux/include/linux/smp.h	2004-07-09 14:42:36.000000000 +0200
+@@ -86,6 +86,7 @@ extern volatile int smp_msg_id;
  #define cpu_number_map(cpu)			0
  #define smp_call_function(func,info,retry,wait)	({ 0; })
  #define cpu_online_map				1
