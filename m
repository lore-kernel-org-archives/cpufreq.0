From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 20:20:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040416182013.GZ8953@poupinou.org>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
	<c5osds$fed$1@sea.gmane.org> <20040416151135.GV8953@poupinou.org>
	<c5otiu$ime$1@sea.gmane.org> <20040416152432.GW8953@poupinou.org>
	<c5p3e0$6js$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <c5p3e0$6js$1@sea.gmane.org>
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

On Fri, Apr 16, 2004 at 06:59:43PM +0200, jy wrote:
> Bruno Ducrot wrote:
> >On Fri, Apr 16, 2004 at 05:19:56PM +0200, jy wrote:
> >
> >Ok.  I expected that BIOS will put the frequency at max at POST stage.
> >That is not true for your laptop indeed.  Can you try that patch:
> 
> Yes, when I bought the laptop the speed was always 800Mhz without any 
> powernow driver in windows. Maybe the bios here is useful  : 
> ftp://ftp.support.acer-euro.com/notebook/aspire_1350/bios/zp13a18.zip
> the changelog in the zip talks about a low speed patch

I don't know if that bios will help you.  Latest bios for Acer Aspire
1310 do give weird result both with PSB/PST method and ACPI (ACPI is
less buggy)..

See http://bugme.osdl.org/show_bug.cgi?id=2025

> with the patch :
> 
> Linux version 2.6.5 (root@jy-portable) (version gcc 3.3.3 (Debian 
> 20040401)) #1 SMP Fri Apr 16 18:00:18 CEST 2004
                ^^^

> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: FSB: 132.755 MHz
> powernow: Found PSB header at c00f06f0
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
> powernow: No PST tables match this cpuid (0x7a0)
> powernow: This is indicative of a broken BIOS.
> powernow: Trying ACPI perflib
> powernow: acpi:  P0: 2200 MHz 75000 mW 125 uS control 00d058fb SGTC 13334
> powernow:    FID: 0x1b (16.5x [2190MHz])	VID: 0x7 (1.650V)
> powernow: acpi:  P1: 1800 MHz 55000 mW 125 uS control 00d05935 SGTC 13334
> powernow:    FID: 0x15 (13.5x [1792MHz])	VID: 0x9 (1.550V)
> powernow: acpi:  P2: 1467 MHz 32000 mW 125 uS control 00d059c0 SGTC 13334
> powernow:    FID: 0x0 (11.0x [1460MHz])	VID: 0xe (1.300V)
> powernow: acpi:  P3: 1064 MHz 30000 mW 125 uS control 00d059ca SGTC 13334
> powernow:    FID: 0xa (8.0x [1062MHz])	VID: 0xe (1.300V)
> powernow: acpi:  P4: 800 MHz 26000 mW 125 uS control 00d059c6 SGTC 13334
> powernow:    FID: 0x6 (6.0x [796MHz])	VID: 0xe (1.300V)
> powernow: Minimum speed 796 MHz. Maximum speed 2190 MHz.
> Losing too many ticks!
> TSC cannot be used as a timesource.  <4>Possible reasons for this are:
>   You're running with Speedstep,
>   You don't have DMA enabled for your hard disk (see hdparm),
>   Incorrect TSC synchronization on an SMP system (see dmesg).
> Falling back to a sane timesource now.

Try with UP kernel.  At that time, cpufreq break TSC timer on SMP
kernels.  Or alternatively use the ACPI-timer.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
