From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Thu, 10 Jun 2004 10:30:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610083038.GA18693@dominikbrodowski.de>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1711160521=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <40C7AF6C.1080408@cern.ch>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: holbling@cpt.univ-mrs.fr, davej@codemonkey.org.uk
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============1711160521==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> i also wonder about one thing, maybe you can help me on that. with the=20
> old speedstep driver,
Do you mean speedstep-smi? Or what driver did you use?

> i would have occational hard freezups of my=20
> machine. this seems to be gone (just experimental evidence, since i=20
> didn't have one in a few days now where before they occured about=20
> hourly). so my guess is that something in this patch must have corrected=
=20
> it. since my machine just has one physical cpu, i really don't=20
> understand what went wrong before.  do you have any idea on that?

Depends on the driver you were using :-)

> as far as i understand, the frequencies are always the same, because the=
=20
> siblings are explicitly notified. about the 2 different governors, the=20
> same problem exists in the current p4-clockmod.
>=20
> >I'll try to fix it in the 2.6.8 timeframe...
> >=20
> >
> you mean that a change of governors gets communicated to the siblings?

I mean that only one instance of a governor can be loaded on one physical
CPU. The same problem exists in current p4-clockmod and was a mis-design of
the cpufreq core [by me...], so it needs to be fixed quite soon.

Both patches look good to me -- Dave, could you apply them, please?

Thanks,
	Dominik

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAyBwuZ8MDCHJbN8YRAmHFAJ9QdWkhz4q+OXHwmh23fYy8vsjhfQCgopAi
FcyAUbpo8slbWtLFrccQfiY=
=yndi
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--


--===============1711160521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1711160521==--

