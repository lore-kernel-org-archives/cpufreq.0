From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Tue, 1 May 2007 10:33:25 -0700
Message-ID: <200705011733.l41HXPjl027769@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From dsd@gentoo.org  2007-05-01 10:33 -------
OK, your BIOS is broken so we shouldn't go further down that route.
I'll hopefully find some time to dig into why acpi_perflib isn't obeying the
133mhz FSB value. I suspect this may be another BIOS bug on your system...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
