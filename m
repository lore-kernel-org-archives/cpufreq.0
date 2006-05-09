From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Pentium M 740 (Sonoma)
Date: Tue, 9 May 2006 07:50:49 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6008209246@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Gianpaolo Lopresti <gianpaolo.lopresti@email.it>, cpufreq@lists.linux.org.uk


Hi,

Speedstep-centrino should get the frequency related information from
ACPI and should work on this processor. The hardcoded tables in
speedstep-centrino are only needed if the BIOS is buggy and not
providing ACPI related information or you cannot enable ACPI on your
laptop due to any other ACPI related bugs.

I am assuming that you are using the latest base kernel. Can you please
try  having=20
CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=3Dy
CONFIG_ACPI_PROCESSOR=3Dy

In your config and check whether speedstep/cpufreq works on your laptop
or not. If it does not, then we need to look at ACPI information
provided by the BIOS and table can be added only if the ACPI method
(which does not need any kernel source code change for each new
processor) does not work due to some bugs (BIOS or ACPI).

Thanks,
Venki

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Gianpaolo Lopresti
>Sent: Tuesday, May 09, 2006 3:19 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Pentium M 740 (Sonoma)
>
>Hi,
>i'm Italian, and so sorry for my english...
>I have noted that in the speedstep-centrino.c there is not the support
>for the pentium M 740 (Family 6, Model 13, stepping 8), that is the
>centrino with 533Mhz FSB.
>
>I think that this is one of the most popular centrino, because,
>practically at same price of a 400Mhz fsb processor, you can have a
>533Mhz Processor.
>
>I wrote to make you known that, on Internet, there are a lot of
>implementation of speedstep-centrino.c that support this processor: one
>is at http://pdis.rnw.nl/~hansl/linux/nc6230/speedstep-centrino.c
><http://pdis.rnw.nl/%7Ehansl/linux/nc6230/speedstep-centrino.c>
>I found this link by the address:
>http://pdis.rnw.nl/~hansl/linux/nc6230/index_nc6230.html
><http://pdis.rnw.nl/%7Ehansl/linux/nc6230/index_nc6230.html>
>
>I don't know if it work or not (i do not trust unofficial versions...),
>but, if it works, it's possible that this version will become an
>Official version (or that the 6,13,8 processor will be supported by
>cpufreq)?
>
>Thanks for your attention,
>Gianpaolo Lopresti
>=20
>
>=20
>
> --
>
> Email.it, the professional e-mail, gratis per te:=20
>http://www.email.it/f
>
>=20
>
> Sponsor:
>
> Prova GRATIS per 15 giorni! DVDNetRent e ricevi a casa 3=20
>film. Puoi scegliere tra migliaia di titoli
>
> Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D4632&d=3D9-5
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
