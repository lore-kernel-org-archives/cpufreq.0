From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 17:11:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040416151135.GV8953@poupinou.org>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
	<c5osds$fed$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <c5osds$fed$1@sea.gmane.org>
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
To: jy <jy454@yahoo.fr>
Cc: cpufreq@www.linux.org.uk

On Fri, Apr 16, 2004 at 05:00:10PM +0200, jy wrote:
> Bruno Ducrot wrote:
> >On Fri, Apr 16, 2004 at 12:00:58AM +0200, jy wrote:
> >
> >>I have Acer Aspire 1357LMi laptop with AMD Athlon XP 3000+ and of course 
> >>cpufreq don't work
> >>
> >
> >
> >Could you please try latest cpufreq?  it's at
> >http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/
> >
> >with CONFIG_ACPI_PROCESSOR=YES ?
> 
> 
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: FSB:  48.270 MHz
> powernow: Found PSB header at c00f06f0
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
> powernow: No PST tables match this cpuid (0x7a0)
> powernow: This is indicative of a broken BIOS.
> powernow: Trying ACPI perflib
> powernow: acpi:  P0: 2200 MHz 75000 mW 125 uS control 00d058fb SGTC 13334
> powernow:    FID: 0x1b (16.5x [796MHz])	VID: 0x7 (1.650V)
> powernow: acpi:  P1: 1800 MHz 55000 mW 125 uS control 00d05935 SGTC 13334
> powernow:    FID: 0x15 (13.5x [651MHz])	VID: 0x9 (1.550V)
> powernow: acpi:  P2: 1467 MHz 32000 mW 125 uS control 00d059c0 SGTC 13334
> powernow:    FID: 0x0 (11.0x [530MHz])	VID: 0xe (1.300V)
> powernow: acpi:  P3: 1064 MHz 30000 mW 125 uS control 00d059ca SGTC 13334
> powernow:    FID: 0xa (8.0x [386MHz])	VID: 0xe (1.300V)
> powernow: acpi:  P4: 800 MHz 26000 mW 125 uS control 00d059c6 SGTC 13334
> powernow:    FID: 0x6 (6.0x [289MHz])	VID: 0xe (1.300V)
> powernow: Minimum speed 289 MHz. Maximum speed 796 MHz.
> 
> ------
> 
> x86info v1.12b.  Dave Jones 2001-2003
> Feedback to <davej@redhat.com>.
> 
> Need to be root to use specified options.
> Found 1 CPU
> [...]
> PowerNOW! Technology information
> Available features:
> 	Temperature sensing diode present.
> 	Bus divisor control
> 	Voltage ID control
> 
> Connector type: Socket A (462 Pin PGA)
> 
> 
> 2.2Ghz processor (estimate).
> 
> 
> Thanks, it seems to work according to x86info. But the fsb is wrong.

Indeed.  Could you please post the full dmesg please?

> >I would like also that you test dump_psb.c
> >
> >wget http://poup.poupinou.org/cpufreq/powernow-k7/dump_psb.c
> >gcc -O2 -Wall dump_psb.c -o dump_psb
> >sudo ./dump_psb 9
> >
> >in order to check if that model actually do have more PSTs.

Ok, that one don't have more PSTs.  Thanks for your report.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
