From: Sercz <sercz@web.de>
Subject: Powernow in kernel 2.6.6-rc5
Date: Fri, 04 Jun 2004 14:27:30 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C06AB2.7010407@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

I've read your article (http://forums.gentoo.org/viewtopic.php?t=178018) 
and did the steps you said- but it doesn't work.
I'm running gentoo with kernel 2.6.6-rc5 (mm-sources) and powernow is 
compiled into the kernel.

Adding "powernow_k7.powernow_acpi_force=1" to the kernel command line 
changes my dmesg output to:

PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB:  99.557 MHz
powernow: PSB/PST known to be broken.  Trying ACPI instead
powernow: acpi:  P0: 1400 MHz 21000 mW 300 uS control 009c4176 SGTC 10000
powernow:    FID: 0x16 (14.0x [1393MHz])        VID: 0xb (1.450V)
powernow: acpi:  P1: 1300 MHz 15000 mW 300 uS control 009c4194 SGTC 10000
powernow:    FID: 0x14 (13.0x [1294MHz])        VID: 0xc (1.400V)
powernow: acpi:  P2: 1200 MHz 15000 mW 300 uS control 009c41a2 SGTC 10000
powernow:    FID: 0x2 (12.0x [1194MHz]) VID: 0xd (1.350V)
powernow: acpi:  P3: 1100 MHz 15000 mW 300 uS control 009c41c0 SGTC 10000
powernow:    FID: 0x0 (11.0x [1095MHz]) VID: 0xe (1.300V)
powernow: acpi:  P4: 1100 MHz 15000 mW 300 uS control 009c41c0 SGTC 10000
powernow:    FID: 0x0 (11.0x [1095MHz]) VID: 0xe (1.300V)
powernow: acpi:  P5: 1000 MHz 15000 mW 300 uS control 009c41ce SGTC 10000
powernow:    FID: 0xe (10.0x [995MHz])  VID: 0xe (1.300V)
powernow: Minimum speed 995 MHz. Maximum speed 1393 MHz.

the original message:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB:  99.557 MHz
powernow: Found PSB header at c00f0270
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 300 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:0 (@c00f0280)
powernow:  cpuid: 0x780    fsb: 100    maxFID: 0x16    startvid: 0xb
powernow:    FID: 0xe (10.0x [995MHz])    VID: 0xe (1.300V)
powernow:    FID: 0x0 (11.0x [1095MHz])    VID: 0xe (1.300V)
powernow:    FID: 0x0 (11.0x [1095MHz])    VID: 0xe (1.300V)
powernow:    FID: 0x2 (12.0x [1194MHz])    VID: 0xd (1.350V)
powernow:    FID: 0x14 (13.0x [1294MHz])    VID: 0xc (1.400V)
powernow:    FID: 0x16 (14.0x [1393MHz])    VID: 0xb (1.450V)
powernow: SGTC: 30000
powernow: Minimum speed 995 MHz. Maximum speed 1393 MHz.


but minimum speed is, as you, see still ca. 1GHz, under win I was able 
to clock down to 233MHz.
My Computer is an Asus L2400D with an Athlon Mobile XP 1600+

I hope this helps


Sincerly,

Sascha Schwedes
