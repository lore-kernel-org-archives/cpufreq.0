From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq default governor?
Date: Mon, 19 Jan 2004 10:44:05 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040119094405.GA4836@dominikbrodowski.de>
References: <400B846B.6000202@cs.ucsd.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============20632643594659461=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <400B846B.6000202@cs.ucsd.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: diwaker@ucsd.edu
Cc: cpufreq@www.linux.org.uk


--===============20632643594659461==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm sorry but I cannot reproduce the behaviour you see. Do you run any
userspace cpufreq tool like cpufreqd? Can you compile the other governors as
modules, and see what happens then, please? Thanks,
	Dominik

On Sun, Jan 18, 2004 at 11:16:59PM -0800, Diwaker Gupta wrote:
> Hi,
>=20
> I'm running 2.6.1 vanilla kernel from kernel.org with no patches. I want=
=20
> to set the default cpufreq governor to userspace. Here is the relevant=20
> portion of my .config:
>=20
> =3D=3D=3D=3D
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_PROC_INTF=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_24_API=3Dy
> CONFIG_CPU_FREQ_TABLE=3Dy
> CONFIG_X86_ACPI_CPUFREQ=3Dy
> CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=3Dy
> =3D=3D=3D=3D
>=20
> Everything compiles fine, but when I boot into the new kernel, the=20
> default governor is still set to performance:
>=20
> <diwaker@diwaker>$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_gover=
nor
> performance
>=20
> But the userspace governor is indeed available:
> <diwaker@diwaker>$ cat=20
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
> powersave userspace performance
>=20
> Any suggestions?
> TIA,
> Diwaker
> --=20
> Diwaker Gupta
> Graduate Student, Computer Sc. and Engg.
> University of California, San Diego
> <http://www.cse.ucsd.edu/users/dgupta>
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAC6blZ8MDCHJbN8YRAgZ1AJwLNbyX2SSJyNBKofzJlI2jMfzC5ACeKZrG
hjrgjOP/DbgNtgFgM4ogMow=
=5KN7
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


--===============20632643594659461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============20632643594659461==--

