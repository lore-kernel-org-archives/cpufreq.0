From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Mon, 26 Mar 2007 18:12:44 -0700
Message-ID: <200703270112.l2R1CiPS009700@fire-2.osdl.org>
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





------- Additional Comments From daniel@pressure.net.nz  2007-03-26 18:12 -------
Created an attachment (id=10955)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=10955&action=view)
dmesg output from 2.6.21rc5

Len, hope this is sufficient info for you. Kernel compiled with cpufreq debug
enabled, and booted with cpufreq.debug=7

You can see towards the end that speedstep-centrino and acpi-cpufreq still fail
to load, as they did pre-linux-phc patches.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
