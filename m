From: Torsten Wolf <t.wolf@tu-bs.de>
Subject: cpufreq - totally confused
Date: Tue, 11 Jan 2005 13:14:23 +0100
Message-ID: <20050111121423.GA7426@rhea>
Reply-To: Torsten Wolf <t.wolf@tu-bs.de>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi!

Due to nasty USB problems on my Thinkpad 2722 (Banias 1.5GHz) I've
always switched to the most recent 'stable' kernel release. Up to now,
2.6.10 (debian source package) seems to solve my USB issues; alas! APM
no longer works. However, ACPI has become useable and nearly everything
seems to work right now; except the frequency scaling. With APM, cpufreq
cpmpiled into the kernel and cpudynd I had two frequencies: 600MHz and
1.5GHz. Yesterday, while configuring the ACPI stuff gkrellm showed
various other frequencies that seemed to correspond to the 8 throttling
stages indicated in /proc/acpi/processor/CPU/throttling. Unfortunately,
this nice behaviour somehow got lost and I am desperately trying to get
it back.

The cpufreq settings in .config are listed below; ACPI stuff has been
compiled as modules. Debians 2.6.10 has been patched with the latest
swsusp2. Looking at /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq
the lowest frequency is always 600MHz, while the value displayed
yesterday in gkrellm's x86info plugin was definitely lower. So please
give me a hint (which modules when to load; cpufreqd or cpudynd;...)
to be able to use the throttling. What further information do you need?

In the meantime I have the switching between 0.6 and 1.5GHz, but I hope
to reduce power consumption with additional lower frequencies.

Thanks in advance!

Best wishes,
Torsten

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_TABLE=m

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y

-----------------------------------------------------------------------

cat /proc/cpuinfo

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Pentium(R) M processor 1500MHz
stepping        : 5
cpu MHz         : 598.160
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 tm pbe est tm2
bogomips        : 1182.92

-----------------------------------------------------------------------

cat /proc/acpi/processor/CPU/throttling

state count:             8
active state:            T0
states:
   *T0:                  00%
    T1:                  12%
    T2:                  25%
    T3:                  37%
    T4:                  50%
    T5:                  62%
    T6:                  75%
    T7:                  87%
