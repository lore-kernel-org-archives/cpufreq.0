From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 51741]
 New:=?UTF-8?Q?=20powernow=2Dk8=20calls=20for=20acpi=2Dcpufreq=20but=20doesn=E2=80=99t=20warn=20if=20it=E2=80=99s=20not=20available?=
Date: Sun, 16 Dec 2012 16:03:47 +0000 (UTC)
Message-ID: <bug-51741-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D51741

           Summary: powernow-k8 calls for acpi-cpufreq but doesn=E2=80=99=
t warn if
                    it=E2=80=99s not available
           Product: Power Management
           Version: 2.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: linuxuser330250@gmx.net
        Regression: No


On my system, I used to have powernow-k8 compiled into the kernel, but =
not
acpi-cpufreq. I run Gentoo Linux.

With sys-kernel/gentoo-sources-3.6.8, I got the following relevent dmes=
g
output:
powernow-k8: Found 1 AMD Phenom(tm) II X6 1090T Processor (6 cpu cores)
(version 2.20.00)
powernow-k8: Core Performance Boosting: on.
powernow-k8:    0 : pstate 0 (3200 MHz)
powernow-k8:    1 : pstate 1 (2400 MHz)
powernow-k8:    2 : pstate 2 (1600 MHz)
powernow-k8:    3 : pstate 3 (800 MHz)

Now, with sys-kernel/gentoo-sources-3.7.0, dmesg showed the following:
powernow-k8: this CPU is not supported anymore, using acpi-cpufreq inst=
ead.

This lead me into thinking that acpi-cpufreq was used when it actually =
wasn=E2=80=99t,
because it was missing in my kernel (since I don=E2=80=99t know all con=
fig options by
heart: I had to check for that).

I found that the fans were a bit noisier than normal, so I looked in
/proc/cpuinfo, which showed all 6 cores were at 3.2 GHz.

I then recompiled the kernel with acpi-cpufreq compiled in and removed
powernow-k8. Now /proc/cpuinfo shows 800 MHz on all or most of the core=
s when
the system is mostly idle.

Apparently, acpi-cpufreq doesn=E2=80=99t show any output at all, except=
:
acpi-cpufreq: overriding BIOS provided _PSD data

My suggestion would be to make powernow-k8 check for the availability o=
f
acpi-cpufreq and print out a warning should it not be available.
And I also suggest a short =E2=80=9Cacpi-cpufreq is used for frequency =
scaling=E2=80=9D so one
can see that it was loaded alright.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.