From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62861] New: Maximum CPU voltage level never reached on AMD
 A8-5500
Date: Sat, 12 Oct 2013 03:21:26 +0000
Message-ID: <bug-62861-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D62861

            Bug ID: 62861
           Summary: Maximum CPU voltage level never reached on AMD A8-5=
500
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.12.0-rc4+
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: laszlo.kertesz@gmail.com
        Regression: No

I noticed this issue in the kernel 3.12 rc4 (built from git):

The CPU should have its voltages in the 0.9-1.34v range (it was until r=
c3 at
least).
In the rc4 builds it only goes up to 1.22v, but the lower range is modi=
fied too
- it no longer stays at 0.9, it bounces between as low as 0.64 and 0.9,=
 usually
stays in the 0.85-0.88 range.

The result is: lower temperatures (~5C) and lower processor speeds+perf=
ormance.

This CPU has its nominal frequency at 3.2 GHz and a turbo frequency of =
3.7 GHz
(theoretic, under Linux at least i seen max 3.6, mostly its ~3.5). Anyw=
ay, in
typical usage if 1 or 2 cores are used, it can be at ~3.5GHz quite long=
 before
throttling down. Using all 4 cores (compiling with 4 threads) usually g=
oes at
~3.3 mostly with an initial 3.5 for a half minute or so with CPU voltag=
e at
1.34v.
Now with this capping at 1.22v this what i get (no turbo core or anythi=
ng):

'sensors' output under full load, 4 threads compile (in0 is the CPU vol=
tage):

it8728-isa-0228
Adapter: ISA adapter
in0:          +1.22 V  (min =3D  +0.00 V, max =3D  +3.06 V)
in1:          +1.64 V  (min =3D  +0.00 V, max =3D  +3.06 V)
in2:          +2.00 V  (min =3D  +0.00 V, max =3D  +3.06 V)
in3:          +2.05 V  (min =3D  +0.00 V, max =3D  +3.06 V)
in4:          +1.99 V  (min =3D  +0.00 V, max =3D  +3.06 V)
in5:          +2.22 V  (min =3D  +0.00 V, max =3D  +3.06 V)
in6:          +2.22 V  (min =3D  +0.00 V, max =3D  +3.06 V)
3VSB:         +3.36 V  (min =3D  +0.00 V, max =3D  +6.12 V)
Vbat:         +3.31 V
fan1:        2576 RPM  (min =3D    0 RPM)
fan2:         906 RPM  (min =3D    0 RPM)
fan3:           0 RPM  (min =3D    0 RPM)
fan4:           0 RPM  (min =3D    0 RPM)
fan5:           0 RPM  (min =3D    0 RPM)
temp1:        +29.0=C2=B0C  (low  =3D +127.0=C2=B0C, high =3D +127.0=C2=
=B0C)  sensor =3D thermistor
temp2:         -8.0=C2=B0C  (low  =3D +127.0=C2=B0C, high =3D +127.0=C2=
=B0C)  sensor =3D thermistor
temp3:        +49.0=C2=B0C  (low  =3D +127.0=C2=B0C, high =3D +127.0=C2=
=B0C)  sensor =3D Intel PECI
intrusion0:  OK

'cpufreq-aperf' output under full load, 4 threads compile:

# cpufreq-aperf -o
CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    3168000            00 sec 933 ms    00 sec 066 ms    93
001    3168000            00 sec 970 ms    00 sec 029 ms    97
002    3168000            00 sec 894 ms    00 sec 105 ms    89
003    3168000            00 sec 962 ms    00 sec 037 ms    96

This 3168000 KHz happens even i have only 1 core loaded, which before h=
ad
~3.488 GHz according to cpufreq-aperf.

/sys/devices/system/cpu/cpu1/cpufreq/cpb has the value of 1 so i guess =
turbo
core is still enabled but because of this voltage capping it never happ=
ens.

Temperature isnt an issue, since this way the CPU goes up to 50C, befor=
e was
max ~55C with better performance.

Note that i use the radeon driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.