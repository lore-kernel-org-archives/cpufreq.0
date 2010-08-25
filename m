From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] New: ondemand governor non-functional / ACPI P-states
 driver
Date: Wed, 25 Aug 2010 11:52:10 GMT
Message-ID: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001

           Summary: ondemand governor non-functional / ACPI P-states
                    driver
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.35.3
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: peter.ganzhorn@googlemail.com
        Regression: No


Hardware:
Toshiba Tecra A9 notebook
Intel Core2 Duo T7300 2.0 GHz processor

Software:
Debian testing "Squeeze"
Kernel 2.6.35.3

Bug description:
With the cpufreq-ondemand governor enabled, the CPU frequency does not increase
at all with any workload.
Even with both cores running at 100% load the CPU frequency will never increase
above the minimum frequency of 800MHz.
Using the performance governor makes the CPU switch to 2GHz immediately.

Running on battery or AC power does not have any effect on this issue.

I am using the exact same software configuration (same distro, kernel .config
is identical except for different NIC drivers) on a workstation computer with
an Intel Core2 Quad Q9550, the workstation is not affected by the issue (CPU
frequency is changed when load situation changes almost instantaneously to a
frequency fitting the current load situation).

Here's some sysfs info about the cpufreq configuration (looks fine to me):

centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./cpuinfo_max_freq 
2001000
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./cpuinfo_min_freq 
800000
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./scaling_max_freq 
2001000
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./scaling_min_freq
800000
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./scaling_setspeed 
<unsupported>
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./scaling_governor 
performance
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat ./scaling_driver 
acpi-cpufreq
centauri:/sys/devices/system/cpu/cpu0/cpufreq# cat
./scaling_available_frequencies 
2001000 2000000 1600000 1200000 800000

Please tell me what other information I need to submit to you.

As far as I can tell, the problem exists at least since kernel version 2.6.30,
I did not test any earlier versions.
Debian distribution stock kernel is affected from the issue as well.

Thanks for looking into this issue.

best regards,
Peter Ganzhorn

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
