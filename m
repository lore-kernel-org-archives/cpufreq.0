From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6558] Cpufreq reports nominal CPU speed instead of actual
Date: Wed, 31 Jan 2007 14:22:18 -0800
Message-ID: <200701312222.l0VMMITj013524@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6558

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |INVALID



------- Additional Comments From davej@codemonkey.org.uk  2007-01-31 14:13 -------
If the FSB has been overclocked, we have no chance to report the correct speed.  

The CPU can only report FSB values back to cpufreq that it knows about (Which
are typically the common 100/133/266 etc multiples.  Go outside these, and all
bets are off).

If the CPU has a x10 multiplier and thinks its at 266FSB but the user has it
clocked up to 300, cpufreq will report 266*10, whilst it's actually running at
400MHz faster than we report.

Additionally, any BIOS tables detailing the frequencies the chip can run at are
determined using fixed FSB values.  If that has an entry for "2.6GHz", that's
what cpufreq exports, since it's not based on what the FSB is actually running
at, but the FSB speed the platform supports.

There's really no good way to deal with this.   There are good reasons not to
under/overclock, and this is one of them.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
