From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 1 Nov 2010 13:42:51 GMT
Message-ID: <201011011342.oA1DgpO5012391@demeter2.kernel.org>
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





--- Comment #36 from vyncere <vyncere@gmail.com>  2010-11-01 13:42:47 -=
--
Hi everyone, Hi Thomas,

Here some result on my Thinkpad T410, Intel Core i5 520 M.


* 2.6.32.15 (Kernel Reference with functionnal cpufreq)
- Boot params : None

# cat /sys/devices/system/clocksource/clocksource0/available_clocksourc=
e
tsc hpet acpi_pm
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
tsc

# While CPU is idling : cpufreq-aperf
CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    1824000            00 sec 067 ms    00 sec 932 ms    06
001    1392000            00 sec 007 ms    00 sec 992 ms    00
002    1272000            00 sec 010 ms    00 sec 989 ms    01
003    1488000            00 sec 005 ms    00 sec 994 ms    00

000    1656000            00 sec 052 ms    00 sec 947 ms    05
001    2232000            00 sec 016 ms    00 sec 983 ms    01
002    1272000            00 sec 009 ms    00 sec 990 ms    00
003    1464000            00 sec 005 ms    00 sec 994 ms    00

000    1248000            00 sec 026 ms    00 sec 973 ms    02
001    1992000            00 sec 043 ms    00 sec 956 ms    04
002    1272000            00 sec 011 ms    00 sec 988 ms    01
003    1488000            00 sec 006 ms    00 sec 993 ms    00

# While kernel is compiling (make -j 3) : cpufreq-aperf

CPU     Average freq(KHz)       Time in C0      Time in Cx      C0 perc=
entage
000    2664000            00 sec 997 ms    00 sec 002 ms    99
001    2664000            00 sec 512 ms    00 sec 487 ms    51
002    2664000            00 sec 812 ms    00 sec 187 ms    81
003    2664000            00 sec 876 ms    00 sec 123 ms    87

000    2664000            00 sec 771 ms    00 sec 228 ms    77
001    2664000            00 sec 857 ms    00 sec 142 ms    85
002    2664000            00 sec 814 ms    00 sec 185 ms    81
003    2664000            00 sec 731 ms    00 sec 268 ms    73

000    2664000            00 sec 446 ms    00 sec 553 ms    44
001    2664000            00 sec 885 ms    00 sec 114 ms    88
002    2664000            00 sec 962 ms    00 sec 037 ms    96
003    2664000            00 sec 990 ms    00 sec 009 ms    99=20

# cpufreq-info
current policy: frequency should be within 1.20 GHz and 2.40 GHz.









* 2.6.36 (+ 2 Patches HW_COORD, SHARED_TYPE)
- Boot params : None

# cat /sys/devices/system/clocksource/clocksource0/available_clocksourc=
e
tsc hpet acpi_pm=20
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
tsc

# While CPU is idling : cpufreq-aperf

CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    1200000            00 sec 066 ms    00 sec 933 ms    06
001    1224000            00 sec 038 ms    00 sec 961 ms    03
002    1368000            00 sec 002 ms    00 sec 997 ms    00
003    1320000            00 sec 002 ms    00 sec 997 ms    00

000    1200000            00 sec 055 ms    00 sec 944 ms    05
001    1224000            00 sec 033 ms    00 sec 966 ms    03
002    1344000            00 sec 002 ms    00 sec 997 ms    00
003    1272000            00 sec 001 ms    00 sec 998 ms    00

000    1224000            00 sec 057 ms    00 sec 942 ms    05
001    1224000            00 sec 033 ms    00 sec 966 ms    03
002    1392000            00 sec 002 ms    00 sec 997 ms    00
003    1344000            00 sec 001 ms    00 sec 998 ms    00

# While kernel is compiling (make -j 3) : cpufreq-aperf

CPU     Average freq(KHz)       Time in C0      Time in Cx      C0 perc=
entage
000    1176000            00 sec 585 ms    00 sec 414 ms    58
001    1176000            00 sec 719 ms    00 sec 280 ms    71
002    1200000            00 sec 825 ms    00 sec 174 ms    82
003    1176000            00 sec 951 ms    00 sec 048 ms    95

000    1200000            00 sec 874 ms    00 sec 125 ms    87
001    1176000            00 sec 864 ms    00 sec 135 ms    86
002    1200000            00 sec 776 ms    00 sec 223 ms    77
003    1200000            00 sec 586 ms    00 sec 413 ms    58

000    1176000            00 sec 903 ms    00 sec 096 ms    90
001    1200000            00 sec 841 ms    00 sec 158 ms    84
002    1200000            00 sec 682 ms    00 sec 317 ms    68
003    1176000            00 sec 702 ms    00 sec 297 ms    70

# cpufreq-info
current policy: frequency should be within 1.20 GHz and 1.20 GHz.










* 2.6.36 (+ 3 Patches HW_COORD, SHARED_TYPE, HW_ALL)
- Boot params : None

# cat /sys/devices/system/clocksource/clocksource0/available_clocksourc=
e
tsc hpet acpi_pm
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
tsc

# While CPU is idling : cpufreq-aperf

CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    1224000            00 sec 053 ms    00 sec 946 ms    05
001    1248000            00 sec 022 ms    00 sec 977 ms    02
002    1320000            00 sec 002 ms    00 sec 997 ms    00
003    1344000            00 sec 002 ms    00 sec 997 ms    00

000    1224000            00 sec 061 ms    00 sec 938 ms    06
001    1272000            00 sec 018 ms    00 sec 981 ms    01
002    1344000            00 sec 002 ms    00 sec 997 ms    00
003    1344000            00 sec 003 ms    00 sec 996 ms    00

000    1224000            00 sec 060 ms    00 sec 939 ms    06
001    1248000            00 sec 015 ms    00 sec 984 ms    01
002    1416000            00 sec 002 ms    00 sec 997 ms    00
003    1368000            00 sec 002 ms    00 sec 997 ms    00

# While kernel is compiling (make -j 3) : cpufreq-aperf

CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    1200000            00 sec 101 ms    00 sec 898 ms    10
001    1200000            00 sec 079 ms    00 sec 920 ms    07
002    1200000            00 sec 201 ms    00 sec 798 ms    20
003    1200000            00 sec 828 ms    00 sec 171 ms    82

000    1200000            00 sec 112 ms    00 sec 887 ms    11
001    1200000            00 sec 515 ms    00 sec 484 ms    51
002    1200000            00 sec 006 ms    00 sec 993 ms    00
003    1200000            00 sec 528 ms    00 sec 471 ms    52

000    1200000            00 sec 567 ms    00 sec 432 ms    56
001    1200000            00 sec 275 ms    00 sec 724 ms    27
002    1176000            00 sec 253 ms    00 sec 746 ms    25
003    1176000            00 sec 120 ms    00 sec 879 ms    12

# cpufreq-info
current policy: frequency should be within 1.20 GHz and 1.20 GHz.










* 2.6.36 (+ 4 Patches HW_COORD, SHARED_TYPE, HW_ALL, HW_STATISTICS)
- Boot params for patch 4 : acpi_cpufreq.disable_average=3D1

# dmesg | grep cpufreq
acpi-cpufreq: average (aperf/mperf) accounting disabled by user

# cat /sys/devices/system/clocksource/clocksource0/available_clocksourc=
e
tsc hpet acpi_pm
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
tsc

# While CPU is idling : cpufreq-aperf

CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    1200000            00 sec 084 ms    00 sec 915 ms    08
001    1248000            00 sec 016 ms    00 sec 983 ms    01
002    1368000            00 sec 011 ms    00 sec 988 ms    01
003    1344000            00 sec 003 ms    00 sec 996 ms    00

000    1224000            00 sec 056 ms    00 sec 943 ms    05
001    1224000            00 sec 059 ms    00 sec 940 ms    05
002    1320000            00 sec 010 ms    00 sec 989 ms    01
003    1296000            00 sec 004 ms    00 sec 995 ms    00

000    1224000            00 sec 054 ms    00 sec 945 ms    05
001    1224000            00 sec 033 ms    00 sec 966 ms    03
002    1368000            00 sec 010 ms    00 sec 989 ms    01
003    1368000            00 sec 003 ms    00 sec 996 ms    00

# While kernel is compiling (make -j 3) : cpufreq-aperf

CPU     Average freq(KHz)       Time in C0      Time in Cx      C0 perc=
entage
000    1176000            00 sec 815 ms    00 sec 184 ms    81
001    1200000            00 sec 532 ms    00 sec 467 ms    53
002    1176000            00 sec 997 ms    00 sec 002 ms    99
003    1200000            00 sec 997 ms    00 sec 002 ms    99

000    1200000            00 sec 501 ms    00 sec 498 ms    50
001    1200000            00 sec 731 ms    00 sec 268 ms    73
002    1176000            00 sec 997 ms    00 sec 002 ms    99
003    1200000            00 sec 997 ms    00 sec 002 ms    99

000    1176000            00 sec 714 ms    00 sec 285 ms    71
001    1176000            00 sec 889 ms    00 sec 110 ms    88
002    1176000            00 sec 934 ms    00 sec 065 ms    93
003    1176000            00 sec 778 ms    00 sec 221 ms    77=20

# cpufreq-info
current policy: frequency should be within 1.20 GHz and 1.20 GHz.=20










It's very interesting. With the old good 2.6.32 kernel (with working cp=
ufreq),
while CPU is idling, according to cpufreq-aperf, the clock speeds fluct=
uate
between 1.20GHz to 1.80GHz, sometimes up to 2.40GHz. Hummmm... it's not=
 very
good for power saving... It may explains why my CPU is always near 50=C2=
=B0C. It's
slightly better with 2.6.36 kernel. (Thanks to Intel Idle maybe ?! I do=
n't
know.)=20

I don't know if it's really the true clock speeds since my conky monito=
r always
shows me the 4 virtual cores at 1.2 GHz... But I think that cpufreq-ape=
rf is
more accurate than everything else. cpufreq-info always report a 1.20GH=
z max
limit.

In my case, the problem is not solved. With the 3 different kernel
configurations (2.6.36 + patches), with high CPU loads, clock speeds st=
ill
remain at the lowest state. Ironically, cpufreq-aperf shows that freque=
ncies
never exceed 1.2OGHz at full load, contrary to idle time ! It's an upsi=
de-down
world...

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are on the CC list for the bug.