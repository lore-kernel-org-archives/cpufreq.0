From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7060] Thinkpad X60 stuck at low speed without battery
Date: Fri, 19 Jan 2007 04:19:46 -0800
Message-ID: <200701191219.l0JCJkIZ002921@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7060





------- Additional Comments From gsalgado@gmail.com  2007-01-19 04:12 -------
I've already tried it, and it doesn't solve this problem.

To solve this problem I could simply remove a call to
acpi_processor_get_platform_limit(pr) from acpi_processor_ppc_has_changed, since
that's the function responsible for obtaining the value of _PPC (and storing it
in pr->performance_platform_limit) from the BIOS, but that doesn't look right to me.

There are also other possible ways to workaround this problem in the kernel, but
that may cause regressions.

What I think is that the BIOS shouldn't notify the kernel that the _PPC has
changed when the battery is removed, since in that case we certainly have AC
plugged in.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
