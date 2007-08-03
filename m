From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: do Pentium4 & PentiumM consume about the same at their lowest
 possible freq?
Date: Fri, 03 Aug 2007 16:52:04 -0400
Message-ID: <46B39574.2@redhat.com>
References: <653FFBB4508B9042B5D43DC9E18836F50139486C@scsmsx415.amr.corp.intel.com>
	<46B394D5.4030509@unica.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0575394150=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <46B394D5.4030509@unica.it>
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
To: Roberto De Leo <deleo@unica.it>
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0575394150==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigED5D4C891414ED08B081D143"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigED5D4C891414ED08B081D143
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Roberto De Leo wrote:
>=20
>>> why slowing down the CPU at all if it doesn't save you any watt? I
>>> guess I'll stop using it.
>>>  =20
>> It is meant to be used under thermal condition where slowing down CPU
>> will result in reducing the temperature and not for power savings in
>> normal conditions.
>>
> I thought that power consumption and heat dissipation in the CPU were
> more or less proportional but evidently my belief was too naif  :-)
>=20
> I guess that the same thing holds for the Athlon64 so prolly centrino i=
s
> the only CPU were I can get a substantial power saving by decreasing th=
e
> freq when I don't need much of it (which is almost always), is this
> correct?

No. AMD64 does the right thing too. The P4 only throttles, the AMD64 and
centrino chips actually scale their frequencies down. Throttling and
frequency scaling are different beasts, with freq scaling being far more
worthwhile.

--=20
Jarod Wilson
jwilson@redhat.com



--------------enigED5D4C891414ED08B081D143
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGs5V4tO+bni+75QMRAueyAJ4jh83h2jAvjABLQrOdNjVk4P7IhACdHp1k
jqxufJ6UdZGCdKQ2i3BH/II=
=uIbT
-----END PGP SIGNATURE-----

--------------enigED5D4C891414ED08B081D143--


--===============0575394150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0575394150==--

