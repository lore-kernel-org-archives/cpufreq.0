From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 66751] New: Does not resume from suspend (bisected)
Date: Sat, 07 Dec 2013 12:30:38 +0000
Message-ID: <bug-66751-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D66751

            Bug ID: 66751
           Summary: Does not resume from suspend (bisected)
           Product: Power Management
           Version: 2.5
    Kernel Version: v3.13-rc3
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: ziegler@uni-freiburg.de
        Regression: No

Created attachment 117791
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D117791&action=3De=
dit
config for 3.13-rc3

This is on a Thinkpad T510. If a try to wake up the machine from suspen=
d,
only the start button light changes from "blink" to "on". The screen re=
mains
black and the machine is unresponsive. All I can do is a hard reboot by=
 holding
down the start button.

I bisected between  v3.13-rc2 and v3.13-rc3 and got=20

 commit 2167e2399dc5e69c62db56d933e9c8cbe107620a
 Author: Bj=C3=B8rn Mork <bjorn@mork.no>
 Date:   Tue Dec 3 12:14:32 2013 +0100

    cpufreq: fix garbage kobjects on errors during suspend/resume

as the first bad commit

--=20
You are receiving this mail because:
You are the assignee for the bug.