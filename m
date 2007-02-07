From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7866] cpufreq fails to correctly identify Intel Conroe
	operating frequencies
Date: Wed, 7 Feb 2007 05:57:45 -0800
Message-ID: <200702071357.l17Dvjq8003673@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7866





------- Additional Comments From jared@jaredcam.net  2007-02-07 05:48 -------
The FSB is currently overclocked, I think I have it set at 350 or so.  However,
I was still having this problem before I overclocked it, when the FSB was at 266.

I can set the FSB back to 266 and test that again with 2.6.20 if you think
that's the problem (I suspect it's not).   But cpufreq should probably either
disable itself or work correctly because the failure mode is pretty bad.  I
wouldn't have noticed the problem if I hadn't cat-ed /proc/cpuinfo.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
