From: Daniele Bonomi <dbonomi@crema.unimi.it>
Subject: Re: [Bug 3600] New: Cpu recognization fails after upgrade from
 2.6.7 to 2.6.9
Date: Wed, 20 Oct 2004 21:37:22 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041020213722.3cae81fc@paraclito.crema>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041020154744.GA5372@dreamland.darkstar.lan>
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

On Wed, 20 Oct 2004 17:47:44 +0200 Kronos <kronos@kronoz.cjb.net> wrote:

With the patch previously supplied by Kronos things started working as
well.
 
Output from the "broken" kernel with debug enabled is 

powernow: PowerNOW! Technology present. Can scale: frequency and
voltage. powernow: FSB:  49.758 MHz
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: acpi:  P0: 2133 MHz 75000 mW 125 uS control 00d058fa SGTC
13334 powernow:    FID: 0x1a (16.0x [796MHz])  VID: 0x7 (1.650V)
powernow: acpi:  P1: 1800 MHz 55000 mW 125 uS control 00d05935 SGTC
13334 powernow:    FID: 0x15 (13.5x [671MHz])  VID: 0x9 (1.550V)
powernow: acpi:  P2: 1467 MHz 32000 mW 125 uS control 00d059c0 SGTC
13334 powernow:    FID: 0x0 (11.0x [547MHz])  VID: 0xe (1.300V)
powernow: acpi:  P3: 1064 MHz 30000 mW 125 uS control 00d059ca SGTC
13334 powernow:    FID: 0xa (8.0x [398MHz])  VID: 0xe (1.300V)
powernow: acpi:  P4: 800 MHz 26000 mW 125 uS control 00d059c6 SGTC 13334
powernow:    FID: 0x6 (6.0x [298MHz])  VID: 0xe (1.300V)
powernow: Minimum speed 298 MHz. Maximum speed 796 MHz.

now is right

powernow: PowerNOW! Technology present. Can scale:
frequency and voltage. powernow: FSB: 132.718 MHz
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:3 (@c00f0746)
powernow:  cpuid: 0x7a0  fsb: 133  maxFID: 0x1a  startvid: 0x7
powernow:    FID: 0x0 (11.0x [1459MHz])  VID: 0xe (1.300V)
powernow:    FID: 0x1 (11.5x [1526MHz])  VID: 0xd (1.350V)
powernow:    FID: 0x2 (12.0x [1592MHz])  VID: 0xc (1.400V)
powernow:    FID: 0x3 (12.5x [1658MHz])  VID: 0xb (1.450V)
powernow:    FID: 0x14 (13.0x [1725MHz])  VID: 0xa (1.500V)
powernow:    FID: 0x15 (13.5x [1791MHz])  VID: 0x9 (1.550V)
powernow:    FID: 0x18 (15.0x [1990MHz])  VID: 0x8 (1.600V)
powernow:    FID: 0x1a (16.0x [2123MHz])  VID: 0x7 (1.650V)
powernow: SGTC: 13333
powernow: Minimum speed 1459 MHz. Maximum speed 2123 MHz.


Thank you all very much for the help.

Daniele



-- 
  ,___,	  While most peoples' opinions change, the conviction of their
  (9v9)   	     correctness never does
  (_^((\     	Gpg Key at filibusta.crema.unimi.it/~dbonomi/db.asc
-^-"-"-\\-^--	FP = C613 3CF3 94CD FA27 7900 D16C 3A6E 1CB5 585A CD71
