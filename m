From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42858] New: thermal throttling doesn't seem to trigger on
 Thinkpad T420s
Date: Sun, 4 Mar 2012 10:52:57 GMT
Message-ID: <bug-42858-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D42858

           Summary: thermal throttling doesn't seem to trigger on Think=
pad
                    T420s
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
        ReportedBy: pierre-bugzilla@ossman.eu
        Regression: No


I have a new Thinkpad T420s and I'm noticing it getting massively hot w=
hen
putting some load on the CPU. powertop shows it spending all its time i=
n Turbo
mode for both cores. Thermal reporting shows it hovering around 90=C2=B0=
 with the
fan on full. It hasn't been throttled even once though:

=2E/cpu0/thermal_throttle/core_power_limit_count:0
=2E/cpu0/thermal_throttle/core_throttle_count:0
=2E/cpu0/thermal_throttle/package_power_limit_count:0
=2E/cpu0/thermal_throttle/package_throttle_count:0
=2E/cpu1/thermal_throttle/core_power_limit_count:0
=2E/cpu1/thermal_throttle/core_throttle_count:0
=2E/cpu1/thermal_throttle/package_power_limit_count:0
=2E/cpu1/thermal_throttle/package_throttle_count:0
=2E/cpu2/thermal_throttle/core_power_limit_count:0
=2E/cpu2/thermal_throttle/core_throttle_count:0
=2E/cpu2/thermal_throttle/package_power_limit_count:0
=2E/cpu2/thermal_throttle/package_throttle_count:0
=2E/cpu3/thermal_throttle/core_power_limit_count:0
=2E/cpu3/thermal_throttle/core_throttle_count:0
=2E/cpu3/thermal_throttle/package_power_limit_count:0
=2E/cpu3/thermal_throttle/package_throttle_count:0

This doesn't really seem safe for the CPU or my lap. :/

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.