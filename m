From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Thu, 12 Apr 2007 02:08:29 -0700
Message-ID: <200704120908.l3C98TPS003479@fire-2.osdl.org>
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





------- Additional Comments From rui.zhang@intel.com  2007-04-12 02:08 -------
>Len, hope this is sufficient info for you. Kernel compiled with cpufreq debug
>enabled, and booted with cpufreq.debug=7
Please
#echo 0x1f >/sys/module/acpi/parameter/debug_level
and modprobe the cpufreq driver again.
Hope we can get more information from the _dmesg_ output.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
