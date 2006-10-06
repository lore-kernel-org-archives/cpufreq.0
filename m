From: v+cpufreq@iki.fi
Subject: Intel Core 2 T6600 (Conroe): Unknown p4-clockmod-capable CPU.
	Please send an e-mail to <linux@brodo.de>
Date: Fri, 6 Oct 2006 16:57:44 +0300
Message-ID: <20061006135744.GL18444@vianova.fi>
Reply-To: vherva@vianova.fi
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

You are probably getting a ton of these, but I did try to search google,
lkml, cpufreq-git and this mailing list and came up with nothing. So perhaps
you can point me to right direction, or ack that Core2 is not (yet)
supported?


So basically I have a Intel Core2 CPU T6600:

   processor       : 0
   vendor_id       : GenuineIntel
   cpu family      : 6
   model           : 15
   model name      : Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
   stepping        : 6
   cpu MHz         : 2394.497
   cache size      : 4096 KB
   physical id     : 0
   siblings        : 2
   core id         : 0
   cpu cores       : 2
   fdiv_bug        : no
   hlt_bug         : no
   f00f_bug        : no
   coma_bug        : no
   fpu             : yes
   fpu_exception   : yes
   cpuid level     : 10
   wp              : yes
   flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
   cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm
   constant_tsc pni monitor ds_cpl vmx est tm2 cx16 xtpr lahf_lm
   bogomips        : 4792.34
   
   processor       : 1
   vendor_id       : GenuineIntel
   cpu family      : 6
   model           : 15
   model name      : Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
   stepping        : 6
   cpu MHz         : 2394.497
   cache size      : 4096 KB
   physical id     : 0
   siblings        : 2
   core id         : 1
   cpu cores       : 2
   fdiv_bug        : no
   hlt_bug         : no
   f00f_bug        : no
   coma_bug        : no
   fpu             : yes
   fpu_exception   : yes
   cpuid level     : 10
   wp              : yes
   flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
   cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm
   constant_tsc pni monitor ds_cpl vmx est tm2 cx16 xtpr lahf_lm
   bogomips        : 4789.18

Motherboard is Asus P5B (i965).
   
Cpufreq enabled in config:
   
   # CPUFreq processor drivers
   #
   CONFIG_X86_ACPI_CPUFREQ=m
   # CONFIG_X86_POWERNOW_K6 is not set
   # CONFIG_X86_POWERNOW_K7 is not set
   # CONFIG_X86_POWERNOW_K8 is not set
   # CONFIG_X86_GX_SUSPMOD is not set
   CONFIG_X86_SPEEDSTEP_CENTRINO=y
   CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
   CONFIG_X86_SPEEDSTEP_ICH=y
   # CONFIG_X86_SPEEDSTEP_SMI is not set
   CONFIG_X86_P4_CLOCKMOD=y
   # CONFIG_X86_CPUFREQ_NFORCE2 is not set
   # CONFIG_X86_LONGRUN is not set
   # CONFIG_X86_LONGHAUL is not set
   
   #
   # shared options
   #
   # CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
   CONFIG_X86_SPEEDSTEP_LIB=y
   CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y
   
Kernel is 2.6.18-rc7 from kernel.org
   
SpeedStep set to "Automatic" in bios (no "on" option"), PECI "Enabled."

Still, I only get "Unknown p4-clockmod-capable CPU." during boot, and
cpufreq-info reports
   cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
   Report errors and bugs to linux@brodo.de, please.
   analyzing CPU 0:
     no or unknown cpufreq driver is active on this CPU
   analyzing CPU 1:
     no or unknown cpufreq driver is active on this CPU
