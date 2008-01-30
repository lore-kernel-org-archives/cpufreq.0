From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9848] New: acpi-cpufreq: Incomplete freq list on ASUS P5N32-E
	SLI PLUS with Intel(R) Core(TM)2 Quad
Date: Wed, 30 Jan 2008 00:51:45 -0800 (PST)
Message-ID: <bug-9848-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9848

           Summary: acpi-cpufreq: Incomplete freq list on ASUS P5N32-E SLI
                    PLUS with Intel(R) Core(TM)2 Quad
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: patrol@sinus.cz
                CC: venkatesh.pallipadi@intel.com, trenn@suse.de


Latest working kernel version: N/A
Earliest failing kernel version: 2.6.23 (earlier kernels not tested)
Distribution: Vanilla kernel (no commonly known distro)
Hardware Environment:ASUS P5N32-E SLI PLUS MoBo, Intel(R) Core(TM)2 Quad CPU
(with constant TSC), 2G RAM
Software Environment:64bit binary (x86 Linux architecture), vanilla kernel,
booted by LILO, latest BIOS (0901)
Problem Description: Only 600 and 900Mhz clocks available in cpufreq-acpi. The
real CPU clock is 2.6 GHz - it is 2.4G CPU with overclocked FSB. When the
"Intel Enhanced Speedstep" feature is disabled in the BIOS, system runs at 2.6G
and cpufreq is not available. When the feature is enabled, the system seems to
run at 900M with no possibility to accelerate, just decelerate to 600M. 
Steps to reproduce: Use the above mobo/cpu, enable "Enhanced Intel Speedstep"
in BIOS, load 2.6.24 kernel with acpi-cpufreq.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
