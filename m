From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Modprobe of cpufreq modules fails
Date: Mon, 12 Nov 2007 10:04:38 -0500
Message-ID: <47386B86.3010306@redhat.com>
References: <10a58eee0711120143v7b82e98cncb16e9f07a9de21f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2125781766=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <10a58eee0711120143v7b82e98cncb16e9f07a9de21f@mail.gmail.com>
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
To: Uli Brueggemann <uli.brueggemann@gmail.com>
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============2125781766==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigCEFD67818B25469EA5A625BF"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCEFD67818B25469EA5A625BF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Uli Brueggemann wrote:
> I'm running a Core 2 Duo system. With different kernels (up to 2.6.23.1=
 or
> 2.6.24-rc2) I cannot modprobe acpi_cpufreq or speedsteep-centrino or ..=
=2E
> So I always get the report "no such device".

You definitely want acpi-cpufreq, not speedstep-centrino... The 'no such
device' message usually indicates that upon querying your BIOS ACPI
tables, acpi-cpufreq found no valid frequency scaling information, which
suggests either freq scaling is disabled in the BIOS or your BIOS has
busted ACPI (in which case a newer BIOS for your board, if available,
might help).

Also, you can boot with the added parameter 'cpufreq.debug=3D7' to get a
bit more info spit out in dmesg about what's going on when you try to
load acpi-cpufreq. Could give some further insight into what went wrong
and/or verify what I suggested above.

--=20
Jarod Wilson
jwilson@redhat.com



--------------enigCEFD67818B25469EA5A625BF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHOGuKtO+bni+75QMRArwBAJoCWCf3DqYv/YCWUNuusy41Th3XMgCggMoZ
SL96L0Yxmqqk5808icLf2MA=
=4613
-----END PGP SIGNATURE-----

--------------enigCEFD67818B25469EA5A625BF--


--===============2125781766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============2125781766==--

