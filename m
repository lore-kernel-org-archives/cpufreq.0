From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 14:47:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414124717.GD8953@poupinou.org>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
	<20040414122321.GH24970@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414122321.GH24970@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 01:23:22PM +0100, Dave Jones wrote:
> On Wed, Apr 14, 2004 at 02:18:57PM +0200, Bruno Ducrot wrote:
>  > Already?  Thanks!
>  > I actually wanted to submit also the ACPI integration...
> 
> Ok, I'll look at folding that in too after lunch.
>  
>  > Warning: it will only half work on the ACER Aspire, though: there is
>  > no pstate in the DSDT corresponding to the max frequency...
>  > I'm looking how to handle that correctly, probably at the init stage,
>  > if the max frequency is not given, then add it to powernow_table.  It's
>  > really ugly, but I don't know how to make that OK.
>  > Suggestion is of course welcome..
> 
> Blacklist its BIOS with DMI tables, and adjust accordingly?

Yep.  Patch below (or I can send you the dmi output privately if you
prefer).

The machine is an ACER Aspire, look at:
http://bugzilla.kernel.org/show_bug.cgi?id=2025

> Is it fixed maybe in a BIOS update ?

I don't think so.  Advice already done, don't know if the owner have
done that though.

> 
>  > * Integrate acpi perflib from Dominik.
>  > * Use acpi if the PST tables are known to be broken (ASUS Aspire match one PST,
>  >   but give brain damaged values), or use ACPI if no PST found.
> 
> Was that the one that had every entry exactly the same ?

It give:
powernow:  cpuid: 0x781 fsb: 133        maxFID: 0x1     startvid: 0xb
powernow:    FID: 0x4 (5.0x [665MHz])   VID: 0xc (1.400V)
powernow:    FID: 0x6 (6.0x [798MHz])   VID: 0xc (1.400V)
powernow:    FID: 0x8 (7.0x [931MHz])   VID: 0xc (1.400V)
powernow:    FID: 0x9 (7.5x [997MHz])   VID: 0xc (1.400V)
powernow:    FID: 0x9 (7.5x [997MHz])   VID: 0xc (1.400V)

Whereas actually it's a mobile (startvid is 0xb.  So, voltage can be
scaled).
And there is 'only' two entries with same values.

With ACPI, (not tested yet) it should give that:

FID: 0xd (9.5x [1263.500MHz]    VID: 0xc (1.400mV)
FID: 0xa (8.0x [1064.000MHz]    VID: 0xd (1.350mV)
FID: 0x8 (7.0x [931.000MHz]    VID: 0xe (1.300mV)
FID: 0x6 (6.0x [798.000MHz]    VID: 0x11 (1.250mV)
FID: 0x4 (5.0x [665.000MHz]    VID: 0x13 (1.200mV)

It's better, but max still not here.

--- linux-dj-cpufreq/arch/i386/kernel/dmi_scan.c	2004/04/14 12:28:28	1.1
+++ linux-dj-cpufreq/arch/i386/kernel/dmi_scan.c	2004/04/14 12:29:42
@@ -921,6 +921,12 @@ static __initdata struct dmi_blacklist d
 			NO_MATCH, NO_MATCH,
 			} },
 
+	{ acer_cpufreq_pst, "Acer Aspire", {
+			MATCH(DMI_SYS_VENDOR, "Insyde Software"),
+			MATCH(DMI_BIOS_VERSION, "3A23"),
+			NO_MATCH, NO_MATCH,
+			} },
+
 #ifdef	CONFIG_ACPI_BOOT
 	/*
 	 * If your system is blacklisted here, but you find that acpi=force



-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
