From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: Makefile games
Date: Thu, 13 May 2004 16:12:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040513141247.GA7840@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

As several cpufreq drivers are late_initcalls now [dependency on acpi/processor.c
which is module_init()], we need to use Makefile ordering to assert that
- speedstep-centrino is loaded before acpi [faster: msr instead of io]
- speedstep-centrino, speedstep-ich and acpi are loaded before p4-clockmod
  [frequency and voltage scaling instead of throttling]

Please apply,
	Dominik

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Makefile linux/arch/i386/kernel/cpu/cpufreq/Makefile
--- linux-original/arch/i386/kernel/cpu/cpufreq/Makefile	2004-05-11 22:49:21.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Makefile	2004-05-13 16:09:53.502990184 +0200
@@ -2,15 +2,15 @@
 obj-$(CONFIG_X86_POWERNOW_K7)	+= powernow-k7.o
 obj-$(CONFIG_X86_POWERNOW_K8)	+= powernow-k8.o
 obj-$(CONFIG_X86_LONGHAUL)	+= longhaul.o
-obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 obj-$(CONFIG_ELAN_CPUFREQ)	+= elanfreq.o
 obj-$(CONFIG_X86_LONGRUN)	+= longrun.o  
 obj-$(CONFIG_X86_GX_SUSPMOD)    += gx-suspmod.o
-obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+= speedstep-ich.o
 obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) += speedstep-centrino.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB) += speedstep-lib.o
 obj-$(CONFIG_X86_SPEEDSTEP_SMI) += speedstep-smi.o
+obj-$(CONFIG_X86_ACPI_CPUFREQ)	+= acpi.o
+obj-$(CONFIG_X86_P4_CLOCKMOD)	+= p4-clockmod.o
 
 ifdef CONFIG_X86_ACPI_CPUFREQ
   ifdef CONFIG_ACPI_DEBUG
