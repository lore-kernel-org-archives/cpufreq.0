From: Jan Rychter <jan@rychter.com>
Subject: Re: cpufreq and P-IIIM
Date: Mon, 18 Aug 2003 10:18:11 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <m2r83ix4to.fsf@tnuctip.rychter.com>
References: <m2ptj5fiuc.fsf@tnuctip.rychter.com>
	<20030818112943.GD18032@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030818112943.GD18032@poupinou.org> (Ducrot Bruno's message
 of "Mon, 18 Aug 2003 13:29:43 +0200")
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

--=-=-=
Content-Transfer-Encoding: quoted-printable

>>>>> "Ducrot" =3D=3D Ducrot Bruno <ducrot@poupinou.org>:
[...]
 Ducrot> Take a look at www.poupinou.org/cpufreq/

Files below, if anybody is interested.

Also, FWIW, cpufreq in 2.6.0-test3 doesn't support this chipset either.

=2D-J.

AC:

dmi_scan: return:
DMI 2.3 present.
46 structures occupying 1291 bytes.
DMI table at 0x000D8010.
BIOS Vendor: Phoenix Technologies LTD
BIOS Version: 4.06.1
BIOS Release: 12/18/2001
System Vendor: SHARP Corporation
Product Name: TBD
Version: 1.0
Board Vendor: SHARP Corporation
Board Name: TBD
Board Version: 1.0
Trying Intel's int15 GSIC:
BIOS support GSIC call:
	signature: GSIC
	command port =3D 0x00b2
	command =3D      0x0082
	event port =3D   0x000000b3
	flags =3D        0x07d00100
probing chipsets: Found PIIX4 (embeded in MX440 chipset)
  pmbase at 0x1000
Dumping PM IO register for this southbridge:
PMCNTRL (0x1004): 0x1401
(0x1006):         0x0000
GPEN (0x100e):    0x3800
PCNTRL (0x1010):  0x00001203
(0x1016):         0x0000
DEVSTS (0x101c):  0x00000000
GLBLEN (0x1020):  0x8000
(0x1022):         0x02f70000
GLBCTL (0x1028):  0x0301ff05
DEVCTL (0x102c):  0x00200000
GPIs: (0x1030):   0x120242
(0x1033):         0x61
GPOs: (0x1034):   0x400c000a
(0x1038):         0x30 0xa0 0x04 0x10 0x00 0x00 0x00 0x01=20


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo=3D number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x1034):   0x400c000a  01000000000011000000000000001010

BATTERY:

dmi_scan: return:
DMI 2.3 present.
46 structures occupying 1291 bytes.
DMI table at 0x000D8010.
BIOS Vendor: Phoenix Technologies LTD
BIOS Version: 4.06.1
BIOS Release: 12/18/2001
System Vendor: SHARP Corporation
Product Name: TBD
Version: 1.0
Board Vendor: SHARP Corporation
Board Name: TBD
Board Version: 1.0
Trying Intel's int15 GSIC:
BIOS support GSIC call:
	signature: GSIC
	command port =3D 0x00b2
	command =3D      0x0082
	event port =3D   0x000000b3
	flags =3D        0x07d00100
probing chipsets: Found PIIX4 (embeded in MX440 chipset)
  pmbase at 0x1000
Dumping PM IO register for this southbridge:
PMCNTRL (0x1004): 0x1401
(0x1006):         0x0000
GPEN (0x100e):    0x3800
PCNTRL (0x1010):  0x00001203
(0x1016):         0x0000
DEVSTS (0x101c):  0x00000000
GLBLEN (0x1020):  0x8000
(0x1022):         0x02f70000
GLBCTL (0x1028):  0x0301ff05
DEVCTL (0x102c):  0x00200000
GPIs: (0x1030):   0x120242
(0x1033):         0x61
GPOs: (0x1034):   0x400c002a
(0x1038):         0x30 0xa0 0x04 0x10 0x00 0x08 0x00 0x01=20


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo=3D number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x1034):   0x400c002a  01000000000011000000000000101010

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/QQpVLth4/7/QhDoRAq+kAKDwIDNADdINnB7AyVaK2VjBKcAgkQCePcDO
gLSo8muoZtNZtnO4653b+hk=
=vjQT
-----END PGP SIGNATURE-----
--=-=-=--
