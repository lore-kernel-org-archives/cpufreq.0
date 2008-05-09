From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10654] New: cat
	/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed gets BUG
	on Transmeta Crusoe CPU
Date: Thu,  8 May 2008 19:22:45 -0700 (PDT)
Message-ID: <bug-10654-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10654

           Summary: cat
                    /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
                    gets BUG on Transmeta Crusoe CPU
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: masaki-c@nict.go.jp


Latest working kernel version: 2.6.24
Distribution: Fedora 9(rawhide)

Problem Description:

Reading from /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
gets BUG() on Transmeta CPU.
See https://bugzilla.redhat.com/show_bug.cgi?id=443354 for more info.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
