From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: CPU-Frequency limited to lowest available frequency	while	under
	load
Date: Thu, 01 Nov 2007 14:36:48 -0400
Message-ID: <472A1CC0.5080409@redhat.com>
References: <4727062E.9090806@cvmx.org>	<1193837319.4590.466.camel@queen.suse.de>
	<472A15FF.5040504@cvmx.org> <1193941879.4202.17.camel@noname>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0390419502=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1193941879.4202.17.camel@noname>
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
To: =?UTF-8?B?RmVyZGluYW5kIEjDvGJuZXI=?= <fh@cvmx.org>
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0390419502==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig25EE8839EDBDD84DA531C47A"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig25EE8839EDBDD84DA531C47A
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thomas Renninger wrote:
> Hi Ferdinand,
>=20
> I cut down the mail a bit...
> On Thu, 2007-11-01 at 19:07 +0100, Ferdinand H=C3=BCbner wrote:
>> Thomas Renninger wrote:
>>
>>> It can be:
>>>  1) frequency limited by BIOS through _PPC
>>>  2) frequency reduced by thermal passive limit
>>>  3) some really odd cpufreq core bug
>>>
>>> >From the last bugs occurring in this area I expect it's 1.
>=20
>> I repeated the test a couple of times and the _PPC values have always
>> been 0 except for the last test I did. The value was 3 in the last tes=
t.
>> Does that mean that the BIOS is partially responsible?
> If the value is 3, the highest three freqs are not allowed by BIOS.
> This may be intended, probably not.
>=20
> IMO best is you open a bug at http://bugzilla.kernel.org to collect inf=
o
> at one place..., for now I'd assign it to the ACPI component.
>=20
> acpidump output should be most important atm, pls attach it there and
> take me into CC list.
>=20
> Is it possible for you to reproduce this easily?
> Maybe something you noticed like: it always happens after x mins or
> after loading module y...
> You could also try to not load other ACPI modules: battery, thermal,
> button, fan, ac.
> Maybe it does not happen then anymore?

I didn't pay much attention to earlier posts in this thread, so pardon
if this has already been covered, but...

I had a similar sounding case reported in the Red Hat bugzilla, where a
Dell laptop wouldn't scale above its minimum frequency if the system was
running on a travel charger. This turned out to be a limitation imposed
intentionally by the system BIOS (and documented somewhere on Dell's web
site). On battery and on the normal charger, the same system had no
problems whatsoever.

Just throwing it out there, ignore me if its irrelevant. :)

--=20
Jarod Wilson
jwilson@redhat.com



--------------enig25EE8839EDBDD84DA531C47A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHKhzAtO+bni+75QMRAjz8AJ4ktH+pp/ivL3pGmm51OxhcQ//AZwCfZADg
SMxoxeiIqtX0E7IWyA5KtdE=
=jPvK
-----END PGP SIGNATURE-----

--------------enig25EE8839EDBDD84DA531C47A--


--===============0390419502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0390419502==--

