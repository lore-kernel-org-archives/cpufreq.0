From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: give the TSC a fair chance [Was: [PATCHES] cpufreq_get(),
	cpufreq->get()]
Date: Wed, 14 Apr 2004 20:54:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414185434.GB19921@dominikbrodowski.de>
References: <20040411215912.GA8160@dominikbrodowski.de>
	<20040412120422.GA7337@dominikbrodowski.de>
	<1081967060.4705.91.camel@cog.beaverton.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0403694074=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1081967060.4705.91.camel@cog.beaverton.ibm.com>
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


--===============0403694074==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2004 at 11:24:21AM -0700, john stultz wrote:
> On Mon, 2004-04-12 at 05:04, Dominik Brodowski wrote:
> > However, this patch has one slight chance for a bug: if lost_count reac=
hes
> > 50, a call to handle_cpufreq_delayed_work is scheduled, but does not ex=
ecute
> > until lost_count reaches 50 again [e.g. when no lost ticks are
> > detected at the next call, but on the next 50 consecutive calls...]. As
> > keventd runs at -10 priority I doubt this will happen under normal
> > circumstances, though.
>=20
> I'm not sure I follow this (lost_count =3D=3D 50) bit. You're trying to
> schedule work only when we've noticed we're missing exactly 50 ticks?

No, not when we're missing exactly 50 ticks, but when we've detected 50
consecutive times we're missing ticks. That's half of the amount needed
before TSC is disabled and should mean enough time for cpufreq even under
heavy load to execute a cpufreq_get() call.=20

> I'm not sure I understand the significance of that value.

It's not really significant, it should be less than what triggers
clock_fallback();
though. Note that it needs to be _one_ value instead of (lost_count > 50)
so that it doesn't get scheduled more than once. As lost_count is only
inc'ed, this shouldn't be a problem.

	Dominik

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAfYjqZ8MDCHJbN8YRAl2TAJ9zoz4FW93URcgUojGPzqaacjipJACePVHQ
Jut9ie4JmrhACUnFd0r1cJ8=
=xWXs
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--


--===============0403694074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0403694074==--

