From: Bas Mevissen <bas@basmevissen.nl>
Subject: Re: Cpufreq for 2.4: what is the best source?
Date: Tue, 19 Aug 2003 00:08:18 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308190008.18974.bas@basmevissen.nl>
References: <3F3CB378.1000607@basmevissen.nl> <3F409E54.20001@basmevissen.nl> <20030818175357.GC1570@brodo.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_S5UQ/AcFNlMWuE7"
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030818175357.GC1570@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: Dominik Brodowski <linux@brodo.de>, Bas Mevissen <ml@basmevissen.nl>
Cc: Bas Mevissen <sgm@basmevissen.nl>, Cpufreq@www.linux.org.uk


--Boundary-00=_S5UQ/AcFNlMWuE7
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 August 2003 19:53, Dominik Brodowski wrote:
>
> Already done. As Dave's site isn't yet back online, it can temporarily be
> accessed at
> http://www.brodo.de/cpufreq_tmp/cpufreq-2.4.22-rc2-1__.gz
>

Hmmm. A few problems with this patch:

1) double quotes "userspace" governor configuration text confuse make 
menuconfig. So it shows no help text. Escaping them didn't help, so I made a 
new text. Note that  this is a problem in the -ac too.

--- linux-2.4.22-rc2-sgm1/arch/i386/config.in.orig	2003-08-18 
19:37:12.000000000 +0200
+++ linux-2.4.22-rc2-sgm1/arch/i386/config.in	2003-08-18 20:32:59.000000000 
+0200
@@ -201,7 +201,7 @@
    bool ' CPU frequency table helpers' CONFIG_CPU_FREQ_TABLE
    define_bool CONFIG_CPU_FREQ_PROC_INTF y
    comment 'CPUFreq governors'
-   bool ' "userspace" for userspace frequency scaling' 
CONFIG_CPU_FREQ_GOV_USERSPACE
+   bool ' Support for governing from userspace' CONFIG_CPU_FREQ_GOV_USERSPACE
    define_bool CONFIG_CPU_FREQ_24_API y
    comment 'CPUFreq processor drivers'
    dep_tristate ' AMD Mobile K6-2/K6-3 PowerNow!' CONFIG_X86_POWERNOW_K6 
$CONFIG_CPU_FREQ_TABLE

2) Compile error from speedstep-lib.c caused by exported symbols. Patch below:

--- linux-2.4.22-rc2-sgm1/arch/i386/kernel/Makefile.orig	2003-08-18 
20:58:28.000000000 +0200
+++ linux-2.4.22-rc2-sgm1/arch/i386/kernel/Makefile	2003-08-18 
21:56:15.000000000 +0200
@@ -14,7 +14,7 @@
 
 O_TARGET := kernel.o
 
-export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o 
setup.o
+export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o 
setup.o speedstep-lib.o
 
 obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
 		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \

Files attached for convieniance :-)

Regards,

Bas.

--Boundary-00=_S5UQ/AcFNlMWuE7
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="cpufreq_config.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cpufreq_config.diff"

--- linux-2.4.22-rc2-sgm1/arch/i386/config.in.orig	2003-08-18 19:37:12.000000000 +0200
+++ linux-2.4.22-rc2-sgm1/arch/i386/config.in	2003-08-18 20:32:59.000000000 +0200
@@ -201,7 +201,7 @@
    bool ' CPU frequency table helpers' CONFIG_CPU_FREQ_TABLE
    define_bool CONFIG_CPU_FREQ_PROC_INTF y
    comment 'CPUFreq governors'
-   bool ' "userspace" for userspace frequency scaling' CONFIG_CPU_FREQ_GOV_USERSPACE
+   bool ' Support for governing from userspace' CONFIG_CPU_FREQ_GOV_USERSPACE
    define_bool CONFIG_CPU_FREQ_24_API y
    comment 'CPUFreq processor drivers'
    dep_tristate ' AMD Mobile K6-2/K6-3 PowerNow!' CONFIG_X86_POWERNOW_K6 $CONFIG_CPU_FREQ_TABLE

--Boundary-00=_S5UQ/AcFNlMWuE7
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="cpufreq_speedstep_lib_build_fix.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cpufreq_speedstep_lib_build_fix.diff"

--- linux-2.4.22-rc2-sgm1/arch/i386/kernel/Makefile.orig	2003-08-18 20:58:28.000000000 +0200
+++ linux-2.4.22-rc2-sgm1/arch/i386/kernel/Makefile	2003-08-18 21:56:15.000000000 +0200
@@ -14,7 +14,7 @@
 
 O_TARGET := kernel.o
 
-export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o setup.o
+export-objs     := mca.o mtrr.o msr.o cpuid.o microcode.o i386_ksyms.o time.o setup.o speedstep-lib.o
 
 obj-y	:= process.o semaphore.o signal.o entry.o traps.o irq.o vm86.o \
 		ptrace.o i8259.o ioport.o ldt.o setup.o time.o sys_i386.o \

--Boundary-00=_S5UQ/AcFNlMWuE7--
