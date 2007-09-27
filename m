From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Thu, 27 Sep 2007 17:51:04 -0400
Message-ID: <46FC25C8.4020005@redhat.com>
References: <200709272259.18445.ederstefan@gmx.de>	<46FC1E3E.6070200@redhat.com>
	<200709272333.14046.ederstefan@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1423486736=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200709272333.14046.ederstefan@gmx.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Stefan Eder <ederstefan@gmx.de>
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1423486736==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4102D792A872699011C6DE25"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4102D792A872699011C6DE25
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Stefan Eder wrote:
> Am Donnerstag, 27. September 2007 23:18:54 schrieb Jarod Wilson:
>> Stefan Eder wrote:
>>> Hallo everyone,
>>> ist there a chance for powersaving with the following CPU?
>> Yes.
>>
>>> And if so, what are
>>> the related modules to load?
>> acpi-cpufreq for freq scaling support, cpufreq-ondemand for your
>> governor (may be built-in though)
>=20
> Hallo, tried this module on openSUSE 10.3 RC1:
>=20
> modprobe acpi-cpufreq
> FATAL: Error inserting acpi_cpufreq=20
> (/lib/modules/2.6.22.5-29-bigsmp/kernel/arch/i386/kernel/cpu/cpufreq/ac=
pi-cpufreq.ko):=20
> No such device

Boot with the added kernel param cpufreq.debug=3D7 and check dmesg after
trying to load the module. Should say a bit more about what's going
awry. It works fine under a Fedora 2.6.22.7 kernel, so I think your
kernel should be fine, and I'm inclined to think its your BIOS at fault.


--=20
Jarod Wilson
jwilson@redhat.com



--------------enig4102D792A872699011C6DE25
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFG/CXItO+bni+75QMRAjNwAJ9iV+vIimxc0CBk5ow+0QvSp3I1OwCgvoqT
qNgqxjx1Ehlv/4kJwFw6Exw=
=POPl
-----END PGP SIGNATURE-----

--------------enig4102D792A872699011C6DE25--


--===============1423486736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1423486736==--

