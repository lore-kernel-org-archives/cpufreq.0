From: Kronos <kronos@kronoz.cjb.net>
Subject: Re: [Bug 3600] New: Cpu recognization fails after upgrade from
	2.6.7 to 2.6.9
Date: Wed, 20 Oct 2004 17:47:44 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041020154744.GA5372@dreamland.darkstar.lan>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200410201413.i9KED718023481@fire-1.osdl.org>
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: dbonomi@crema.unimi.it

Il Wed, Oct 20, 2004 at 07:13:07AM -0700, bugme-daemon@osdl.org ha scritto: 
> Problem Description:
> with linux 2.6.7 my processor is correctly recognized, this is the relative
> kernel output
> 
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: FSB: 132.686 MHz
> powernow: Found PSB header at c00f06f0
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
> powernow: PST:3 (@c00f0746)
> powernow:  cpuid: 0x7a0^Ifsb: 133^ImaxFID: 0x1a^Istartvid: 0x7
> powernow:    FID: 0x0 (11.0x [1459MHz])^IVID: 0xe (1.300V)
> powernow:    FID: 0x1 (11.5x [1525MHz])^IVID: 0xd (1.350V)
> powernow:    FID: 0x2 (12.0x [1592MHz])^IVID: 0xc (1.400V)
> powernow:    FID: 0x3 (12.5x [1658MHz])^IVID: 0xb (1.450V)
> powernow:    FID: 0x14 (13.0x [1724MHz])^IVID: 0xa (1.500V)
> powernow:    FID: 0x15 (13.5x [1791MHz])^IVID: 0x9 (1.550V)
> powernow:    FID: 0x18 (15.0x [1990MHz])^IVID: 0x8 (1.600V)
> powernow:    FID: 0x1a (16.0x [2122MHz])^IVID: 0x7 (1.650V)
> powernow: SGTC: 13333
> powernow: Minimum speed 1459 MHz. Maximum speed 2122 MHz.
> 
> with 2.6.9 is not 
> 
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: No PST tables match this cpuid (0x7a0)
> powernow: This is indicative of a broken BIOS.
> powernow: Trying ACPI perflib
> powernow: Minimum speed 298 MHz. Maximum speed 796 MHz.

Hi,
I saw something similar on my notebook. In my case when the notebook is
turned on while using battery BIOS sets CPU speed to a frequency lower
than the defaul (800MHz for me). It seems that powernow driver is
confused by the BIOS fiddling with CPU speed and fails to load. I had
the same symptoms: PST not found and wrong min/max frequencies.

Disabling "Automatic CPU power saving" (or something like that) in the
BIOS cures the problem for me. Note that this option do not affect power
management under linux (or windows), it just controls the CPU before a
real OS comes up.

Luca
-- 
Home: http://kronoz.cjb.net
La somma dell'intelligenza sulla terra e` una costante.
La popolazione e` in aumento.
