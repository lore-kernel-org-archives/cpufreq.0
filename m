From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8720] New: still problems with k7 mobile frequency is lower
	than real
Date: Fri,  6 Jul 2007 10:18:20 -0700 (PDT)
Message-ID: <bug-8720-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8720

           Summary: still problems with k7 mobile frequency is lower than
                    real
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.22-rc5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: cimmo@libero.it
                CC: dsd@gentoo.org


Most recent kernel where this bug did not occur: don't know
Distribution: Kubuntu 7.04 and 7.10 Tribe2
Hardware Environment: Athlon XP-M 2400+
Problem Description: This cpu has 1800 Mhz and is detected well during early
startup but after by powernowdas 1473 Mhz, the last fix in bug #8255 didn't
solve the problem for me, before and after that patch is the same.

I tried also Kubuntu 7.10 Tribe 2 that has a 2.6.22rc5 custom according to
https://lists.ubuntu.com/archives/gutsy-changes/2007-June/003601.html

I personally verified that has the patch posted in bug #8255 and it has, but
same bug.

from dmesg attacched:
[    0.000000] Detected 1807.794 MHz processor.

[  118.852989] powernow: PowerNOW! Technology present. Can scale: frequency and
voltage.
[  118.862515] powernow: Trying ACPI perflib
[  118.864625] powernow: Minimum speed 1473 MHz. Maximum speed 1473 MHz.


The processor has the Barton core with 512 KB of cache


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
