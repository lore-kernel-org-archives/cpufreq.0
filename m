From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq patch,1.1.1.4,1.1.1.5
Date: Thu, 28 Aug 2003 14:37:53 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E19sMyH-0004tu-9p@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv18835

Modified Files:
      Tag: LINUX_2_4
	patch 
Log Message:
fix patch.  2 hunks are the same.

Index: patch
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/patch,v
retrieving revision 1.1.1.4
retrieving revision 1.1.1.5
diff -u -r1.1.1.4 -r1.1.1.5
--- patch	28 Aug 2003 13:32:48 -0000	1.1.1.4
+++ patch	28 Aug 2003 13:37:50 -0000	1.1.1.5
@@ -10,34 +10,6 @@
  	- info on using Compaq's SMART2 Intelligent Disk Array Controllers.
  devices.txt
 
---- linux-2.4.22/arch/i386/kernel/Makefile	Mon Aug 25 13:44:39 2003
-+++ linux-2.4.22-cpufreq/arch/i386/kernel/Makefile	Thu Aug 28 15:23:02 2003
-@@ -14,7 +14,8 @@
- 
- O_TARGET := kernel.o
- 
--export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o setup.o
-+export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o \
-+		setup.o speedstep-lib.o
- 
- obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
- 		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \
-@@ -43,5 +44,15 @@
- obj-$(CONFIG_X86_LOCAL_APIC)	+= mpparse.o apic.o nmi.o
- obj-$(CONFIG_X86_IO_APIC)	+= io_apic.o
- obj-$(CONFIG_X86_VISWS_APIC)	+= visws_apic.o
-+obj-$(CONFIG_X86_POWERNOW_K6)	+= powernow-k6.o
-+obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
-+obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
-+obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+= speedstep-centrino.o
-+obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+= speedstep-piix4.o speedstep-lib.o
-+obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o speedstep-lib.o
-+obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
-+obj-$(CONFIG_ELAN_CPUFREQ)	+= elanfreq.o
-+obj-$(CONFIG_X86_LONGRUN)	+= longrun.o  
-+obj-$(CONFIG_X86_GX_SUSPMOD)	+= gx-suspmod.o  
- 
- include $(TOPDIR)/Rules.make
 --- linux-2.4.22/Documentation/Configure.help	Mon Aug 25 13:44:39 2003
 +++ linux-2.4.22-cpufreq/Documentation/Configure.help	Thu Aug 28 15:24:46 2003
 @@ -26977,16 +26977,6 @@
