From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48721] New: acpi_cpufreq can't change CPU clock anymore
Date: Sat, 13 Oct 2012 01:56:34 +0000 (UTC)
Message-ID: <bug-48721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D48721

           Summary: acpi_cpufreq can't change CPU clock anymore
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.6.1
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: mavoga@gmail.com
        Regression: Yes


Created an attachment (id=3D83121)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=3D83121)
3.5.5 kernel: output of 'grep -r . /sys/devices/system/cpu/ 2>/dev/null=
'

On my laptop (a Clevo W150HRM with an i7 2720QM CPU) I'm currently runn=
ing
Debian wheezy/sid with latest aptosid (3.6-1.slh.3) amd64 kernel: after
switching from 3.5.5 to 3.6 kernel I noticed the idle temperatures sudd=
enly
increased by ~10=C2=B0C with no apparent activity on the system.

The temperature increase, together with sysfs scaling_cur_freq and
cpuinfo_cur_freq values seem to support my suspect of a cpufreq bug: th=
e
ondemand governor doesn't seem able to modulate the CPU clock anymore. =
While
the scaling_cur_freq value varies depending on system load just as expe=
cted,
the cpuinfo_cur_freq value remains stuck at (or over because of turbo b=
oost)
the maximum CPU frequency, just like the performance governor was set.

I could get the same frequency readings with cpufreq-info, turbostat an=
d i7z:
the CPU frequency never decreases under 2.2GHz.

=46urthermore, no cpufreq-set setting seems able to lower the idle freq=
uency in
any way, even by changing governor, and a test 3.6.1 vanilla kernel I c=
ompiled
for testing purposes showed the same behavior.

As soon as I reboot to a 3.5.5 kernel cpuinfo_cur_freq begin to follow
scaling_cur_freq just as expected, and the idle temps decrease back by =
over
10=C2=B0C.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.