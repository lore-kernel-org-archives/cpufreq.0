From: Gregor Hlawacek <lawa@gmx.at>
Subject: Re: Call4Response: Correct PST table for ATHLONs
Date: Wed, 2 Jul 2003 11:13:07 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307021113.14112.lawa@gmx.at>
References: <3F028F2C.5020704@searchbroker.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_oIqA/9Kq2yKC7rC";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <3F028F2C.5020704@searchbroker.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: Cpufreq@www.linux.org.uk


--Boundary-02=_oIqA/9Kq2yKC7rC
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Am Mittwoch, 2. Juli 2003 09:52 schrieb Lars Gemeinhardt:
> Hello cpufreq-user and developer,
>
> can everybody with an correct PST table (diffent FIDs and VIDs) and an
> ATHLON cpu post the "dmesg" snip (you get this using the dmesg command
> after the modul is loaded) to this mailing-list...
> Maybe we can setup with this the correct values to the cpufreq driver
> (the K7 powernow part)...then otherwise the Acer and Sony notebooks
> doesn't work perfectly :-(

Your wish is my command:

This is a Vaio PCG-FX601 (Mobile Duron at 1100Mhz) running 2.4.21-rc1 and=20
cpufreq-2.4.21-pre4-3 plus acpi and swsusp patches

Here the is dmesg (hope it helps):

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00f74d0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 28 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:9 (@c00f757a)
powernow:  cpuid: 0x762  fsb: 100        maxFID: 0x0     startvid: 0xc
powernow:    FID: 0x4 (5.0x [500MHz])    VID: 0x13 (1.200V)
powernow:    FID: 0x6 (6.0x [600MHz])    VID: 0x13 (1.200V)
powernow:    FID: 0x8 (7.0x [700MHz])    VID: 0x11 (1.250V)
powernow:    FID: 0xc (9.0x [900MHz])    VID: 0xd (1.350V)
powernow:    FID: 0x0 (11.0x [1100MHz])  VID: 0xc (1.400V)
powernow: Minimum speed 500 MHz. Maximum speed 1100 MHz.

Gregor

=2D-=20
Gregor Hlawacek                                                  Austria
http://www.unileoben.ac.at/~m9327555/        May the source be with you!
 This posting is 100% M$ free. Guaranteed by Tux, the friendly penguin.

--Boundary-02=_oIqA/9Kq2yKC7rC
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/AqIoer3X+/vN824RAp+QAJ4lRB/azphkZEec9En1+vub0/WOLgCfU63v
9GsJBap8AS0bbOgk6FveV1c=
=r1lE
-----END PGP SIGNATURE-----

--Boundary-02=_oIqA/9Kq2yKC7rC--
