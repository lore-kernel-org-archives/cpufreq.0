From: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Subject: Re: Is e_powersaver safe to auto-load?
Date: Wed, 22 Feb 2012 01:13:39 +0000
Message-ID: <4F444143.6000505@interia.pl>
References: <1329003190.325.78.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1329003190.325.78.camel@deadeye>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1329873161;
	bh=fHhDl2G8qGD1t6L7oe2FWeBSnSam0mrbBihEbyxAIwU=;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:CC:
	 Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Interia-Antivirus;
	b=MOqpfFrlrIt35aZKmdPzIlw2LvYFmQAjsTHzhB+as8ncszWzkVtH8m/XJSjtn/YCe
	 AlfTvSsyqrNDWLCP/tkHTLe5UhDRMcXoVkyUa19+/4HsdMbzeGxpbLOLtMM4Bl1OtT
	 ++mAbtm0rdtckDHLEwcOXiJuG2z8Ot8EdJexkXuc=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Andi Kleen <ak@linux.intel.com>


> The e_powersaver driver comes with a dire warning in Kconfig help:
>
>      VIA C7 Enhanced PowerSaver (DANGEROUS)
>
>      This adds the CPUFreq driver for VIA C7 processors.  However, th=
is driver
>      does not have any safeguards to prevent operating the CPU out of=
 spec
>      and is thus considered dangerous.  Please use the regular ACPI c=
pufreq
>      driver, enabled by CONFIG_X86_ACPI_CPUFREQ.
>
> Following the bug report<http://bugs.debian.org/566208>, Debian's
> cpufrequtils init script was changed to stop loading it.  The driver =
was
> later disabled in Debian kernel configurations.  Rafa=C5=82 appears t=
o have
> made it somewhat safer since then, but the help text has not been
> changed.
>
> Since commit fa8031aefec0cf7ea6c2387c93610d99d9659aa2 ('cpufreq: Add
> support for x86 cpuinfo auto loading v4') the driver will be auto-loa=
ded
> on some systems.  If it is still dangerous then it should surely not =
be
> auto-loaded.  But if it is now believed to be safe then the help text
> should be updated to say so.
>
> Ben.
>
Hello again,

Mainboard in question is VIA Epia SN10000EG rev. A1. I have access to i=
t
now. I've tested it briefly for a couple of hours and it seems to work =
fine with
3.2 kernel. I will let you know if more extensive testing will give dif=
ferent result.

Rafa=C5=82

eps: Detected VIA Model A C7
eps: Current voltage =3D 1004mV
eps: Current multiplier =3D 10
eps: Highest voltage =3D 1004mV
eps: Highest multiplier =3D 10
eps: Lowest voltage =3D 956mV
eps: Lowest multiplier =3D 8
eps: ACPI limit 1.0GHz

