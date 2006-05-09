From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Pentium M 740 (Sonoma)
Date: Tue, 9 May 2006 10:56:44 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB600820976F@scsmsx403.amr.corp.intel.com>
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
To: Gianpaolo Lopresti <gianpaolo.lopresti@email.it>
Cc: cpufreq@lists.linux.org.uk

=20
Please try the latest kernel (2.6.16) with the config options I
mentioned below. With that speedstep-centrino driver should work on your
laptop, even without the entry for your CPU. Speedstep centrino driver
will magically get the information like the ones in the table below from
BIOS and use it.
=20
Even with the 2.6.13, if acpi-cpufreq is working fine on your laptop
means Enhanced Speedstep is working. It also changes the
frequency/voltage in the same manner as speedstep-centrino, but uses
slightly different mechanism to change the frequency. You should see
bunch of supported frequencies in
/sys/devices/system/cpu/cpu0/cpufreq/*.
=20
Again, both acpi-cpufreq and speedstep-centrino supports Enhanced
Speedstep. Only difference with acpi-cpufreq frequency transitions will
be slightly slower than speedstep-centrino (say 10uS to 100uS). But, in
normal system usage frequency is changed relatively infrequently, in
terms of seconds and this difference will not matter much.
=20
Thanks,
Venki


________________________________

	From: Gianpaolo Lopresti [mailto:gianpaolo.lopresti@email.it]=20
	Sent: Tuesday, May 09, 2006 10:29 AM
	To: Pallipadi, Venkatesh
	Cc: cpufreq@lists.linux.org.uk
	Subject: Re: Pentium M 740 (Sonoma)
=09
=09
	i have a 2.16.13 kernel, and i think that the follow is the
problem:
	/*speedstep-centrino.c*/
	enum {
	CPU_BANIAS,
	CPU_DOTHAN_A1,
	CPU_DOTHAN_A2,
	CPU_DOTHAN_B0,
	CPU_MP4HT_D0,
	CPU_MP4HT_E0,
	};
=09
	static const struct cpu_id cpu_ids[] =3D {
	[CPU_BANIAS] =3D { 6, 9, 5 },
	[CPU_DOTHAN_A1] =3D { 6, 13, 1 },
	[CPU_DOTHAN_A2] =3D { 6, 13, 2 },
	[CPU_DOTHAN_B0] =3D { 6, 13, 6 },
	[CPU_MP4HT_D0] =3D {15, 3, 4 },
	[CPU_MP4HT_E0] =3D {15, 4, 1 },
	};
	/*end*/
=09
	there is no my processor (6,13,8).
	the driver acpi-cpufreq works, but i think that with this driver
i cannot take advantage of speedstep technology... or not?
	thanks,=20
	Gianpi
=09
=09
	Pallipadi, Venkatesh ha scritto:=20

		Hi,
	=09
		Speedstep-centrino should get the frequency related
information from
		ACPI and should work on this processor. The hardcoded
tables in
		speedstep-centrino are only needed if the BIOS is buggy
and not
		providing ACPI related information or you cannot enable
ACPI on your
		laptop due to any other ACPI related bugs.
	=09
		I am assuming that you are using the latest base kernel.
Can you please
		try  having=20
		CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
		CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=3Dy
		CONFIG_ACPI_PROCESSOR=3Dy
	=09
		In your config and check whether speedstep/cpufreq works
on your laptop
		or not. If it does not, then we need to look at ACPI
information
		provided by the BIOS and table can be added only if the
ACPI method
		(which does not need any kernel source code change for
each new
		processor) does not work due to some bugs (BIOS or
ACPI).
	=09
		Thanks,
		Venki
	=09
		 =20

			-----Original Message-----
			From: cpufreq-bounces@lists.linux.org.uk=20
			[mailto:cpufreq-bounces@lists.linux.org.uk] On
Behalf Of=20
			Gianpaolo Lopresti
			Sent: Tuesday, May 09, 2006 3:19 AM
			To: cpufreq@lists.linux.org.uk
			Subject: Pentium M 740 (Sonoma)
		=09
			Hi,
			i'm Italian, and so sorry for my english...
			I have noted that in the speedstep-centrino.c
there is not the support
			for the pentium M 740 (Family 6, Model 13,
stepping 8), that is the
			centrino with 533Mhz FSB.
		=09
			I think that this is one of the most popular
centrino, because,
			practically at same price of a 400Mhz fsb
processor, you can have a
			533Mhz Processor.
		=09
			I wrote to make you known that, on Internet,
there are a lot of
			implementation of speedstep-centrino.c that
support this processor: one
			is at
http://pdis.rnw.nl/~hansl/linux/nc6230/speedstep-centrino.c
=09
<http://pdis.rnw.nl/%7Ehansl/linux/nc6230/speedstep-centrino.c>
<http://pdis.rnw.nl/%7Ehansl/linux/nc6230/speedstep-centrino.c>=20
			I found this link by the address:
=09
http://pdis.rnw.nl/~hansl/linux/nc6230/index_nc6230.html
=09
<http://pdis.rnw.nl/%7Ehansl/linux/nc6230/index_nc6230.html>
<http://pdis.rnw.nl/%7Ehansl/linux/nc6230/index_nc6230.html>=20
		=09
			I don't know if it work or not (i do not trust
unofficial versions...),
			but, if it works, it's possible that this
version will become an
			Official version (or that the 6,13,8 processor
will be supported by
			cpufreq)?
		=09
			Thanks for your attention,
			Gianpaolo Lopresti
		=09
		=09
		=09
		=09
			--
		=09
			Email.it, the professional e-mail, gratis per
te:=20
			http://www.email.it/f
		=09
		=09
		=09
			Sponsor:
		=09
			Prova GRATIS per 15 giorni! DVDNetRent e ricevi
a casa 3=20
			film. Puoi scegliere tra migliaia di titoli
		=09
			Clicca qui:
http://adv.email.it/cgi-bin/foclick.cgi?mid=3D4632&d=3D9-5
		=09
			_______________________________________________
			Cpufreq mailing list
			Cpufreq@lists.linux.org.uk
=09
http://lists.linux.org.uk/mailman/listinfo/cpufreq
		=09
			   =20

	=09
		 =20




	----
	Email.it, the professional e-mail, gratis per te:clicca=3D qui
=09
	Sponsor:
	Prova GRATIS per 15 giorni! DVDNetRent e ricevi a casa 3 film.
Puoi sceglie=3D re tra migliaia di titoli
	Clicca qui
=09
=09
