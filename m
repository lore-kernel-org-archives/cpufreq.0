From: Ian Campbell <icampbell@arcom.com>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Thu, 14 Jul 2005 15:11:33 +0100
Message-ID: <1121350294.10537.34.camel@icampbell-debian>
References: <1121341256.10537.12.camel@icampbell-debian>
	<42D6696E.4080505@lifl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <42D6696E.4080505@lifl.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@lifl.fr>
Cc: cpufreq@lists.linux.org.uk

On Thu, 2005-07-14 at 15:32 +0200, Eric Piel wrote:
> 14.07.2005 13:40, Ian Campbell wrote/a =E9crit:
> > Hi,=20
> Hello,
>=20
> I don't know so much about cpufreq, so only very few comments:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> > +++ 2.6/arch/arm/mach-pxa/cpu-pxa.c	2005-07-14 10:57:04.000000000 +0100
> > +
> > +static void pxa_select_freq_table(struct cpufreq_policy *policy,
> > +				  pxa_freqs_t ** settings,
> > +				  struct cpufreq_frequency_table **table)
> > +{
> > +	if (strcmp(policy->governor->name, "performance") =3D=3D 0) {
> > +		if (settings)
> > +			*settings =3D pxa255_run_freqs;
> > +		if (table)
> > +			*table =3D pxa255_run_freq_table;
> > +	} else {
> > +		if (settings)
> > +			*settings =3D pxa255_turbo_freqs;
> > +		if (table)
> > +			*table =3D pxa255_turbo_freq_table;
> > +	}
> > +}
> So your driver depends on a hard-coded name of a governor ? It seems=20
> suspicious...

I'm not entirely happy about this either, but let me explain...

The PXA255 has essentially two orthogonal sets of available frequencies,
and it is possible to get e.g. 400MHz using either one, but with
different power consumption vs performance trades.

One of the sets of frequencies is achieved by modifying the "run mode
multiplier" which costs power but gives best performance while the other
involves modifying the "turbo mode multiplier" which uses less power for
a given speed but at the cost of some performance.=20

So the code selects the run mode freqs for the performance governor but
turbo for the powersave governor + any others. I did it this way because
it is an embedded processor which often can run from a battery so I
figured it makes sense to select the best power consumption over
performance unless explicitly requested. I couldn't see another method
in the cpufreq framework to select between the two modes, I guess it
could be a command line or module parameter option or something.

> [snip]

Thanks for your other comments, I'll make those changes.

Ian.

--=20
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of=
 the addressee only and should not be disclosed to any other party. Unautho=
rised recipients are requested to preserve this confidentiality. Please adv=
ise the sender if the addressee is not resident at the receiving end.  Emai=
l to and from Arcom is automatically monitored for operational and lawful b=
usiness reasons.

This message has been virus scanned by MessageLabs.
