From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: how to set ondemand governor
Date: Mon, 06 Aug 2007 16:27:47 -0400
Message-ID: <46B78443.4070402@redhat.com>
References: <46B7825B.7090007@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0334808942=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <46B7825B.7090007@gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Nebojsa Trpkovic <trx.lists@gmail.com>
Cc: cpufreq@www.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0334808942==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig06346E8F60C07707277129BF"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig06346E8F60C07707277129BF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Nebojsa Trpkovic wrote:
> I've got Core 2 Duo CPU and tried to set ondemand governor. result that=

> I've got shows that only one core is affected:
>=20
>> titan old # echo -n "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/=
scaling_governor

Note that the path you're echoing into contains 'cpu0'...

> does this mean that I should (and can) set different governors/variable=
s
> for different cores of my CPU ?

I suppose you can, but its a little batty (never actually tried myself).
In fedora-land, we have an initscript that defaults to setting ondemand
for all cpus. Part of the setup is to essentially echo 'ondemand' into
the scaling_governor sysfs file for each cpu on the system.

--=20
Jarod Wilson
jwilson@redhat.com



--------------enig06346E8F60C07707277129BF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGt4RItO+bni+75QMRAqTVAJ9qu9mSOtGmnqNMpQj0x/LZsb2xxgCgj9RK
f3WfsU3Jec7V9gMs0kdJyXk=
=gGw/
-----END PGP SIGNATURE-----

--------------enig06346E8F60C07707277129BF--


--===============0334808942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0334808942==--

