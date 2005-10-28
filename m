From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5517] New: CPUFrequency doesn't support user defined P-States
Date: Fri, 28 Oct 2005 11:24:07 -0700
Message-ID: <200510281824.j9SIO7pE024566@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5517

           Summary: CPUFrequency doesn't support user defined P-States
    Kernel Version: 2.6.14
            Status: NEW
          Severity: low
             Owner: cpufreq@www.linux.org.uk
         Submitter: t.artem@mailcity.com


Problem Description: currently CPUfreq driver has no means of allowing user to
define custom CPU P-States (voltages and multiplication ratios). The reason for
that might be, e.g. that I do not want my CPU to work at maximum
frequency/voltage but instead of that I would like it to work at 75% of its
maximum performance to keep it cool'n'quite even under high load.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
