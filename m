From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8634] New: Unstable clocksource reported
Date: Fri, 15 Jun 2007 13:36:46 -0700 (PDT)
Message-ID: <bug-8634-3570@http.bugzilla.kernel.org/>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8634

           Summary: Unstable clocksource reported
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.21.5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: patrick.matthaei@web.de


Most recent kernel where this bug did not occur: Not known
Distribution: Debian Sid
Hardware Environment: AMD Athlon64 San Diego 4000+
Software Environment: Tickless Timer Support (64bit CPU, but 32bit system)
Problem Description:
Every time if I activate the 'ondemand' powersave gorvener, dmesg reports
following:

Time: acpi_pm clocksource has been installed.
Clocksource tsc unstable (delta = -245560788 ns)

This thing needs at booting up ~ 2-10 seconds, which is a lot of time, so I
think this is a bug.

My kernel config with all my inbuilded powersave features etc. is in attached.

Steps to reproduce:
Just do a "/bin/echo 'ondemand' >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor".


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
