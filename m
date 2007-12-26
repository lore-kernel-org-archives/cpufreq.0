From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9636] New: cpufreq reports too low max freq on Intel P4
Date: Wed, 26 Dec 2007 04:34:41 -0800 (PST)
Message-ID: <bug-9636-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9636

           Summary: cpufreq reports too low max freq on Intel P4
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.23
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: peter.ganzhorn@googlemail.com


Most recent kernel where this bug did not occur: -
Distribution: Debian testing
Hardware Environment: Intel P4 3.0GHz HT, Intel 945 chipset
Software Environment: Debian testing
Problem Description:
Using the acpi-cpufreq driver the CPU will not switch to a frequency higher
than 1.5 GHz; the sysfs cpufreq interface (cpuinfo_max_freq) reports 1.5 GHz to
be the maximum frequency available as well.
The same kernel without cpufreq support enabled does not show those problems,
the CPU will run at 3 GHz without cpufreq.
Kernel 2.6.23 and 2.6.24-rc* both show the problem.

Here some output with cpufreq enabled:
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
1500000
# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq 
1500000
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
1500000 1400000

Actually it *should* report frequencies up to 3 GHz, but only does report up to
1.5 GHz.
I'm gonna attach the /proc/cpuinfo data to this bug report, let me know if you
need any other information.
This is a really, really nasty bug.

Steps to reproduce: Depends on my hardware I guess.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
