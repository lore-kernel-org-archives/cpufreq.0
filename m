From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Intel Clovertown vs. frequency scaling
Date: Thu, 11 Oct 2007 11:25:00 -0400
Message-ID: <470E404C.10304@redhat.com>
References: <20071011150633.GL6058@cern.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0102352507=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071011150633.GL6058@cern.ch>
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
--===============0102352507==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigA9B93BEC73D87BF8EB5652F0"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigA9B93BEC73D87BF8EB5652F0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Andras.Horvath@cern.ch wrote:
> I have a number of Clovertown (intel quadcore) machines and, even with
> the latest 2.6.23, it seems to me that frequency scaling is not
> supported (e.g. the /sys/devices/system/cpu/cpu0/cpufreq/* stuff does
> not appear even though CONFIG_X86_SPEEDSTEP_CENTRINO is "y").

I believe you want acpi-cpufreq, not speedstep-centrino. Works just fine
for my quad-core systems, anyhow. If that doesn't work, its probably the
bios at fault.

--=20
Jarod Wilson
jwilson@redhat.com



--------------enigA9B93BEC73D87BF8EB5652F0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHDkBRtO+bni+75QMRAnk9AJ9fgWsSy35XH2VN/kVFpbZPkfqUdwCeIl9p
cdAj3cGwHumJp0SKilOy/ao=
=V8pU
-----END PGP SIGNATURE-----

--------------enigA9B93BEC73D87BF8EB5652F0--


--===============0102352507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0102352507==--

