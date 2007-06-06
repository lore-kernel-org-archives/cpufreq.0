From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7211] /proc/cpuinfo reports wrong frequency
Date: Wed, 6 Jun 2007 00:23:32 -0700
Message-ID: <200706060723.l567NW8M017415@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7211

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |INVALID



------- Additional Comments From davej@codemonkey.org.uk  2007-06-06 00:27 -------
"the fsb is clocked at 440mhz"

therein lies your problem.

When you overclock, the BIOS data tables don't match what the CPU is actually
running at.  There's no way to fix this.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
