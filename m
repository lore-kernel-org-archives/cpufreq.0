From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: ondemand improvements, new 'conservative' governor
Date: Mon, 17 Jan 2005 09:55:17 +0000
Message-ID: <20050117095517.GA4106@inskipp>
References: <20050116225136.GA28981@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0725886699=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
In-Reply-To: <20050116225136.GA28981@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@lists.linux.org.uk


--===============0725886699==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dominik,

On Jan 16, Dominik Brodowski wrote:
> Hi Alex, Venki,
>=20
> IIRC you (Alex) wrote a few improvements to the ondemand governor -- and
> IIRC they aren't all merged yet, as a few issues were still left? Also,
> what's the status of your 'conservative' governor. Also IIRC it was missi=
ng
> some improvements made to the ondeamnd governor in the meantime.
>=20
There were some improvements that I had finished porting over however then=
=20
for some reason it just stopped working.  Although the module worked and di=
d=20
not kill the machine, regardless of the load it never increased the cpufreq=
=2E=20
:(

I was going to fix it once I had put back in some debugging information=20
(probably that 'evil' hack I tried to disguise as debugging which you all s=
aw=20
through :)  Also I thought of a nicer way to actually store the 'desired'=
=20
cpufreq without making it global which I was going to add.

I am free this weekend, girlfriend is away so I do not have to keep her=20
entertained which means some quality geek time.

I would of done it earlier but as interest never seemed to go beyond a few
friends of mine and one or two people on the mailing list I did not have
people poking me into action; however I guess that happens with every patch.

I'll speak to you later this week, I would do it midweek but I'm looking fo=
r=20
a new flat

Cheers

Alex

> Thanks,
> 	Dominik

--=20
 _________________________________________=20
/ What you don't know won't help you much \
| either.                                 |
|                                         |
\ -- D. Bennett                           /
 -----------------------------------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB64uFNv5Ugh/sRBYRAszeAJ9FDyd0bXAyDrfeFPyCV0ClcQMDkgCcDqE5
GoRjNU2lubJZ6oxVmWJpj+4=
=BY1s
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--


--===============0725886699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0725886699==--

