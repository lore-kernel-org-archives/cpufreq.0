From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: give the TSC a fair chance [Was: [PATCHES] cpufreq_get(),
	cpufreq->get()]
Date: Wed, 14 Apr 2004 22:57:32 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414205732.GA7230@dominikbrodowski.de>
References: <20040411215912.GA8160@dominikbrodowski.de>
	<20040412120422.GA7337@dominikbrodowski.de>
	<1081967060.4705.91.camel@cog.beaverton.ibm.com>
	<20040414185434.GB19921@dominikbrodowski.de>
	<1081973006.4705.116.camel@cog.beaverton.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1038824548=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1081973006.4705.116.camel@cog.beaverton.ibm.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: john stultz <johnstul@us.ibm.com>
Cc: cpufreq@www.linux.org.uk


--===============1038824548==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2004 at 01:03:27PM -0700, john stultz wrote:
> On Wed, 2004-04-14 at 11:54, Dominik Brodowski wrote:
> > On Wed, Apr 14, 2004 at 11:24:21AM -0700, john stultz wrote:
> > > On Mon, 2004-04-12 at 05:04, Dominik Brodowski wrote:
> > > > However, this patch has one slight chance for a bug: if lost_count =
reaches
> > > > 50, a call to handle_cpufreq_delayed_work is scheduled, but does no=
t execute
> > > > until lost_count reaches 50 again [e.g. when no lost ticks are
> > > > detected at the next call, but on the next 50 consecutive calls...]=
=2E As
> > > > keventd runs at -10 priority I doubt this will happen under normal
> > > > circumstances, though.
> > >=20
> > > I'm not sure I follow this (lost_count =3D=3D 50) bit. You're trying =
to
> > > schedule work only when we've noticed we're missing exactly 50 ticks?
> >=20
> > No, not when we're missing exactly 50 ticks, but when we've detected 50
> > consecutive times we're missing ticks. That's half of the amount needed
> > before TSC is disabled and should mean enough time for cpufreq even und=
er
> > heavy load to execute a cpufreq_get() call.=20
>=20
> Ok! Got it. Yea, in that case the patch looks fine.

Once 2.6.6 is out, I'll try to push it upstream (Dave -> Andrew -> Linus)

> As for the bug you
> mentioned, I'm not sure I understand how after you've scheduled=20
> cpufreq_delayed_get_work() to run it wouldn't run?=20

It would run, but too late. See below.

> So 50 consecutive interrupts occur where we notice we missed ticks, at
> this point we schedule the function. If the next tick we don't notice
> lost interrupts, why would the function not execute?

The following must happen:
50 consecutive interrupts with missed ticks occur
-> handle_cpufreq_get_delayed_work() is scheduled
0 to 50 more consecutive interrupts with missed ticks must occur,
then one or more interrupts with zero or one missed ticks so that lost_count
is reset to zero, and then
50 consecutive interrupts with missed ticks again.
_AND_ since the scheduling of handle_cpufreq_get_delayed_work() above
this handler running at -10 priority must not have been called =3D=3D> so=
=20
it's really a very unlikely situation.

	Dominik

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAfaW8Z8MDCHJbN8YRAkdcAJ4i6L6XdSTyD0UH/XT80eB1FWKevgCfdLVA
MHFhVqeXBfl+djCBAs+dXuA=
=V5vr
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--


--===============1038824548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1038824548==--

