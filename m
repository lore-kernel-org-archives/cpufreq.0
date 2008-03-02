From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10144] New: Wrong cpufreq speeds detected when overclocking
	(speeds reported using stock FSB, not overclocked)
Date: Sun,  2 Mar 2008 07:41:34 -0800 (PST)
Message-ID: <bug-10144-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10144

           Summary: Wrong cpufreq speeds detected when overclocking (speeds
                    reported using stock FSB, not overclocked)
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.22.17-0.1-default
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: knuckles@gmail.com


Latest working kernel version: Don't know
Earliest failing kernel version: Don't know
Distribution: openSUSE, Ubuntu
Hardware Environment: ASUS P5K (latest bios: 0902), Intel E2180, 2GB Ram
Software Environment: Normal opensuse install
Problem Description:

The E2180 is spec'd to work with 200Mhz front side bus, and has 6x thru 10x
multipliers, so, with speedstep, it should go from 1.2ghz to 2.0ghz, and that
happens fine.

The problem is, I overclocked the frontside bus to 313Mhz, (and still have
speedstep enabled), so speeds should be between 1.88ghz and 3.13ghz, but the
problem is cpufreq still reports the "available" speeds as being between 1.2
and 2.0ghz. I think this is only visual, since when booting the kernel says
"Detected 3130.093 MHz processor.", but after booting, /proc/cpuinfo and other
places all assume the aforementioned speeds.

I've also tested, and this still happens on Ubuntu Herdy alpha 5 that uses
2.6.24.2, so this should be distro-unrelated.

Steps to reproduce:
Overclock the FSB, and check reported cpufreq speeds.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
