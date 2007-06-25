From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8671] New: CPU frequency always on highest frequency after
	wakeup from suspend to disk
Date: Mon, 25 Jun 2007 04:57:33 -0700 (PDT)
Message-ID: <bug-8671-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8671

           Summary: CPU frequency always on highest frequency after wakeup
                    from suspend to disk
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.22-rc5-git8
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: linux@markus-schaub.de


Most recent kernel where this bug did not occur: unkown
Distribution: Gentoo Linux
Hardware Environment: IBM Thinkpad T43
Software Environment:
Problem Description: cpufreq_conservative doesn't scale CPU frequency anymore
after wakeup from suspend to disk, instead CPU runs always with the highest
available frequency. Scaling driver is acpi-cpufreq.

Steps to reproduce: Choose cpufreq_conservative as scaling driver and execute
"echo disk > /sys/power/state".


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
