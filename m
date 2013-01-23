From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 52941] New: CPU recognition bug for AMD
Date: Wed, 23 Jan 2013 12:59:02 +0000 (UTC)
Message-ID: <bug-52941-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D52941

           Summary: CPU recognition bug for AMD
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.7.4-1-ARCH
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: sognametal@gmail.com
        Regression: No


Hi.

Since the 3.7.3 kernel, the cpu recognition bug [AMD Phenom II X4 965 B=
lack
Edition @ 3.4 GHz].

-> /etc/conf.d/cpupower :
governor=3D'ondemand'
min_freq=3D"0.80GHz"
max_freq=3D"3.39GHz"

-> cpupower frequency-info
analyse du CPU 0 :
  pas de pilotes cpufreq reconnu pour ce CPU
  boost state support:
    Supported: no
    Active: no

My cpu is no longer recognized and freq stay stuck at max.

But, after a few minutes (more than 20) or a few hours my cpu is again
recognized...
-> cpupower frequency-info
analyse du CPU 0 :
  pilote : acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 4.0 us.
  limitation mat=C3=A9rielle : 800 MHz - 3.40 GHz
  plage de fr=C3=A9quence : 3.40 GHz, 2.70 GHz, 2.20 GHz, 800 MHz
  r=C3=A9gulateurs disponibles : ondemand, performance
  tactique actuelle : la fr=C3=A9quence doit =C3=AAtre comprise entre 8=
00 MHz et 3.40
GHz.
                  Le r=C3=A9gulateur "ondemand" est libre de choisir la=
 vitesse
                  dans cette plage de fr=C3=A9quences.
  la fr=C3=A9quence actuelle de ce CPU est 3.40 GHz.
  boost state support:
    Supported: no
    Active: no

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.