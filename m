From: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Subject: Re: Is e_powersaver safe to auto-load?
Date: Sun, 12 Feb 2012 12:30:54 +0000
Message-ID: <4F37B0FE.20600@interia.pl>
References: <1329003190.325.78.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1329003190.325.78.camel@deadeye>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1329049808;
	bh=YlybxSVzhcqofQmICdxkik9DrGaNVm8FRYzFimQoONk=;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:CC:
	 Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Interia-Antivirus;
	b=dOVfyvbvHadZtWKvvsofMzc+CPJa0rN41GU1Dq7xQTgl1zO8jX9x7YPPoeKQl5eT0
	 AXP0fmhjORGBs9LTxeRY429dXSTKOShm7G2Q8/0IO6zdng18qHZGH/yGsum7YFfsUa
	 PpQN+bKR5dmSdMiX2QCCnOjNG6IG4a9ccho7RXPA=
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
To best of my knowledge driver is safe. It is/was safe to use it on all=
 C7 and
Nano processors. Both C7 and Nano don't allow to set frequency or volta=
ge
from outside the processor specs. Nano doesn't allow to set voltage out=
side
the specs of the given frequency. It will reduce frequency if voltage i=
s too low.
But it was unsafe to use it on systems using faster then neccesary proc=
essor
running on lower speed. Which means systems using 1GHz CPu running all
the time on 400MHz due to lack of neccesary heatsink. It should be safe
now because driver is respecting BIOS frequency limit.
But to be honest it isn't needed anymore. Only people with C7-A process=
ors
may need it because their BIOS doesn't have ACPI P-States tables or the=
se
tables are invalid. Some people with C7-D without "paralax " may need i=
t
because it allows now to set lower voltage for the maximum frequency
(most of VIA processors were 1,6GHz reduced to lower frequency and high=
er
voltage after quality testing). Otherwise it is to no use as "paralax" =
processors
will use values set by driver as a guide because P-states tables are ha=
rdcoded
into them. And nobody cares if driver is using hardware or SMI as long =
it is
doing it's job.
So in my opinion this driver should not be autoloaded. Only "acpi p-sta=
tes"
driver can be autoloaded and if it fails it should be user responsibili=
ty to
modprobe "e_powersaver".

Sorry for bad english.
Rafa=C5=82

