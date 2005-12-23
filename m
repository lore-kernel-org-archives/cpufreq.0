From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5773] New: hang on reboot
Date: Thu, 22 Dec 2005 17:43:11 -0800
Message-ID: <200512230143.jBN1hB1m003431@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5773

           Summary: hang on reboot
    Kernel Version: 2.6.14
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: imran1008@gmail.com


Most recent kernel where this bug did not occur:
Distribution: Gentoo
Hardware Environment: 2.6ghz pentium4 HT
Software Environment: software suspend2
Problem Description:
 system hangs when resuming from Suspend2 and p4-clockmod module is (was)
loaded. However, system successfully resumes once in a blue moon. The system
always resumes properly when p4-clockmod is NOT loaded

Steps to reproduce:
 -load p4-clockmod module
 -use cpufreqd to adjust frequency
 -hibernate using hibernate-script (software suspend2)
 -resume computer from total power off

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
