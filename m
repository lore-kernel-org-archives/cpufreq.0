From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 21:19:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414191936.GA21540@dominikbrodowski.de>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
	<20040414174407.GL24970@redhat.com>
	<20040414185842.GK8953@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1151372684=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040414185842.GK8953@poupinou.org>
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
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk


--===============1151372684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2004 at 08:58:42PM +0200, Bruno Ducrot wrote:
> -		powernow_table[i].frequency =3D (fsb * fid_codes[fid]);
> +		powernow_table[i].frequency =3D fsb * fid_codes[fid] / 10;

OK, you were faster :-)

> +module_param(powernow_acpi_force,  int, 0444);
> +
> +MODULE_PARM_DESC(powernow_acpi_force, "Force ACPI to be used");
> +

FYI, currently

powernow-k8	has primary mode	ACPI	fallback:	PST
powernow-k7				PST			ACPI
speedstep-centrino			ACPI			builtin-table

and=20
acpi-io		only uses		ACPI, of course.	n/a


	Dominik

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAfY7IZ8MDCHJbN8YRAkbMAJ9U0DJWg+YYqAICk4pdbtrAIXitYwCglcik
C95GChkfLllY0nP3Gnr3Xds=
=lKxf
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--


--===============1151372684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1151372684==--

