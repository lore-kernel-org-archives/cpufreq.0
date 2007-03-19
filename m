From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] CPU Scaling doesn't work.
Date: Mon, 19 Mar 2007 10:55:37 -0700
Message-ID: <200703191755.l2JHtbRS000742@fire-2.osdl.org>
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





------- Additional Comments From alphatrax@t-online.de  2007-03-19 10:55 -------
I have loaded the following modules:

uwe@loopy2:~$ lsmod | grep cpufreq
cpufreq_stats           7360  0
cpufreq_ondemand        9228  0
cpufreq_userspace       5408  0
cpufreq_conservative     8200  0
freq_table              5792  2 cpufreq_stats,cpufreq_ondemand
cpufreq_powersave       2688  0

uwe@loopy2:~$ lsmod | grep acpi
sony_acpi               6284  0
pcc_acpi               13184  0
dev_acpi               12292  0
asus_acpi              17308  0
backlight               7040  1 asus_acpi

There are no modules matching "centrino" loaded.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
