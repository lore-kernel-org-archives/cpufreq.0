From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] New: CPU overheats at high frequencies,
	ondemand governor fails to throttle sufficiently.
Date: Fri,  9 May 2008 10:39:06 -0700 (PDT)
Message-ID: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10658

           Summary: CPU overheats at high frequencies, ondemand governor
                    fails to throttle sufficiently.
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25.2
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: martin-kernel-bugzilla@earth.li
                CC: mjg59-kernel@srcf.ucam.org


Latest working kernel version: Not sure if this ever worked.
Earliest failing kernel version: 2.6.23.12 definitely, probably much earlier.
Hardware Environment: Dell Precision M20, aka Latitude D610.

Problem Description:

This laptop has a very poor cooling system. If the CPU is run fast for too long
it will trip the thermal threshold at 101 deg C. I have been working around
this for some time by using the powersave governor which keeps the CPU at the
minimum 800MHz and prevents overheat. It would be nice to be able to use
ondemand reliably.

The ondemand governor is okay for normal loads. Under heavy load though, as the
temperature increases it will only reduce the CPU frequency from the maximum of
2GHz to the next lower setting of 1.6GHz, and then often allow it quickly back
to 2GHz. This is not enough to keep the temperature down so the system will
trip and shutdown.

Steps to reproduce:

Obtain one of these badly designed laptops. Set cpufreq governor to ondemand,
performance, or anything else that lets the CPU stay at 1.6GHz+. while(1);


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
