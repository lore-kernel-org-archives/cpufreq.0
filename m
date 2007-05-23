From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8524] Wrong cpu frequency displayed when overclocked
Date: Wed, 23 May 2007 08:54:08 -0700
Message-ID: <200705231554.l4NFs8L2015077@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8524

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |WILL_NOT_FIX



------- Additional Comments From davej@codemonkey.org.uk  2007-05-23 08:57 -------
The drivers are reliant upon BIOS data tables containing frequency values that
get exported to userspace.  These values don't change when you overclock.

There's no way to fix this.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
