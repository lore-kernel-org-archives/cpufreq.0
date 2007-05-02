From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Wed, 2 May 2007 08:18:27 -0700
Message-ID: <200705021518.l42FIRRg022189@fire-2.osdl.org>
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





------- Additional Comments From dsd@gentoo.org  2007-05-02 08:18 -------
Thanks. Can I see dmesg output from using it?

The modified DSDT I gave you didn't quite work correctly. If you look in the logs:

freq-table: table entry 0: 1266768 kHz, 3085 index
[...]
cpufreq-core: setting new policy for CPU 0: 666720 - 1266768 kHz
freq-table: request for verification of policy (666720 - 1266768 kHz) for cpu 0
freq-table: verification lead to (666720 - 1266768 kHz) for cpu 0
freq-table: request for verification of policy (666720 - 1266000 kHz) for cpu 0
freq-table: verification lead to (666720 - 1266000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 666720 - 1266000 kHz
[...]
performance: setting to 1266000 kHz because of event 1
cpufreq-core: target for CPU 0: 1266000 kHz, relation 1
freq-table: request for target 1266000 kHz (relation: 1) for cpu 0
freq-table: target is 1 (1000080 kHz, 3593)

In other words, it's not actually reaching the maximum frequency due to rounding
between mhz/khz values.

I'm pretty sure the last patch I posted has the same bug. If so, please apply
the updated version I'll post in a few mins.


Also, there's something else going on here.

From the logs:
Detected 1333.446 MHz processor.

and:
userspace: managing cpu 0 started (666720 - 1266000 kHz, currently 1333440 kHz)

And I suspect /proc/cpuinfo will reflect that if you don't build cpufreq support.

That aside, I don't think that's a new issue (I think 2.6.18 also behaved the
same way for you), so if we can get it going at 1266mhz again I think this bug
is fixed (and you're welcome to file a new bug for the 1333mhz issue).

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
