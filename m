From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9014] New: acpi-cpufreq uses too much power
Date: Thu, 13 Sep 2007 04:05:06 -0700 (PDT)
Message-ID: <bug-9014-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9014

           Summary: acpi-cpufreq uses too much power
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.22
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: rrs@researchut.com


Most recent kernel where this bug did not occur:
N/A

Distribution:
Debian

Hardware Environment:
Dell XPS M1210
Processor: Intel Core Duo 2.0 Ghz
RAM: 2 GB
GPU: nVIDIA

Software Environment:
Linux 2.6.22 with DynTicks and HI-RES Timers

Problem Description:
Since the time I changed from speedstep-centrino to acpi-cpufreq after reading
the deprecated warning, I get only 5 minutes of battery backup on my laptop.
This is ugly.
With speedstep-centrino, I get back to my 1-1.5hrs of battery backup.

Sep 13 15:07:11 learner kernel: speedstep-centrino with
X86_SPEEDSTEP_CENTRINO_ACPI config is deprecated.
Sep 13 15:07:11 learner kernel:  Use X86_ACPI_CPUFREQ (acpi-cpufreq) instead.
Sep 13 15:07:11 learner powersaved: Starting powersaved with ACPI support


Steps to reproduce:
Use acpi-cpufreq instead on speedstep-centrino


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
