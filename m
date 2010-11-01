From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 1 Nov 2010 18:03:09 GMT
Message-ID: <201011011803.oA1I39bK026650@demeter2.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D19702





--- Comment #38 from vyncere <vyncere@gmail.com>  2010-11-01 18:03:04 -=
--
Some results with :

- acpi_cpufreq.disable_average=3D1 clocksource=3Dhpet

and

- acpi_cpufreq.disable_average=3D1 clocksource=3Dhpet acpi_skip_timer_o=
verride







* 2.6.36 (+ 4 Patches HW_COORD, SHARED_TYPE, HW_ALL, HW_STATISTICS)
- Boot params for patch 4 : acpi_cpufreq.disable_average=3D1
- Boot params : clocksource=3Dhpet

# dmesg | grep cpufreq
acpi-cpufreq: average (aperf/mperf) accounting disabled by user

# cat /sys/devices/system/clocksource/clocksource0/available_clocksourc=
e
tsc hpet acpi_pm
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
hpet

# While CPU is idling : cpufreq-aperf

CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    2688000            00 sec 033 ms    00 sec 966 ms    03
001    1944000            00 sec 017 ms    00 sec 982 ms    01
002    1776000            00 sec 001 ms    00 sec 998 ms    00
003    1536000            00 sec 002 ms    00 sec 997 ms    00

000    2496000            00 sec 028 ms    00 sec 971 ms    02
001    1656000            00 sec 032 ms    00 sec 967 ms    03
002    1536000            00 sec 018 ms    00 sec 981 ms    01
003    1416000            00 sec 003 ms    00 sec 996 ms    00

000    2712000            00 sec 036 ms    00 sec 963 ms    03
001    2064000            00 sec 014 ms    00 sec 985 ms    01
002    1416000            00 sec 001 ms    00 sec 998 ms    00
003    1392000            00 sec 001 ms    00 sec 998 ms    00

000    2688000            00 sec 034 ms    00 sec 965 ms    03
001    1920000            00 sec 017 ms    00 sec 982 ms    01
002    1584000            00 sec 001 ms    00 sec 998 ms    00
003    1536000            00 sec 002 ms    00 sec 997 ms    00

000    2712000            00 sec 041 ms    00 sec 958 ms    04
001    1968000            00 sec 023 ms    00 sec 976 ms    02
002    1512000            00 sec 008 ms    00 sec 991 ms    00
003    1560000            00 sec 004 ms    00 sec 995 ms    00

000    2784000            00 sec 040 ms    00 sec 959 ms    04
001    1896000            00 sec 022 ms    00 sec 977 ms    02
002    1416000            00 sec 008 ms    00 sec 991 ms    00
003    1488000            00 sec 003 ms    00 sec 996 ms    00

000    2736000            00 sec 042 ms    00 sec 957 ms    04
001    2160000            00 sec 018 ms    00 sec 981 ms    01
002    1512000            00 sec 007 ms    00 sec 992 ms    00
003    1608000            00 sec 003 ms    00 sec 996 ms    00

# While kernel is compiling (make -j 3) : cpufreq-aperf
CPU     Average freq(KHz)       Time in C0      Time in Cx      C0 perc=
entage
000     2640000                 00 sec 767 ms   00 sec 232 ms   76
001     2304000                 00 sec 960 ms   00 sec 039 ms   96
002     2112000                 00 sec 641 ms   00 sec 358 ms   64
003     2256000                 00 sec 886 ms   00 sec 113 ms   88

000     2640000                 00 sec 709 ms   00 sec 290 ms   70
001     2208000                 00 sec 969 ms   00 sec 030 ms   96
002     2016000                 00 sec 677 ms   00 sec 322 ms   67
003     2160000                 00 sec 881 ms   00 sec 118 ms   88

000     2640000                 00 sec 844 ms   00 sec 155 ms   84
001     2400000                 00 sec 937 ms   00 sec 062 ms   93
002     2328000                 00 sec 695 ms   00 sec 304 ms   69
003     2376000                 00 sec 866 ms   00 sec 133 ms   86

000     2640000                 00 sec 882 ms   00 sec 117 ms   88
001     2424000                 00 sec 756 ms   00 sec 243 ms   75
002     2400000                 00 sec 674 ms   00 sec 325 ms   67
003     2472000                 00 sec 991 ms   00 sec 008 ms   99

# cpufreq-info

current policy: frequency should be within 1.20 GHz and 1.20 GHz.


















* 2.6.36 (+ 4 Patches HW_COORD, SHARED_TYPE, HW_ALL, HW_STATISTICS)
- Boot params for patch 4 : acpi_cpufreq.disable_average=3D1
- Boot params : clocksource=3Dhpet acpi_skip_timer_override

# dmesg | grep cpufreq
acpi-cpufreq: average (aperf/mperf) accounting disabled by user

# cat /sys/devices/system/clocksource/clocksource0/available_clocksourc=
e
tsc hpet acpi_pm
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
hpet

# dmesg | grep apic

ACPI: Core revision 20100702
Setting APIC routing to flat
=2E.TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1 pin2=3D-1
=2E.MP-BIOS bug: 8254 timer not connected to IO-APIC
=2E..trying to set up timer (IRQ0) through the 8259A ...
=2E.... (found apic 0 pin 0) ...
=2E...... works.

# dmesg | grep intel_idle

intel_idle: MWAIT substates: 0x1120
intel_idle: v0.4 model 0x25
intel_idle: lapic_timer_reliable_states 0xffffffff
ACPI: acpi_idle yielding to intel_idle

# While CPU is idling : cpufreq-aperf=20

CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    2184000            00 sec 030 ms    00 sec 969 ms    03
001    1320000            00 sec 038 ms    00 sec 961 ms    03
002    1392000            00 sec 032 ms    00 sec 967 ms    03
003    1536000            00 sec 002 ms    00 sec 997 ms    00

000    1752000            00 sec 031 ms    00 sec 968 ms    03
001    1680000            00 sec 051 ms    00 sec 948 ms    05
002    1488000            00 sec 015 ms    00 sec 984 ms    01
003    1272000            00 sec 015 ms    00 sec 984 ms    01

000    2640000            00 sec 034 ms    00 sec 965 ms    03
001    1632000            00 sec 027 ms    00 sec 972 ms    02
002    1392000            00 sec 003 ms    00 sec 996 ms    00
003    1464000            00 sec 002 ms    00 sec 997 ms    00

000    2712000            00 sec 038 ms    00 sec 961 ms    03
001    1776000            00 sec 020 ms    00 sec 979 ms    02
002    1464000            00 sec 002 ms    00 sec 997 ms    00
003    1488000            00 sec 003 ms    00 sec 996 ms    00

# cpufreq-info

current policy: frequency should be within 1.20 GHz and 1.20 GHz.





In all cases, cpufreq-info always reports a 1.20GHz max limit, but
cpufreq-aperf the opposite ; During high loads, frequencies manage to j=
ump up
to 2.64GHz. It took the same amount of time to compile the kernel than =
with my
reference kernel (2.6.32) and CPU reached 72=C2=B0C. I can conclude tha=
t CPU states
reported by cpufreq-info are wrong. (My conky desktop monitor applet do=
es not
seem to read info from cpufreq-aperf or equivalent, because it always r=
eports
frequencies at 1.20GHz like cpufreq-info).

With hpet clocksource, average frequencies at idle time are very high, =
higher
than with tsc clocksource (which are in the first hand strangely high f=
or idle
time), specially for the CPU 0, (2,7 GHz for 3% load !!!), but it does =
not seem
to raise the temperature. I expect to have all my virtual cores at 1.20=
GHz (or
less) at idle time, but even with my reference kernel, this ideal state=
 was
never reached.

With acpi_skip_timer_override parameter, the kernel reports at boot tim=
e some
verbosities related to IO-APIC.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are on the CC list for the bug.