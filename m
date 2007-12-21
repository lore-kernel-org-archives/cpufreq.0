From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9615] New: Bug with cpufreq when using ondemand governor as
	default
Date: Fri, 21 Dec 2007 14:06:06 -0800 (PST)
Message-ID: <bug-9615-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9615

           Summary: Bug with cpufreq when using ondemand governor as default
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24-rc5
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: rjwysocki@sisk.pl


Subject         : Bug with cpufreq when using ondemand governor as default
Submitter       : Johannes Weiner <hannes@saeurebad.de>
References      : http://lkml.org/lkml/2007/12/21/127
Handled-By      :
Patch           : http://lkml.org/lkml/2007/12/21/127


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
