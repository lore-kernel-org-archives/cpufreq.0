From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Acer Aspire  1350 broken PST
Date: Sat, 17 Apr 2004 18:58:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040417165838.GA7553@dominikbrodowski.de>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
	<c5osds$fed$1@sea.gmane.org> <20040416151135.GV8953@poupinou.org>
	<c5otiu$ime$1@sea.gmane.org> <20040416152432.GW8953@poupinou.org>
	<c5p3e0$6js$1@sea.gmane.org> <20040416182013.GZ8953@poupinou.org>
	<20040417093220.GA7975@dominikbrodowski.de>
	<20040417130021.GB8953@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1325565792=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040417130021.GB8953@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: jy <jy454@yahoo.fr>, cpufreq@www.linux.org.uk


--===============1325565792==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2004 at 03:00:21PM +0200, Bruno Ducrot wrote:
> On Sat, Apr 17, 2004 at 11:32:20AM +0200, Dominik Brodowski wrote:
> > On Fri, Apr 16, 2004 at 08:20:13PM +0200, Bruno Ducrot wrote:
> > > Try with UP kernel.  At that time, cpufreq break TSC timer on SMP
> > > kernels.  Or alternatively use the ACPI-timer.
> >=20
> > Why is TSC timer on SMP broken, in your opinion? AFAICS, the problem se=
en on
> > this machine is caused because of actual cpu frequency !=3D frequency t=
he
> > cpufreq core thinks the CPU is in.
> >=20
>=20
> It's broken if CONFIG_SMP because set_cyc2ns_scale() is not called
> in the time_notifer() in timer_tsc.c (and anyway cpu_khz can't be
> scaled in an easy fashion if SMP).
> Therefore, cyc2ns_scale is not updated, and cycles_2_ns() will give
> false values.=20

Indeed. Will try to prepare a patch to make cycles_2_ns handle different=20
CPU speeds correctly -- it's needed for different-speed-SMP as well.[*]

	Dominik

[*] though I do not know whether the timing core would be able to handle it
generally...

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAgWI+Z8MDCHJbN8YRAsZhAKCgEIAjAvRFpKKqIIVkaLbQYGMMYACfU2el
AxBGgo8HQj/cyMYA0oo+PNM=
=iMag
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--


--===============1325565792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1325565792==--

