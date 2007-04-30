From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Mon, 30 Apr 2007 07:14:38 -0700
Message-ID: <200704301414.l3UEEcPw023341@fire-2.osdl.org>
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





------- Additional Comments From remur@gmx.net  2007-04-30 07:14 -------
Uh, how embarrassing, this was supposed to end up on the archlinux bugtracker. 
Well now I can at least give you some more infos as I am not sure if this is 
archlinux specific.

System is a Amilo M1439g which is equal to the M1437g except it has an Nvidia 
card instead of an ATI card

Telling the kernel to load acpi-cpufreq right at the start fixes the issue and 
no wrong module gets loaded

I've attached the output of dmesg, cpufreq-info and lsmod in the good and bad 
state

This is all on the fresh released 2.6.21 Kernel.

If there are any other infos you need I can upload them too, 

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
