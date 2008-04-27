From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10564] New: Randomly sets max freq equal to min freq
Date: Sun, 27 Apr 2008 09:11:16 -0700 (PDT)
Message-ID: <bug-10564-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10564

           Summary: Randomly sets max freq equal to min freq
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24/25
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: stonecrest@gmail.com


Dell Latitude C400
i686 Mobile Intel(R) Pentium(R) III CPU - M 1200MHz GenuineIntel GNU/Linux


Usually within 5 minutes of booting up, after the computer has been off while
I'm at work or sleeping, cpufreq will suddenly revert to the lowest freq and
remain stuck in it. Before this happens, scaling works fine. I'm using the
ondemand governor. I can reboot (the only way to fix it) and then it will
typically work fine - up until I shut down for another longish period of time
and boot up again.


Here's cpufreq debug output where it changes:
cpufreq-core: updating policy for CPU 0
cpufreq-core: setting new policy for CPU 0: 800000 - 1200000 kHz
acpi-cpufreq: acpi_cpufreq_verify
acpi-cpufreq: acpi_cpufreq_verify
cpufreq-core: new min and max freqs are 800000 - 800000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 800000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 800000 (0)
cpufreq-core: notification 0 of frequency transition to 800000 kHz
cpufreq-core: notification 1 of frequency transition to 800000 kHz


$ grep "" /sys/devices/system/cpu/cpu0/cpufreq/*
/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus:0
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:1200000
800000 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:userspace
ondemand performance 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:acpi-cpufreq
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:ondemand
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:800000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:<unsupported>


Let me know if I should provide anything else, since it's easily reproducible.
It's been occurring for the last 2-3 months and is pretty much unusable in this
state, so I've been rebooting often.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
