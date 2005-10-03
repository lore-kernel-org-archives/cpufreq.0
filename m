From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5353] New: cpufreq_conservative: cpu always in slowest mode
	even under high load
Date: Mon, 3 Oct 2005 08:22:37 -0700
Message-ID: <200510031522.j93FMbCP010702@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5353

           Summary: cpufreq_conservative: cpu always in slowest mode even
                    under high load
    Kernel Version: 2.6.13-rc7
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: linux@markus-schaub.de


Most recent kernel where this bug did not occur: don't know
Distribution:
Hardware Environment: IBM Thinkpad T43, Pentium M
Software Environment: speedstep_centrino
Problem Description:
After serveral hours under high cpu load (i.e. coding videos with mencoder) the
system switches to the lowest possible cpu frequency (indicated by
/sys/devices/.../cpufreq/scaling_cur_freq or by low frame rate in video coder).
Then changing scaling_governor to performance doesn't change anything, the cpu
frequency stays at the lowest possible value. Only reboot fixes this.

Steps to reproduce:
$ modprobe cpufreq_conservative
$ modprobe speedstep_centrino
then wait a long time :-)
The Problem occurs very seldomly, about three times in the last months.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
