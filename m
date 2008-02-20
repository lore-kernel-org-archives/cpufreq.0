From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10055] New: conservative governor doesn't increase frequency,
	just decrease. powernow-k7
Date: Wed, 20 Feb 2008 11:40:22 -0800 (PST)
Message-ID: <bug-10055-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10055

           Summary: conservative governor doesn't increase frequency, just
                    decrease. powernow-k7
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24.2
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: borych@gmx.de


Latest working kernel version:2.6.23.16
Earliest failing kernel version:2.6.24
Distribution:Gentoo
Hardware Environment:mitac 8375 Athlon XP-M 2800+

Problem Description: kernel 2.6.24.2, conservative governor compiled in
(doesn't matter whether module or not). If I set conservative as current
governor (either via cpufreq-utils or set it as default governor in kernel) the
CPU frequency decreases slowly at low CPU load as it ought to be. But if I put
the CPU on high load then,the frequency remains unchanged. 
Conservative is working on 2.6.23.*, ondemand works even on 2.6.24 CPU
frequency module is powernow-k7 compiled in as module.

Steps to reproduce:
1.compile kernel with conservative governor
2.set it as current governor
3.put CPU on high load


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
