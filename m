From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 16:05:19 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209150519.GA6531@dominikbrodowski.de>
References: <20040209132659.GY13262@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============14532545126634933=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040209132659.GY13262@poupinou.org>
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
Cc: davej@redhat.com, cpufreq@www.linux.org.uk


--===============14532545126634933==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> 1- Include the powernow_acpi_init() as the first call in
> powernow_decode_bios(), so that ACPI is used first, then if it failed,
> the legacy method is used,
> or
> 2- Include the powernow_acpi_init() at powernow_decode_bios() just
> before the 3 printk's stating to write that you should see
> http://www.codemonkey.org.uk/projects/cpufreq/...
>=20
> I guess 2- is 'better', but I would like to get some thought, though.

Hm. That's difficult to decide, also for the speedstep-centrino case... I'd
like to hear some opinions from ACPI and AMD guys first before we decide...

> +	printk("1\n");
> +	if (acpi_processor_register_performance(&p, 0))
> +		return -EIO;
> +	printk("2\n");
> +
> +	r =3D &p.control_register;
> +	if (r->space_id !=3D ACPI_ADR_SPACE_FIXED_HARDWARE) {

How about
	if (p.control_register.space_id !=3D ACPI_ADR_SPACE_FIXED_HARDWARE) {
?

> +		retval =3D -ENODEV;
> +		goto out;
> +	}
> +	r =3D &p.status_register;
> +	if (r->space_id !=3D ACPI_ADR_SPACE_FIXED_HARDWARE) {

same here...

> +	fsb =3D 100;	/* XXX fix me */

Any idea on how to determine the FSB?

> +	latency =3D 10000;	/* XXX don't trust bios writers.. */

heh...

> +	/*
> +	 * We don't need no more acpi.
> +	 * XXX is that true?
> +	 */

No, it's not true. If we use ACPI, we need to keep it registered until we
stop using it. Reasons:
- keep buggy drivers from interfering [e.g. other cpufreq drivers which=20
  register with ACPI first and with cpufreq later, or avoid registering with
  cpufreq because of being proprietary...]
- honor _PPC limits
- allow for ACPI interface (additions):
  This includes the /proc/acpi/processor/./performance interface which
  people still tend to use, and additions to=20
  /sys/devices/system/cpu/cpu0/cpufreq/ still to be written.


	Dominik

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAJ6GvZ8MDCHJbN8YRAlubAJ9IrIHVOzJkbwzoGJijUkKQlCvFBACgk88M
yuTY6oLUEa7hxNX1qbe8t2Y=
=IJU2
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--


--===============14532545126634933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============14532545126634933==--

