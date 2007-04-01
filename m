From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Sun, 1 Apr 2007 14:41:01 -0700
Message-ID: <200704012141.l31Lf1ft018182@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From bugzilla.20.dsurawicz@spamgourmet.com  2007-04-01 14:41 -------
After analyzing the log, my guess is that there is a bug in some acpi piece of
source of powernow-k7. Here is what I found out:

from dmesg.log:
-------------snip--------------
powernow-k7: acpi:  P0: 950 MHz 24000 mW 125 uS control 009c418d SGTC 10000
powernow-k7:    FID: 0xd (9.5x [1266MHz])  VID: 0xc (1.400V)
powernow-k7: acpi:  P1: 750 MHz 16337 mW 125 uS control 009c41c9 SGTC 10000
powernow-k7:    FID: 0x9 (7.5x [1000MHz])  VID: 0xe (1.300V)
powernow-k7: acpi:  P2: 700 MHz 15248 mW 125 uS control 009c41c8 SGTC 10000
powernow-k7:    FID: 0x8 (7.0x [933MHz])  VID: 0xe (1.300V)
powernow-k7: acpi:  P3: 600 MHz 12084 mW 125 uS control 009c4226 SGTC 10000
powernow-k7:    FID: 0x6 (6.0x [800MHz])  VID: 0x11 (1.250V)
powernow-k7: acpi:  P4: 500 MHz 9280 mW 125 uS control 009c4264 SGTC 10000
powernow-k7:    FID: 0x4 (5.0x [666MHz])  VID: 0x13 (1.200V)
-------------snap--------------

As you can see, acpi detects the states available with my cpu are,
500,600,700,750, and 950MHz. But the correct values are 666,800,933,1000, and
1266MHz, as shown in the lines stating values FID and VID.

If one devides the corresponding values of FID by the ones detected by acpi, e.g
666/500, this always yields 1.33. Could this be somehow related to the FSB
frequency?

powernow-k7: FSB: 133MHz

Furthermore, ' # cat /proc/acpi/processor/CPU0/performance' give the following
output, regardless whether I use a 2.6.18 (before applying the above mentioned
patch) or later:

state count:             5
active state:            P0
states:
   *P0:                  950 MHz, 24000 mW, 125 uS
    P1:                  750 MHz, 16337 mW, 125 uS
    P2:                  700 MHz, 15248 mW, 125 uS
    P3:                  600 MHz, 12084 mW, 125 uS
    P4:                  500 MHz, 9280 mW, 125 uS

If I change the active state to P4 and back to P0, the cpu never speeds up to
1267MHz any more but stays at a around 1000MHz. Exact speed depends on the
kernel version:

2.6.18: 1000MHz
2.6.21: 950MHz

1000MHz is a valid speed according to FID table, which is set because it is
close to the invalid 950MHz.

After applying the patch, the cpufreq_verify_within_limits call in
processor_perflib.c is executed and, thus, I suspect that the frequency is
compared to the table obtained by acpi, where this is a valid frequency.


Any comments?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
