From: "Andy Spencer" <andy753421@gmail.com>
Subject: Cannot set max cpu frequency
Date: Mon, 23 Jul 2007 16:43:20 +0000
Message-ID: <490dd6310707230943n753b8955q3f20fd24ce6f5314@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
	b=sebV2COBOJaoZuKjv0xpfiOMydwl8rsL6bofsmytJP8bgWR22qBNdBlRsynhvxSvlHABS9PZf6HMjPl6EjNrwI1AIq9wMoYgq+vQMWjG43v7S/uwGV/O4lwZTroOt4SI8gGXpoHX28Pfi1F+HAPkjwBiUZTigim+NEdt4GZVCO8=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

For the last few days I have been unable set the maximum frequency for my
processor (Intel Pentium M). A few days ago it worked correctly so I am
assuming it is a hardware problem, but I have not been able to confirm that
whatsoever. Does anyone have any suggestions for debugging this?

Here's what actually happens. I boot up my laptop and the ondemand governor
is set to range between 800MHz and 2.00GHz. At first this works correctly,
but after a few minutes the range will be reset to 800MHz-800Mhz and I am
unable to change it without rebooting. I've tried changing it using '$
cpufreq-set -u 2.00GHz' as well as 'echo -n 2000000 >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq' (I'm not even sure if
the 2nd one 'should' work). Changing to the 'userspace' governor has no
effect.

Here's a bunch of logs in case anyone can find anything useful. (I haven't
been able to, but I'm no expert)

=== $ dmesg | grep -i acpi ===
ACPI: AC Adapter [AC] (on-line)
ACPI: Battery Slot [BAT0] (battery present)
ACPI: Battery Slot [BAT1] (battery absent)
ACPI: Lid Switch [LID]
ACPI: Power Button (CM) [PBTN]
ACPI: Sleep Button (CM) [SBTN]
ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3] C4[C3])
ACPI: Processor [CPU0] (supports 8 throttling states)
ACPI: Thermal Zone [THM] (49 C)
ACPI: PCI Interrupt 0000:00:1e.3[B] -> GSI 17 (level, low) -> IRQ 18
ACPI: PCI interrupt for device 0000:00:1e.3 disabled
ACPI: PCI Interrupt 0000:02:00.0[A] -> GSI 16 (level, low) -> IRQ 16
Time: acpi_pm clocksource has been installed.
ACPI: PCI Interrupt 0000:00:1f.2[B] -> GSI 17 (level, low) -> IRQ 18
ACPI: PCI Interrupt 0000:00:1d.7[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:00:1d.1[B] -> GSI 17 (level, low) -> IRQ 18
ACPI: PCI Interrupt 0000:00:1d.2[C] -> GSI 18 (level, low) -> IRQ 19
ACPI: PCI Interrupt 0000:00:1d.3[D] -> GSI 19 (level, low) -> IRQ 17
ACPI: PCI Interrupt 0000:00:1e.2[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:03:03.0[A] -> GSI 17 (level, low) -> IRQ 18


=== $ cpufreq-info ===
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 1.60 GHz, 1.33 GHz, 1.07 GHz, 800 MHz
  available cpufreq governors: conservative, ondemand, powersave, userspace,
performance
  current policy: frequency should be within 800 MHz and 800 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz.


=== $ x86info --mhz === (note, the estimate ranges from 100MHz-350Mhz)
x86info v1.20.  Dave Jones 2001-2006
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
Family: 6 Model: 13 Stepping: 8 Type: 0 Brand: 6
CPU Model: Pentium M (Dothan) [C-0] Original OEM
Feature flags:
 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflsh ds
acpi mmx fxsr sse sse2 ss tm pbe est tm2
Extended feature flags:
 xd
Cache info
 L1 Instruction cache: 32KB, 8-way associative. 64 byte line size.
 L1 Data cache: 32KB, 8-way associative. 64 byte line size.
 L2 unified cache: 2MB, sectored, 8-way associative. 64 byte line size.
TLB info
 Instruction TLB: 4K pages, 4-way associative, 128 entries.
 Instruction TLB: 4MB pages, fully associative, 2 entries
 Data TLB: 4K pages, 4-way associative, 128 entries.
 Data TLB: 4MB pages, 4-way associative, 8 entries
 64 byte prefetching.
150MHz processor (estimate).


=== $ cat /proc/cpuinfo ===
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 2.00GHz
stepping        : 8
cpu MHz         : 800.000
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
bogomips        : 826.66
clflush size    : 64
