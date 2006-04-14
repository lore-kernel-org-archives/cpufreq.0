From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6367] acpi-cpufreq: fancy CPUfreq values - can't load
	p4-clockmod anymore
Date: Fri, 14 Apr 2006 14:51:17 -0700
Message-ID: <200604142151.k3ELpHIS030744@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6367





------- Additional Comments From oopla@users.sf.net  2006-04-14 14:51 -------
tested 2.6.16.5: better, p4-clockmod would load, but avail_scaling_freq shows just:

2025000 2362500 2700000

while I know this CPU offers a larger f-table - I'd say the old one reported is 
correct/closer to what ToshibaHCI offers.

But get an oops on modprobe -r cpufreq_stats - see attachment #7875.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
