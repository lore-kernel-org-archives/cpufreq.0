From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7880] cpufreq detects wrong frequency on VIA Esther CPU
	(C7-1500)
Date: Sun, 28 Jan 2007 01:33:38 -0800
Message-ID: <200701280933.l0S9Xcv0017490@fire-2.osdl.org>
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

claas@rootdir.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |davej@codemonkey.org.uk



------- Additional Comments From claas@rootdir.de  2007-01-28 01:25 -------
I am quoting rafalb from the Viaarena forum
(http://forums.viaarena.com/messageview.aspx?catid=32&threadid=76030&forumid=1):


I don't think it is ACPI problem. I'm not 100% sure, but executing
\_PR_.CPU0._PSS returned only 2 states:
[Package] Contains 2 Elements:
[Package] Contains 6 Elements:
[Integer] = 00000000000005DC = 1500MHz
[Integer] = 0000000000003A98 = 15000mW
[Integer] = 000000000000000A = 10us
[Integer] = 000000000000000A = 10us
[Integer] = 00000000000000B0
[Integer] = 00000000000000B0
[Package] Contains 6 Elements:
[Integer] = 0000000000000320 = 800MHz
[Integer] = 0000000000001F40 = 8000mW
[Integer] = 000000000000000A = 10us
[Integer] = 000000000000000A = 10us
[Integer] = 00000000000000B1
[Integer] = 00000000000000B1
Looks like a bug in cpufreq driver to me.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
