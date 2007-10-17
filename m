From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9177] New: speedstep_centrino can't find device any more
Date: Wed, 17 Oct 2007 10:47:48 -0700 (PDT)
Message-ID: <bug-9177-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9177

           Summary: speedstep_centrino can't find device any more
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.23.1
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: alexander.heinlein@web.de


Most recent kernel where this bug did not occur: 2.6.22.6
Distribution: Debian GNU/Linux unstable
Hardware Environment: Thinkpad R52, Pentium M Dothan 750
Problem Description:
# modprobe speedstep_centrino
FATAL: Error inserting speedstep_centrino
(/lib/modules/2.6.23.1/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko):
No such device
speedstep_centrino can't find a device any more. Earlier kernel versions worked
without problems.

CONFIG_ACPI=y
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
