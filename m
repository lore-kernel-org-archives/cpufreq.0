From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: supported x86 processors?
Date: Fri, 12 Mar 2004 15:41:24 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040312144124.GC4813@dominikbrodowski.de>
References: <200402292003.i1TK3VKw012139@localhost.localdomain>
	<20040301155817.GV2869@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1034463839=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040301155817.GV2869@poupinou.org>
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
Cc: cpufreq@www.linux.org.uk, Franco <net.surfer@tiscali.it>


--===============1034463839==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Small addendum to Bruno Ducrot's message:

Intel Pentium M processors (Centrion) seem to be supported quite well,
AFAICS.

	Dominik

On Mon, Mar 01, 2004 at 04:58:17PM +0100, Bruno Ducrot wrote:
>
> For those I know the most, powernow are well supported (k6 and k8.
> There are trouble to get for everyone documentations for the k7, at
> least for me, but that one is now ok).
> Speedstep are well supported also, but not on all hardware configurations.
> If you have some VIA or SiS southbridges, this won't unlikely work.
> On those systems, though, it may be possible to get it working with
> the generic acpi io driver (not on all old PIII processors though, but
> perhaps on recent PIIIs and P4m, no warranties, though).
>=20
> For the others, I don't know but believe that all VIA C3 should be
> OK (at least on near future).
>=20
> Note that some driver do not support voltage scaling like the
> p4-mod (clock modulation for the p4 in general) or the gx-suspmod
> (geode family and clones) and then those processors should be avoided
> for pure power managements applications.  You may take a look to
> arch/i386/kernel/cpu/cpufreq/ for all the drivers currently supported.
>=20
> Cheers,
>=20
> --=20
> Bruno Ducrot
>=20
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUcwUZ8MDCHJbN8YRAhFRAJ43JgaK8p3xRH2S5BmeZj6QHJ0qcgCdEM9K
d0kuUjfRXuaBMFYaF6fT4IY=
=X/rF
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--


--===============1034463839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1034463839==--

