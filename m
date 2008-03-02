From: Henne <henne@nachtwindheim.de>
Subject: speedstep-centrino on Toshiba Portege M100 V1.50 doesn't work
Date: Sun, 02 Mar 2008 20:05:03 +0100
Message-ID: <47CAFA5F.6060803@nachtwindheim.de>
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

Hi,

I've upgraded the BIOS of my Toshiba Portege M100 from V1.10 to V1.50.
Now "modprobe speedstep-centrino" and "modprobe acpi-cpufreq" leads to the same result.

FATAL: Error inserting acpi_cpufreq
(/lib/modules/2.6.22-3-686/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko):
 No such device

dmesg says:
speedstep-centrino: couldn't enable Enhanced SpeedStep

I've tracked it down that bit 16 of MSR_IA32_MISC_ENABLE can't be set.

Under WindowsXP does it work. Somehow!

Do you know something I could try to enable it or how I may
find out how it now, after the update, works?

Greets,
Henne

P.S.: cat /proc/cpufreq

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Pentium(R) M processor 1200MHz
stepping        : 5
cpu MHz         : 598.513
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm pbe up est tm2
bogomips        : 1198.22
clflush size    : 64
