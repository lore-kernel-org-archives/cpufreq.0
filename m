From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] fix up CPU detection in p4-clockmod
Date: Sat, 10 Jan 2004 17:19:13 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110161913.GA4983@dominikbrodowski.de>
References: <20040110151248.GA7989@dominikbrodowski.de>
	<20040110155048.GA17500@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1257472196502567=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110155048.GA17500@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk


--===============1257472196502567==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 03:50:48PM +0000, Dave Jones wrote:
> On Sat, Jan 10, 2004 at 04:12:48PM +0100, Dominik Brodowski wrote:
>  > Too many users use the p4-clockmod cpufreq driver instead of the more
>  > advanced speedstep-centrino, speedstep-ich or even acpi drivers. All o=
f the
>  > latter (usually) provide voltage scaling, while the p4-clockmod driver=
 only
>  > offers a variant of frequency scaling. So, warn users if they try out =
this
>  > driver instead.
>  >=20
>  > Also, instead of using a local copy, use the speedstep_lib infrastruct=
ure
>  > for detecting the processor speed. Adding the Pentium-M get_frequency
>  > function to that module only costs about 200 bytes in object size.
>=20
> another idea might be putting the cpu identify code into a speedstep.ko
> and have that request_module the right module

That's not a valid option as a replacement -- there _are_ different modules
possible for the same CPU. However, it's a good idea if it is implemented a=
s=20
an "autoloader".

	Dominik

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAACYBZ8MDCHJbN8YRAscZAJ0TeZbRMp7UuGSpn2nR1peKWjVk4wCePnas
F+Xgf8psG/HK5ur+Z98TcoM=
=hXFh
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--


--===============1257472196502567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1257472196502567==--

