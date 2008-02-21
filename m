From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10062] New: cpufreq scaling for via c3 no longer works
Date: Thu, 21 Feb 2008 15:27:28 -0800 (PST)
Message-ID: <bug-10062-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10062

           Summary: cpufreq scaling for via c3 no longer works
           Product: Power Management
           Version: 2.5
     KernelVersion: Linux Rie 2.6.22-14-386 #1 Tue Dec 18 07:34:24 UTC 2007
                    i686 GNU
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: bugzilla.kernel.org@rolf.leggewie.biz


It seems the scaling for cpu scaling for VIA C3 CPUs has been missing from the
Kernel for 2.6 kernels.  I am not exactly sure when this stopped working but I
believe it was between the 2.4 and 2.6 switch.  Let me know if there is
anything I can do to provide further information.  I am not always sure where
to look.  I'd be happy to compile new kernels for testing anytime.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
