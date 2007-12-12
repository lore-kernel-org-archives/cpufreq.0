From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9549] New: [crash] kernel BUG at drivers/cpufreq/cpufreq.c:1060!
Date: Wed, 12 Dec 2007 10:33:38 -0800 (PST)
Message-ID: <bug-9549-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9549

           Summary: [crash] kernel BUG at drivers/cpufreq/cpufreq.c:1060!
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24-rc4-git5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: rjwysocki@sisk.pl


Subject         : [crash] kernel BUG at drivers/cpufreq/cpufreq.c:1060!
Submitter       : Ingo Molnar <mingo@elte.hu>
References      : http://lkml.org/lkml/2007/12/12/52
Handled-By      : Dave Jones <davej@redhat.com>


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
