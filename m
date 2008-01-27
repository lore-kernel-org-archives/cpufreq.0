From: Markus Pitha <markus.pitha@pithax.net>
Subject: Unknown p4-clockmod-capable CPU
Date: Sun, 27 Jan 2008 21:04:30 +0100
Message-ID: <479CE3CE.2050201@pithax.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Hello,

I tried to use cpufreq on my notebook. I couldn't get it run. "modprobe 
acpi_cpufreq" or any other try like "modprobe p4-clockmode" leads to the 
following error message:
/FATAL: Error inserting p4_clockmod 
(/lib/modules/2.6.24/kernel/arch/x86/kernel/cpu/cpufreq/p4-clockmod.ko): 
No such device/

In dmesg I got the following message:
/p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to 
<cpufreq@lists.linux.org.uk>
/
Here is more information about my CPU (It's an ACER 5220 Notebook). I 
hope this will help:
     *-cpu
          description: CPU
          product: Intel(R) Celeron(R) CPU          530  @ 1.73GHz
          vendor: Intel Corp.
          physical id: 4
          bus info: cpu@0
          version: 6.6.1
          slot: U2E1
          size: 1730MHz
          capacity: 1730MHz
          width: 64 bits
          clock: 133MHz
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce 
cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse 
sse2 ss tm pbe nx x86-64 constant_tsc up arch_perfmon pebs bts pni 
monitor ds_cpl tm2 ssse3 cx16 xtpr lahf_lm
        *-cache:0
             description: L1 cache
             physical id: 5
             slot: L1 Cache
             size: 64KB
             capacity: 64KB
             capabilities: asynchronous internal write-back
        *-cache:1
             description: L2 cache
             physical id: 6
             slot: L2 Cache
             size: 1MB
             capacity: 4MB
             capabilities: burst internal write-back


Best regards,
Markus
