From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.57,1.58
Date: Wed, 05 Nov 2003 18:28:13 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AHSO5-0000ZS-Fq@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv2114

Modified Files:
	patch 
Log Message:
Merge with davej cpufreq bk tree.

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.57
retrieving revision 1.58
diff -u -r1.57 -r1.58
--- patch	3 Sep 2003 09:19:58 -0000	1.57
+++ patch	5 Nov 2003 18:27:40 -0000	1.58
@@ -1,135 +0,0 @@
-diff -ruN linux-original/kernel/Makefile linux/kernel/Makefile
---- linux-original/kernel/Makefile	2003-08-26 23:40:13.000000000 +0200
-+++ linux/kernel/Makefile	2003-08-26 23:44:24.000000000 +0200
-@@ -15,7 +15,6 @@
- obj-$(CONFIG_MODULES) += ksyms.o module.o
- obj-$(CONFIG_KALLSYMS) += kallsyms.o
- obj-$(CONFIG_PM) += power/
--obj-$(CONFIG_CPU_FREQ) += cpufreq.o
- obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
- obj-$(CONFIG_COMPAT) += compat.o
- obj-$(CONFIG_IKCONFIG) += configs.o
-
-
-diff -Nru a/arch/i386/boot/setup.S b/arch/i386/boot/setup.S
---- a/arch/i386/boot/setup.S	Wed Aug 20 09:28:33 2003
-+++ b/arch/i386/boot/setup.S	Wed Aug 20 09:28:33 2003
-@@ -506,6 +506,17 @@
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
- #if defined(CONFIG_APM) || defined(CONFIG_APM_MODULE)
- # Then check for an APM BIOS...
- 						# %ds points to the bootsector
-
-
-
-diff -Nru a/arch/i386/kernel/setup.c b/arch/i386/kernel/setup.c
---- a/arch/i386/kernel/setup.c	Wed Aug 20 09:28:33 2003
-+++ b/arch/i386/kernel/setup.c	Wed Aug 20 09:28:33 2003
-@@ -43,7 +43,7 @@
- #include <asm/setup.h>
- #include <asm/arch_hooks.h>
- #include <asm/sections.h>
--#include <asm/io_apic.h>
-+#include <asm/ist.h>
- #include "setup_arch_pre.h"
- #include "mach_resources.h"
- 
-@@ -101,6 +101,7 @@
- 	unsigned char table[0];
- };
- struct edid_info edid_info;
-+struct ist_info ist_info;
- struct e820map e820;
- 
- unsigned char aux_device_present;
-@@ -954,6 +955,7 @@
-  	screen_info = SCREEN_INFO;
- 	edid_info = EDID_INFO;
- 	apm_info.bios = APM_BIOS_INFO;
-+	ist_info = IST_INFO;
- 	saved_videomode = VIDEO_MODE;
- 	printk("Video mode to be used for restore is %lx\n", saved_videomode);
- 	if( SYS_DESC_TABLE.length != 0 ) {
-
-
-
---- linux-2.6.0-test4/arch/i386/kernel/i386_ksyms.c	2003/09/03 08:18:59	1.1
-+++ linux-2.6.0-test4/arch/i386/kernel/i386_ksyms.c	2003/09/03 08:20:27
-@@ -33,6 +33,7 @@
- #include <asm/tlbflush.h>
- #include <asm/nmi.h>
- #include <asm/edd.h>
-+#include <asm/ist.h>
- 
- extern void dump_thread(struct pt_regs *, struct user *);
- extern spinlock_t rtc_lock;
-@@ -209,3 +210,7 @@
- EXPORT_SYMBOL(edd);
- EXPORT_SYMBOL(eddnr);
- #endif
-+
-+#if defined(CONFIG_X86_SPEEDSTEP_SMI) || defined(CONFIG_X86_SPEEDSTEP_SMI_MODULE)
-+EXPORT_SYMBOL(ist_info);
-+#endif
-
-
-diff -Nru a/include/asm-i386/ist.h b/include/asm-i386/ist.h
---- /dev/null	Wed Dec 31 16:00:00 1969
-+++ b/include/asm-i386/ist.h	Wed Aug 20 09:28:34 2003
-@@ -0,0 +1,32 @@
-+#ifndef _ASM_IST_H
-+#define _ASM_IST_H
-+
-+/*
-+ * Include file for the interface to IST BIOS
-+ * Copyright 2002 Andy Grover <andrew.grover@intel.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify it
-+ * under the terms of the GNU General Public License as published by the
-+ * Free Software Foundation; either version 2, or (at your option) any
-+ * later version.
-+ *
-+ * This program is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * General Public License for more details.
-+ */
-+
-+
-+#ifdef __KERNEL__
-+
-+struct ist_info {
-+	unsigned long	signature;
-+	unsigned long	command;
-+	unsigned long	event;
-+	unsigned long	perf_level;
-+};
-+
-+extern struct ist_info ist_info;
-+
-+#endif	/* __KERNEL__ */
-+#endif	/* _ASM_IST_H */
-diff -Nru a/include/asm-i386/setup.h b/include/asm-i386/setup.h
---- a/include/asm-i386/setup.h	Wed Aug 20 09:28:33 2003
-+++ b/include/asm-i386/setup.h	Wed Aug 20 09:28:34 2003
-@@ -26,6 +26,7 @@
- #define E820_MAP_NR (*(char*) (PARAM+E820NR))
- #define E820_MAP    ((struct e820entry *) (PARAM+E820MAP))
- #define APM_BIOS_INFO (*(struct apm_bios_info *) (PARAM+0x40))
-+#define IST_INFO   (*(struct ist_info *) (PARAM+0x60))
- #define DRIVE_INFO (*(struct drive_info_struct *) (PARAM+0x80))
- #define SYS_DESC_TABLE (*(struct sys_desc_table_struct*)(PARAM+0xa0))
- #define MOUNT_ROOT_RDONLY (*(unsigned short *) (PARAM+0x1F2))
