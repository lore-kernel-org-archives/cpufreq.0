From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] CPU Scaling doesn't work.
Date: Sun, 25 Mar 2007 17:52:52 -0700
Message-ID: <200703260052.l2Q0qqxM031724@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8228





------- Additional Comments From davej@codemonkey.org.uk  2007-03-25 17:52 -------
merging linux-phc is not the right way to fix this.

I truly hope that Ubuntu haven't merged that stuff in their kernel.  Forking
whole subsystems (especially ones that are unlikely to ever get merged back)
isn't the way to get stuff fixed in the upstream kernel.


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
