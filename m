From: Carl Thompson <cet@carlthompson.net>
Subject: Re: PST tables and Sonys Bios
Date: Thu, 17 Jul 2003 09:15:08 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1058458508.bd23a8ad4d31b@carlthompson.net>
References: <3F1650C3.1030903@searchbroker.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <3F1650C3.1030903@searchbroker.de>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>
Cc: cpufreq@www.linux.org.uk

My Sony Vaios (I no longer have them) both were in the FXA series (same as
the FX series) and both had completely correct Powernow tables for the
Mobile Athlon 4 part for both of the BIOSs you mentioned.

Fact 1: the PSTs weren't broken at all in any BIOS for my Mobile Athlon 4
CPUs.

Fact 2: the PSTs for some models of Mobile Athlon XP started off kinda
"broken" and got more "broken" with the lastest BIOS.

Fact 3: that BIOS update supposedly fixes several lockup problems due to
"system conflicts" according to the docs.

Conclusion: my guess is that Sony purposely bumped up the voltage for _some_
CPUs because they were having system stability problems related to voltage
scaling with them.  It's possible that the PSTs are like this to actually
get your machine to run properly.

You might want to consider that the PST as it is in the BIOS might be
required to keep your machine from locking up occasionally.  Also rememeber
that with those PSTs CPUFreq will still scale the CPU speed and save you
power, it just won't scale voltage too.  Maybe getting the extra few
minutes of battery power that scaling the voltage might give you isn't
worth the hassle?

Of course, on those Sonys, the battery life is so crappy that you may be
willing to put up with some system instability to go longer...

It's also possible that the problem may be Windows specific and Linux /
CPUFreq work fine scaling the voltage of your processor.

Just some food for though,
Carl Thompson

Quoting Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>:

> Hi developer and user,
>
> Sony Bios (and the PST tables) maybe don't like the powernow feature,
> because yesterday I have updated my FX705 from Bios (R0117K5) to the
> latest one (R0121K5) and then I dump all PST tables (with powernow
> infos) and found that they do not fix the "PST:26" for my CPU (all VIDs
> are 1.3V), no they change the correct (?) "PST:27" (maybe for the 1600+)
> from:
>
>  PST:27 (@0x401906ce)
>   cpuid: 0x780    fsb: 100        maxFID: 0x16    startvid: 0x11
>   num of p states in this table: 6
>     FID: 0x4 (5.0x [500MHz])    VID: 0x19 (1.050V)
>     FID: 0x6 (6.0x [600MHz])    VID: 0x19 (1.050V)
>     FID: 0x8 (7.0x [700MHz])    VID: 0x19 (1.050V)
>     FID: 0xc (9.0x [900MHz])    VID: 0x19 (1.050V)
>     FID: 0x0 (11.0x [1100MHz])  VID: 0x15 (1.150V)
>     FID: 0x16 (14.0x [1400MHz]) VID: 0xe (1.300V)
>
> to:
>
>  PST:27 (@0x401906be)
>   cpuid: 0x780    fsb: 100        maxFID: 0x16    startvid: 0xe
>   num of p states in this table: 6
>     FID: 0x4 (5.0x [500MHz])    VID: 0xe (1.300V)
>     FID: 0x6 (6.0x [600MHz])    VID: 0xe (1.300V)
>     FID: 0xa (8.0x [800MHz])    VID: 0xe (1.300V)
>     FID: 0xe (10.0x [1000MHz])  VID: 0xe (1.300V)
>     FID: 0x2 (12.0x [1200MHz])  VID: 0xe (1.300V)
>     FID: 0x16 (14.0x [1400MHz]) VID: 0xe (1.300V)
>
> Now the VIDs for this cpu are also all 1.3V :-(
>
> Is there a chance to include a fix in the powernow-k7 code "for broken
> PST tables" or should everybody make it's own patch like "Luigi Belli"
> in "Acer Aspire 1300 buggy BIOS - hardcoded patch"
> (http://www.linux.org.uk/mailman/private/cpufreq/2003-June/002171.html)?
>
> Ciao Lars
>
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
>
