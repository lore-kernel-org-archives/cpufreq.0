From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Fri, 13 Feb 2004 10:26:44 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040213092644.GA5230@dominikbrodowski.de>
References: <1076542663.4323.17.camel@laptop> <402B6516.1030408@basmevissen.nl>
	<1076610612.4491.42.camel@laptop>
	<20040213001555.GD13262@poupinou.org>
	<1076652625.4339.6.camel@laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============43396264152546227=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1076652625.4339.6.camel@laptop>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Ronald van der Meer <revdmeer@conceptsfa.nl>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============43396264152546227==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2004 at 07:10:25AM +0100, Ronald van der Meer wrote:
> I don't think it's a special mobile version. Probably this one:
> http://developer.intel.com/design/chipsets/datashts/252523.htm
>=20
> would this totally rule out the using speedstep which the CPU does seem
> to support?=20

Unfortunately, it does seem so. The ICH-5 is a desktop version and does
not include the special registers necessary for speedstep control.

Does the acpi cpufreq-driver (latest(!) 2.6.) work?

	Dominik

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFALJhUZ8MDCHJbN8YRAllYAJ4guTINJi7OR3akG8kWJh7zUejFpACfSRal
fXtqBXIU2KA9cSkcG9NqqEU=
=ZINO
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--


--===============43396264152546227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============43396264152546227==--

