From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Intel Clovertown vs. frequency scaling
Date: Thu, 11 Oct 2007 11:37:32 -0400
Message-ID: <470E433C.30401@redhat.com>
References: <20071011150633.GL6058@cern.ch> <470E404C.10304@redhat.com>
	<Pine.LNX.4.64.0710111731370.6509@antonia.sgowdy.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350990170=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.64.0710111731370.6509@antonia.sgowdy.org>
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
To: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1350990170==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig0ECE06272A453C200DDBF9C0"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig0ECE06272A453C200DDBF9C0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Stephen J. Gowdy wrote:
> I have a quad-core version that uses the centrino one (E5345). However,=

> it only has two available speeds, 2GHz and 2.33GHz. Do you get more
> options?
>=20
> [pcphuat27] ~ > cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver=

> centrino
> [pcphuat27] ~ > cat
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> 2333000 2000000

Not a heck of a lot more, but a bit more.

[jwilson@xeus ~]$ cat sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
acpi-cpufreq
[jwilson@xeus ~]$ cat
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
2660000 2128000 1596000

FYI, unless I'm mistaken, the speedstep-centrino driver is supposed to
be getting deprecated in favor of acpi-cpufreq.


> Andras.Horvath@cern.ch wrote:
>> I have a number of Clovertown (intel quadcore) machines and, even with=

>> the latest 2.6.23, it seems to me that frequency scaling is not
>> supported (e.g. the /sys/devices/system/cpu/cpu0/cpufreq/* stuff does
>> not appear even though CONFIG_X86_SPEEDSTEP_CENTRINO is "y").
>=20
> I believe you want acpi-cpufreq, not speedstep-centrino. Works just fin=
e
> for my quad-core systems, anyhow. If that doesn't work, its probably th=
e
> bios at fault.


--=20
Jarod Wilson
jwilson@redhat.com



--------------enig0ECE06272A453C200DDBF9C0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHDkM8tO+bni+75QMRAqlZAJ96UAeROrR8qvH7qJz6xZwFI5DvfwCfaeDN
5ZRc2E3HbMFjcd1WOZVSGds=
=eeZS
-----END PGP SIGNATURE-----

--------------enig0ECE06272A453C200DDBF9C0--


--===============1350990170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1350990170==--

