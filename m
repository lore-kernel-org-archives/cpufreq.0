From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep capability checks
Date: Tue, 16 Mar 2004 17:00:43 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040316160043.GB7322@dominikbrodowski.de>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315210950.GC15243@redhat.com>
	<20040316073847.GA7597@dominikbrodowski.de>
	<20040316130114.GA13713@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0513731816=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040316130114.GA13713@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Arjan van de Ven <arjanv@redhat.com>, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk


--===============0513731816==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2004 at 01:01:14PM +0000, Dave Jones wrote:
> On Tue, Mar 16, 2004 at 08:38:47AM +0100, Dominik Brodowski wrote:
>=20
>  > So, Anders' CPU reports itself to be non-SpeedStep-capable. However,
>  > SpeedStep runs fine on his CPU. We can't enable SpeedStep on all CPUs =
[even
>  > of the same stepping (model/brand are the same anyway)] as we don't kn=
ow if
>  > all of them work fine if running SpeedStep on them -- or if it causes
>  > (permanent) hardware failure! Some, who know it works from running a
>  > different OS, and possibly a specific vendor-provided driver on their
>  > notebook, might want to skip this test and try out their luck. But the=
n they
>  > know what they're doing, and that they're risking their own hardware.
>=20
> We've already seen quite a few confused users who thought that throttling=
 =3D=3D speedstep.
> This sounds like handing someone a gun and saying 'point it at your head,
> pull the trigger, it might miss'.

Maybe the help text should be clarified a bit?

>  > A few SpeedStep-capable systems don't perform according to specificati=
on: the
>  > CPUID and/or some MSRs don't tell us the CPU is SpeedStep capable even=
 though
>  > it definitely is.
>=20
> Is there nothing in the errata documents about this ?

Unfortunately, no AFAIK.

>  > Allow a relaxed checking for one such issue by a module=20
>  > parameter only available if a config option is turned on. This is done=
 to=20
>  > avoid the risk of doing invalid speedstep instructions on systems whic=
h do=20
>  > not support it, and which might even lead to (hardware) failure.
>=20
> I'd merge this really as a last resort, and it's beginning to sound like
> we don't really have any options (other than not support those broken box=
es). Ugh.

I'd much prefer if the check posted on Intel's website were accurate, too,
and wouldn't have false negatives. (I doubt it has false positives).

	Dominik

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVySrZ8MDCHJbN8YRAnvTAKCTpe7pS+eq0VABBqwIeWOoKMaq5QCeP9XQ
rLObGLLNy/nZ6o/75aVaGgs=
=3eq5
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--


--===============0513731816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0513731816==--

