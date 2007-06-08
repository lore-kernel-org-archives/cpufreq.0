From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8601] New: 'conservative' governor never changes cpu speed
	(2.6.21.3)
Date: Fri, 8 Jun 2007 08:58:44 -0700
Message-ID: <200706081558.l58Fwiwi024537@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8601

           Summary: 'conservative' governor never changes cpu speed
                    (2.6.21.3)
    Kernel Version: 2.6.21.3
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: paul14075@gmail.com


Most recent kernel where this bug did *NOT* occur: 2.6.20
Distribution: FC7
Hardware Environment: IMB ThinkPad T42/Pentium-M 1.7 GHz
Software Environment: FC7/ custom compiled kernel
Problem Description:  I have built all the cpufreq governors into the kernel. 
The ondemand governor works exactly how its supposed to, but when I use the
conservative governor, it NEVER changes the CPU out of the lowest speed (for me,
600MHz).  Even at full load, it stays at lowest speed.

Steps to reproduce:  Use 2.6.21 w/ conservative governor and Centrino speedstep?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
