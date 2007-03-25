From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] CPU Scaling doesn't work.
Date: Sun, 25 Mar 2007 12:25:07 -0700
Message-ID: <200703251925.l2PJP7dv023456@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8228

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO



------- Additional Comments From davej@codemonkey.org.uk  2007-03-25 12:25 -------
DTRT = "do the right thing" :-)

Please attach your /proc/acpi/dsdt
It appears your BIOS either lacks tables, or has broken ones.

Maybe the Intel folks can spot something that can be worked around, or failing
that, maybe there's a BIOS update available for your system.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
