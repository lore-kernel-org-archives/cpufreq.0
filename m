From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5517] CPUFrequency doesn't support user defined P-States
Date: Fri, 28 Oct 2005 11:36:18 -0700
Message-ID: <200510281836.j9SIaIbC025136@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5517





------- Additional Comments From mark.langsdorf@amd.com  2005-10-28 11:32 -------
AMD doesn't support user defined pstates.  It is very easy to hardlock the 
system by giving it inadequate voltage for the frequency.  We strongly 
recommend sticking with the AMD tested pstates included in the BIOS.

Your problem is much better solved by setting limits in the governor.  If you 
want your system to never use more than 75% of maximum frequency, then set up 
the governor so it never goes over 75% of maximum frequency.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
