From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6367] acpi-cpufreq: fancy CPUfreq values - can't load
	p4-clockmod anymore
Date: Mon, 5 Feb 2007 07:09:03 -0800
Message-ID: <200702051509.l15F93TY013502@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6367





------- Additional Comments From oopla@users.sf.net  2007-02-05 06:59 -------
can't tell, have no more that P4 notebook handy, sorry.

Can only report that, on a "Intel(R) Celeron(R) M processor 1400MHz" which looks
like a PM but isn't - ie speedstep won't work while p4_clockmod does - I had
similar problems, but 2.6.18.6 works fine. rmmod cpufreq_stats won't oops here,
either.

Also, 2.6.20-rc* broke too many things on this pc, running Debian Etch, that I
refrained from going on 2.6.19 and above.

Not 100% sure, but it might be reasonable to close this bugrep.

thx

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
