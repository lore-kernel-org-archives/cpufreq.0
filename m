From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 10:27:56 +0000
Message-ID: <20050221102756.GA4404@inskipp>
References: <20050220131518.GB4495@inskipp> <4218B768.8020401@tremplin-utc.net>
	<4219B603.8050403@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0763680351=="
In-Reply-To: <4219B603.8050403@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.de


--===============0763680351==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 21, Eric Piel wrote:
>
> Here is the patch, it does exactly the same functionality but it's=20
> completly static and therefore much smaller. Just tested on my computer,=
=20
> it does the trick.
>
I'm happy for this to go ahead as I will want it on always by default,=20
however you pretty much kill the folk who prefer to 'nice' tasks to prevent=
=20
interuption to other applications rather than using it to say "I do not car=
e=20
how long this task takes".

I know on our proxy server there are a few rebuilds which we run at a nice'd
level, not because we do not care how long they take (we want the rebuilds =
to
finish as soon as possible) but rather so that squid's performance is not
affected.

Cheers

Alex
=20
> Eric
> --
> Avoid the cpufreq ondemand governor to count the nice'd tasks as load=20
> for the cpu.
>=20
>  cpufreq_ondemand.c |   17 ++++++++++-------
>  1 files changed, 10 insertions(+), 7 deletions(-)
>=20
> Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
> --

--=20
 _______________________________________=20
/ You can drive a horse to water, but a \
\ pencil must be lead.                  /
 ---------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCGbesNv5Ugh/sRBYRAsgPAJ983VALeZDiGE9suVTBv8g1vBF0ywCdF/PI
WSw7++62kbhiQjZdnU59OcY=
=csSS
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


--===============0763680351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0763680351==--

