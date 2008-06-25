From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10982] New: scaling_max_freq locked
Date: Wed, 25 Jun 2008 14:22:52 -0700 (PDT)
Message-ID: <bug-10982-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10982

           Summary: scaling_max_freq locked
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: nicolas.vinot@gmail.com


Distribution: Debian testing
Hardware Environment: IBM Thinkpad T42
Software Environment: 2.6.25 kernel
Problem Description:

Few minutes after boot, scaling_max_freq is locked to the lowest cpu speed.
Impossible to change it, even by hand or cpufreq-set.

root:cpufreq# pwd
/sys/devices/system/cpu/cpu0/cpufreq

root:cpufreq# cat scaling_driver
acpi-cpufreq

root:cpufreq# cat scaling_available_frequencies
1800000 1600000 1400000 1200000 1000000 800000 600000

root:cpufreq# cat scaling_available_governors
powersave userspace ondemand conservative performance

root:cpufreq# cat scaling_governor
ondemand

root:cpufreq# cat scaling_max_freq
600000

root:cpufreq# echo 1800000 > scaling_max_freq
root:cpufreq# cat scaling_max_freq
600000

root:cpufreq# cat cpuinfo_max_freq
1800000
root:cpufreq# cat cpuinfo_max_freq > scaling_max_freq
root:cpufreq# cat scaling_max_freq
600000

root:cpufreq# cpufreq-set -u 1800000
root:cpufreq# cat scaling_max_freq
600000

Before value locking, cpufreq works perfectly as it should.

This problem often occurs when the processor heats (high load, compilation...)
but randomly too (few minutes after boot, even if it does nothing).
Sometimes, after cpu cooling or cpufreqd reboot, I can manage again the speed
by hand.

My old kernel version (2.6.18 with speedstep-centrino driver) hasn't this
problem and cpufreqd works perfectly on it.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
