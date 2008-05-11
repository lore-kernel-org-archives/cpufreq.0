From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10671] New: [2.6.26-rc1] WARNING: at drivers/base/sys.c:183
Date: Sun, 11 May 2008 12:49:28 -0700 (PDT)
Message-ID: <bug-10671-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10671

           Summary: [2.6.26-rc1] WARNING: at drivers/base/sys.c:183
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.26-rc1
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: rjw@sisk.pl
OtherBugsDependingO 10492
             nThis:
        Regression: 1


Subject    : [2.6.26-rc1] WARNING: at drivers/base/sys.c:183
Submitter  : Tilman Schmidt <tilman@imap.cc>
Date       : 2008-05-11 18:18
References : http://marc.info/?l=linux-kernel&m=121052996610776&w=4
Handled-By : Dave Jones <davej@codemonkey.org.uk>

This entry is being used for tracking a regression from 2.6.25.  Please don't
close it until the problem is fixed in the mainline.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
