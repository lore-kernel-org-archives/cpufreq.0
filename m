From: Ben Hutchings <ben@decadent.org.uk>
Subject: Is e_powersaver safe to auto-load?
Date: Sat, 11 Feb 2012 23:33:10 +0000
Message-ID: <1329003190.325.78.camel@deadeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-a7UKWTMNGxxGlO1S3DEP"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dave Jones <davej@redhat.com>, =?UTF-8?Q?Rafa=C5=82?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@vger.kernel.org, Andi Kleen <ak@linux.intel.com>


--=-a7UKWTMNGxxGlO1S3DEP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The e_powersaver driver comes with a dire warning in Kconfig help:

    VIA C7 Enhanced PowerSaver (DANGEROUS)

    This adds the CPUFreq driver for VIA C7 processors.  However, this driv=
er
    does not have any safeguards to prevent operating the CPU out of spec
    and is thus considered dangerous.  Please use the regular ACPI cpufreq
    driver, enabled by CONFIG_X86_ACPI_CPUFREQ.

Following the bug report <http://bugs.debian.org/566208>, Debian's
cpufrequtils init script was changed to stop loading it.  The driver was
later disabled in Debian kernel configurations.  Rafa=C5=82 appears to have
made it somewhat safer since then, but the help text has not been
changed.

Since commit fa8031aefec0cf7ea6c2387c93610d99d9659aa2 ('cpufreq: Add
support for x86 cpuinfo auto loading v4') the driver will be auto-loaded
on some systems.  If it is still dangerous then it should surely not be
auto-loaded.  But if it is now believed to be safe then the help text
should be updated to say so.

Ben.

--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-a7UKWTMNGxxGlO1S3DEP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATzb6tue/yOyVhhEJAQoXqQ//Z9ND/9+ZJ9VB/DqJPyYUJkovnu3M1ZW/
qETECYUAXKyPGtsAw7WevZGb+KjvwlRPlt18rPnj7b/dv5G7aLDbR8yQBgsnisAL
Wud7MQcZXlCPD+Y6GOmRM0nl3wFzi+FYk6bCkHqmVhMOZP/OKa7GrJ3HVj2Tju02
AYxIspX+YnBjDypcDFeXlW2af54ZdYkDW5BSHPaXA6wwk3qqhkvHU6LvS4hfkKq1
Kya6yBB3h1Gaa17oatZpimxiFGgxoxLIh/lNMrxFouMhS/nyqXzQPrHD8hx6aNZ/
O8BR8xu189kgiQqBvrvHKMymrrjn66oX8dscB1ruXySbzKBLlWOOwVtMbnul3YGC
f8CKEPalvviWWrCB+VqzT2+T1y29ZtDIn0TZYVW0onN//SJnSZu//+A7uzwIv4UM
sVFeqoWWRzCtli4J42uJ2k0+cMMNGhUFf5J/+395cG8OMm/pKYNoRbcHMMLq4Wkv
KFGVWVmgRpVslLfsE7PhJ8j+09+CMCrwJY6kcpaqCD7xuqslrp0UJGBAh947ube2
GeMDxqNceuqX15nf/anwqbK9Z1UGqk3H15Di0h6ZezVOuzVSPc3IJHVTwajnBEAC
6rZ8CMPViTz+6aYwmpYXllv0M+RF6yOzBbwTX6BIFGcFGKZWL4Unvi3bcOeSHNUN
uYaSaNBVX7A=
=4rtR
-----END PGP SIGNATURE-----

--=-a7UKWTMNGxxGlO1S3DEP--
