From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7060] Thinkpad X60 stuck at low speed without battery
Date: Thu, 18 Jan 2007 17:31:40 -0800
Message-ID: <200701190131.l0J1Ve5o018381@fire-2.osdl.org>
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





------- Additional Comments From gsalgado@gmail.com  2007-01-18 17:24 -------
After some time debugging/cowboying a 2.6.20-rc5 tree, I found that the kernel
is just doing what the BIOS tells it to do, so this is certainly a BIOS issue.

The issue is that once the battery is removed, the BIOS gives the kernel a _PPC
of 2, which means that the kernel is only allowed to use the states from 2 to 2,
even though the possible states are from 0 to 2. Of course, state=0 means that
any frequency, up to the highest possible can be used, while state=2 means that
(in our case) only the lowest frequency can be used.

I'll try to hack my BIOS' DSDT now. Will comment here if I get it to work, since
it may be useful to somebody else.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
