From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.3,1.1.1.4
Date: Thu, 28 Aug 2003 14:32:51 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19sMtP-0004qM-Uu@flint.arm.linux.org.uk>
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
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq
In directory flint:/tmp/cvs-serv18613

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
add driver speedstep-piix4 in 2.4 series

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.3
retrieving revision 1.1.1.4
diff -u -r1.1.1.3 -r1.1.1.4
--- patch	27 Aug 2003 13:45:35 -0000	1.1.1.3
+++ patch	28 Aug 2003 13:32:48 -0000	1.1.1.4
@@ -9,8 +9,37 @@
  cpqarray.txt
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
---- linux-2.4.22-rc4/Documentation/Configure.help	Mon Aug 25 13:40:23 2003
-+++ linux-2.4.22-rc4-cpufreq/Documentation/Configure.help	Mon Aug 25 14:08:52 2003
+
+--- linux-2.4.22/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
++++ linux-2.4.22-cpufreq/arch/i386/kernel/Makefile	Thu Aug 28 15:23:02 2003
+@@ -14,7 +14,8 @@
+ 
+ O_TARGET := kernel.o
+ 
+-export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o setup.o
++export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o \
++		setup.o speedstep-lib.o
+ 
+ obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
+ 		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
+@@ -43,5 +44,15 @@
+ obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.o apic.o nmi.o
+ obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
+ obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
++obj-$(CONFIG_X86_POWERNOW_K6)	+= powernow-k6.o
++obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
++obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
++obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
++obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o speedstep-lib.o
++obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o speedstep-lib.o
++obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
++obj-$(CONFIG_ELAN_CPUFREQ)	+= elanfreq.o
++obj-$(CONFIG_X86_LONGRUN)	+= longrun.o  
++obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
+ 
+ include $(TOPDIR)/Rules.make
+--- linux-2.4.22/Documentation/Configure.help	Mon Aug 25 13:44:39 2003
++++ linux-2.4.22-cpufreq/Documentation/Configure.help	Thu Aug 28 15:24:46 2003
 @@ -26977,16 +26977,6 @@
    Say Y if you want support for the ARM926T processor.
    Otherwise, say N.
@@ -28,7 +57,7 @@
  SiS
  CONFIG_DRM_SIS
    Choose this option if you have a SIS graphics card. AGP support is
-@@ -27387,6 +27377,128 @@
+@@ -27387,6 +27377,138 @@
  IPMI Watchdog Timer
  CONFIG_IPMI_WATCHDOG
    This enables the IPMI watchdog timer.
@@ -111,9 +140,19 @@
 +
 +  If in doubt, say N.
 +
++CONFIG_X86_SPEEDSTEP_PIIX4
++  This adds the CPUFreq driver for certain mobile Intel Pentium III
++  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
++  mobile Intel Pentium 4 P4-Ms on chipsets with an Intel PIIX4
++  southbridge.
++
++  For details, take a look at linux/Documentation/cpu-freq. 
++
++  If in doubt, say N.
++
 +CONFIG_X86_SPEEDSTEP_ICH
 +  This adds the CPUFreq driver for certain mobile Intel Pentium III
-+  (Coppermine), all mobile Intel Pentium III-M (Tulaatin) and all
++  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
 +  mobile Intel Pentium 4 P4-Ms on chipsets with an Intel ICH2, ICH3,
 +  or ICH4 southbridge.
 +
@@ -167,9 +206,10 @@
  
  DRIVERS := $(DRIVERS-y)
  
---- linux-2.4.22-rc4/arch/i386/config.in	Mon Aug 25 13:40:23 2003
-+++ linux-2.4.22-rc4-cpufreq/arch/i386/config.in	Mon Aug 25 14:08:52 2003
-@@ -194,6 +194,30 @@
+
+--- linux-2.4.22/arch/i386/config.in	Mon Aug 25 13:44:39 2003
++++ linux-2.4.22-cpufreq/arch/i386/config.in	Thu Aug 28 15:25:45 2003
+@@ -194,6 +194,31 @@
  
  bool 'Machine Check Exception' CONFIG_X86_MCE
  
@@ -189,6 +229,7 @@
 +       dep_tristate ' AMD Elan' CONFIG_ELAN_CPUFREQ $CONFIG_CPU_FREQ_TABLE
 +   fi
 +   dep_tristate ' VIA Cyrix III Longhaul' CONFIG_X86_LONGHAUL $CONFIG_CPU_FREQ_TABLE
++   dep_tristate ' Intel Speedstep (PIIX4)' CONFIG_X86_SPEEDSTEP_PIIX4  $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Speedstep (ICH)' CONFIG_X86_SPEEDSTEP_ICH  $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Pentium-M Enhanced SpeedStep' CONFIG_X86_SPEEDSTEP_CENTRINO $CONFIG_CPU_FREQ_TABLE
 +   dep_tristate ' Intel Pentium 4 clock modulation' CONFIG_X86_P4_CLOCKMOD $CONFIG_CPU_FREQ_TABLE
@@ -200,8 +241,9 @@
  tristate 'Toshiba Laptop support' CONFIG_TOSHIBA
  tristate 'Dell laptop support' CONFIG_I8K
  
---- linux-2.4.22-rc4/arch/i386/kernel/Makefile	Mon Aug 25 13:40:23 2003
-+++ linux-2.4.22-rc4-cpufreq/arch/i386/kernel/Makefile	Mon Aug 25 14:08:52 2003
+
+--- linux-2.4.22/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
++++ linux-2.4.22-cpufreq/arch/i386/kernel/Makefile	Thu Aug 28 15:23:02 2003
 @@ -14,7 +14,8 @@
  
  O_TARGET := kernel.o
@@ -212,7 +254,7 @@
  
  obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
  		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
-@@ -43,5 +44,14 @@
+@@ -43,5 +44,15 @@
  obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.o apic.o nmi.o
  obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
  obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
@@ -220,6 +262,7 @@
 +obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
 +obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
 +obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
++obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o speedstep-lib.o
 +obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o speedstep-lib.o
 +obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 +obj-$(CONFIG_ELAN_CPUFREQ)	+= elanfreq.o
@@ -227,6 +270,7 @@
 +obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
  
  include $(TOPDIR)/Rules.make
+
 --- linux-2.4.22-rc4/arch/i386/kernel/i386_ksyms.c	Fri Jun 13 16:51:29 2003
 +++ linux-2.4.22-rc4-cpufreq/arch/i386/kernel/i386_ksyms.c	Mon Aug 25 14:08:52 2003
 @@ -49,6 +49,7 @@
