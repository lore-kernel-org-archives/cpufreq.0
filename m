From: Jan Rychter <jan@rychter.com>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Mon, 22 Sep 2003 13:20:46 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m24qz4lgm9.fsf@tnuctip.rychter.com>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
	<3F6ACB0E.8050009@basmevissen.nl> <m2r82avdm6.fsf@tnuctip.rychter.com>
	<3F6EAC05.7090009@basmevissen.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============64290228231725699=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F6EAC05.7090009@basmevissen.nl> (Bas Mevissen's message of
	"Mon, 22 Sep 2003 10:00:05 +0200")
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Bas Mevissen <ml@basmevissen.nl>
Cc: cpufreq@www.linux.org.uk

--===============64290228231725699==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

> >>>>>>"Bas" =3D=3D Bas Mevissen <ml@basmevissen.nl> writes:
> Jan Rychter wrote:
> >  11048mW 900MHz, C2 only
> > 10560mW 600MHz, C2 only
> > 9306mW 900MHz, C3 allowed
> > 9306mW 600MHz, C3 allowed
> > So, it seems that changing the frequency actually buys very little if
> > you're stuck in C2 (about 0.5W) and exactly NOTHING if the machine is
> > idle and can use C3.
> >
>=20
> Do you measure this from the ACPI baatery output?=20

Yes.

> I still suspect that your CPU is only running at low speed all the
> time. So please boot with AC adapter in and check /proc/cpuinfo and
> reboot without AC adapter and check again. In the meantime, get
> bogomips as it is worthless as a benchmark, but usefull to compare :-)

No, I have verified this (with bogomips) and the above results are
true. The CPU does indeed slow down properly as directed by
cpufreq. Also, in my case connecting and disconnecting the AC adapter
doesn't change the CPU speed.

So, the results still hold -- and it seems it simply doesn't make much
sense to slow down a Pentium-M, unless you really keep the CPU busy?

=2D-J.

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/b1mgLth4/7/QhDoRAu0aAKCdTnP2DqtTbeTz2CaMy+8WpObnUQCg8V3I
5bBQYOwq/fpI8Gv8wSbLP9o=
=i86/
-----END PGP SIGNATURE-----
--=-=-=--


--===============64290228231725699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============64290228231725699==--

