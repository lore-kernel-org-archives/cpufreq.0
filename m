From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9558] New: Frequency scaling not working after BIOS upgrade on
	Asus F3jc
Date: Thu, 13 Dec 2007 22:58:45 -0800 (PST)
Message-ID: <bug-9558-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9558

           Summary: Frequency scaling not working after BIOS upgrade on Asus
                    F3jc
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.23.1-custom
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: scurippio@gmail.com


Most recent kernel where this bug did not occur: n/a
Distribution: Debian GNU/Linux
Hardware Environment: Asus F3jc
Software Environment: n/a
Problem Description: Frequency scaling is not working after bios version 206 on
my Asus f3jc laptop (and probably on many others Asus laptops)

Steps to reproduce:

BIOS images are located here -> ftp://dlsvr01.asus.com/pub/ASUS/nb/F3Jc/
(mostly down, at 5 o'clock is the right time to login :p)

/etc/init.d/powernowd: 156: cannot create
/sys/devices/system/cpu/cpu0//cpufreq/scaling_governor: Directory nonexistent
 * CPU frequency scaling not supported


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
