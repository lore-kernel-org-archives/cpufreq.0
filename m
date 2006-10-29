From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6938] use of cpufreq (with any cpufreqd-like deamon) has
	strange influence on the acpi functions of an IBM Thinkpad X21
Date: Sun, 29 Oct 2006 10:02:08 -0800
Message-ID: <200610291802.k9TI287s008453@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6938





------- Additional Comments From herrmann-tom@gmx.de  2006-10-29 09:48 -------
I may have found some helpful ACPI output:
this is from my syslog and the timestamp matches the point where acpi stoped
working correctly. I'll attach the whole file:

Oct 29 18:40:17 localhost kernel: ACPI Exception (evregion-0424): AE_TIME,
Returned by Handler for [EmbeddedControl] [20060707]
Oct 29 18:40:17 localhost kernel: ibm_acpi: acpi_evalf(TMP0, d, ...) failed: 19
Oct 29 18:40:18 localhost kernel: ACPI Exception (evregion-0424): AE_TIME,
Returned by Handler for [EmbeddedControl] [20060707]
Oct 29 18:40:18 localhost kernel: ACPI Error (psparse-0537): Method
parse/execution failed [\_SB_.PCI0.ISA_.EC__.AC__._PSR] (Node c136c540), AE_TIME
Oct 29 18:40:18 localhost kernel: ACPI Exception (acpi_ac-0096): AE_TIME, Error
reading AC Adapter state [20060707]
Oct 29 18:40:18 localhost kernel: ACPI Exception (evregion-0424): AE_TIME,
Returned by Handler for [EmbeddedControl] [20060707]
Oct 29 18:40:18 localhost kernel: ibm_acpi: acpi_evalf(TMP0, d, ...) failed: 19

I hope this helps and someone cares

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
