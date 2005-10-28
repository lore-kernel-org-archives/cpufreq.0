From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5517] CPUFrequency doesn't support user defined P-States
Date: Fri, 28 Oct 2005 12:00:46 -0700
Message-ID: <200510281900.j9SJ0k9r026399@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5517





------- Additional Comments From venkatesh.pallipadi@intel.com  2005-10-28 11:57 -------
Agree with Mark fully.

At no point you should be trying out a frequency, voltage that is not coming
from the platform BIOS. 

The cpufreq interface has available_frequencies. On Intel processors with
Enhanced Speedstep, each frequency has an associated voltage that the hardware
uses. You can set it to whatever frequency you want among that list using max
min interface or using userlevel governor and setting with setspeed or writing
your own userlevel daemon that does it.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
