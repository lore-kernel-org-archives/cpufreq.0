From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7880] cpufreq detects wrong frequency on VIA Esther CPU
	(C7-1500)
Date: Mon, 29 Jan 2007 10:44:58 -0800
Message-ID: <200701291844.l0TIiwnN007155@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7880





------- Additional Comments From rafalbilski@interia.pl  2007-01-29 10:36 -------
What is incorrect here? I see that "Name (PPS1, Package (0x02)" is claiming that
it contains only two packages. Why is third, place holder/incorrect, package
ever read?
states[0].core_frequency is max frequency here.
I think that there are two different packages because one is for Centaur C7 with
brand C3:
0x00B0,
0x00B0
0x00B1,
0x00B1
And second for Centaur C7 with brand C7 or C7-m or Eden.
0x0F13, = x15.0, 1004mV
0x0F13
0x0810, = x8.0, 956mV
0x0810


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
