From: Forcarlo <forcarlo@email.it>
Subject: Problem powernow an Athlon 2600+ XP[solved](dmesg output)
Date: Thu, 27 May 2004 00:09:19 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <83a7e71deef1aea744ed8f19413d69fa@82.49.140.94>
Reply-To: Forcarlo <forcarlo@email.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk


I have compiled powernow built-in in mm-sources-2.6.6-rc5 and I add
"powernow_k7.powernow_acpi_force=3D1", "powernow_k7.acpi_force=3D1" don't=
 work.
Now I get 796,1 Mhz as a minimum freq instead of 1393 Mhz.

With no kernel option dmesg output was:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 132.688 MHz
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:2 (@c00f072e)
powernow:  cpuid: 0x7a0 fsb: 133        maxFID: 0x18    startvid: 0x7
powernow:    FID: 0xf (10.5x [1393MHz]) VID: 0xe (1.300V)
powernow:    FID: 0x0 (11.0x [1459MHz]) VID: 0xd (1.350V)
powernow:    FID: 0x1 (11.5x [1525MHz]) VID: 0xc (1.400V)
powernow:    FID: 0x2 (12.0x [1592MHz]) VID: 0xb (1.450V)
powernow:    FID: 0x3 (12.5x [1658MHz]) VID: 0xa (1.500V)
powernow:    FID: 0x14 (13.0x [1724MHz])        VID: 0x9 (1.550V)
powernow:    FID: 0x15 (13.5x [1791MHz])        VID: 0x8 (1.600V)
powernow:    FID: 0x18 (15.0x [1990MHz])        VID: 0x7 (1.650V)
powernow: SGTC: 13333
powernow: Minimum speed 1393 MHz. Maximum speed 1990 MHz.=20

Now dmesg output is:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 132.739 MHz
powernow: PSB/PST known to be broken.  Trying ACPI instead
powernow: acpi:  P0: 2000 MHz 75000 mW 125 uS control 00d058f8 SGTC 13334
powernow:    FID: 0x18 (15.0x [1991MHz])        VID: 0x7 (1.650V)
powernow: acpi:  P1: 1800 MHz 60000 mW 125 uS control 00d05915 SGTC 13334
powernow:    FID: 0x15 (13.5x [1791MHz])        VID: 0x8 (1.600V)
powernow: acpi:  P2: 1400 MHz 32000 mW 125 uS control 00d059cf SGTC 13334
powernow:    FID: 0xf (10.5x [1393MHz]) VID: 0xe (1.300V)
powernow: acpi:  P3: 1064 MHz 30000 mW 125 uS control 00d059ca SGTC 13334
powernow:    FID: 0xa (8.0x [1061MHz])  VID: 0xe (1.300V)
powernow: acpi:  P4: 800 MHz 26000 mW 125 uS control 00d059c6 SGTC 13334
powernow:    FID: 0x6 (6.0x [796MHz])   VID: 0xe (1.300V)
powernow: Minimum speed 796 MHz. Maximum speed 1991 MHz.=20
