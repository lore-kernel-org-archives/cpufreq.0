From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 53051] New: Conservative governor get's sometimes stuck at
 highest frequency
Date: Fri, 25 Jan 2013 19:12:28 +0000 (UTC)
Message-ID: <bug-53051-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D53051

           Summary: Conservative governor get's sometimes stuck at high=
est
                    frequency
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.6.11
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: cem.aydin@gmx.ch
        Regression: No


Created an attachment (id=3D91801)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=3D91801)
Zipped files as described in description.

About once a week, when booting daily, the CPU (all cores) get's stuck =
at
highest frequency.

Unfortunately, I can't tell exactly when this appeared but it was about=
 during
the time, when I switched to systemd and cpufrequtils got replaced cpup=
ower,
about half a year ago.

The kernel modules are loaded properly and the start scripts are execut=
ed. I
can not find any difference, when this occurs or when it doesn't. Exept=
 that
the frequency is stucked at highest level of course. When this occurs I=
 wasn't
able to set the frequency manually (by the userspace governor). Reloadi=
ng the
conservative module or reexuting the (systemd) start script did not hav=
e any
effect. The only thing I can do to resolve the issue is reboot.

I use an up to date Arch Linux with the regular kernel and systemd.

Additional Infos:
proc/cpuinfo reports the wrong frequency (lowest). I think this is ment=
ioned in
another bug. However cpupower -c all frequency-info (executed as root) =
reports
the correct highest frequency. I can clearly see that this is the true
frequency because the temperatures reported by sensors are almost 10=C2=
=B0C higher
than under normal circumstances. I don't have any process that could ca=
use the
governor to raise the frequencies. CPU usage is below 1% and load is be=
tween
0.0 and 0.05.

Hardware:
A HP Pavilion dv6 CORE i5

Attachments:
- cpupower (/usr/lib/systemd/scripts/cpupower, the start up scripts use=
d by
systemd to set the frequencies)
- cpupower.conf (/etc/conf.d/cpupower)
- cpupower-service.txt (output from systemctl status cpupower.service)
- cpupower.txt (output from cpupower -c all frequency-info)
- journal.txt (output from journalctl -b | grep cpufreq)
- lsmod.txt (output from lsmod |grep cpufreq)
- proc_cpuinfo.txt (output from cat /proc/cpuinfo (wrong frequencies))

Please let me know if you need additional info.

Regards

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.