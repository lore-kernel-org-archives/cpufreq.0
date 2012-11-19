From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] New: CPU freqs stay stuck at max after reboot with
 on-demand governor set
Date: Mon, 19 Nov 2012 05:45:08 +0000 (UTC)
Message-ID: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721

           Summary: CPU freqs stay stuck at max after reboot with
                    on-demand governor set
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.7-rc6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: rockorequin@hotmail.com
        Regression: Yes


Created an attachment (id=86591)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=86591)
/proc/cpuinfo

With 3.7-rc5 and -rc6 sometimes (often?) after a reboot my PC's cores (on an
i7-2630QM) all remaing running at 2GHz, even after their governors are changed
to ondemand (this is done by the /etc/init.d/ondemand script approximately one
minute after it runs at boot). I'm not running anything especially taxing at
this stage, just a Ubuntu unity desktop that is idling away.

Note that when this happens, /proc/cpuinfo incorrectly indicates that the cores
are running are 800MHz (does the ondemand governor use this to determine if it
needs to change speed?) but that this disagrees with the readings from
powertop, cpufreq-info and (eg)
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq.

In /sys/devices/system/cpu/cpu0/cpufreq/, scaling_governor indicates ondemand
is being used, and cpuinfo_min_freq is 800000. powertop indicates power usage
of 35W (compared to a more normal 22W), and acpi -t shows 75C instead of the
more normal 45-55C.

Changing the governor to performance and back again doesn't help, but a
suspend/resume cycle seems to fix it.

I'll attach the output from cat /proc/cpuinfo and cpufreq-info when the problem
is being exhibited.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
