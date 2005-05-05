From: Paul Swartz <z3p@twistedmatrix.com>
Subject: Re: Problem recognizing P4-M
Date: Wed, 04 May 2005 23:56:24 -0400
Message-ID: <1115265384.5332.2.camel@petra>
References: <1114490818.6148.15.camel@petra>
	<20050504205854.GA6331@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1294432456=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050504205854.GA6331@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk


--===============1294432456==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-85+i45UKXf6dP0HU/44J"


--=-85+i45UKXf6dP0HU/44J
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-05-04 at 22:58 +0200, Dominik Brodowski wrote:
> speedstep-ich is the only candidate for this CPU. However, it depends on =
an
> Intel chipset being present in your notebook. What does lspci tell you?

lspci says:

0000:00:00.0 Host bridge: ATI Technologies Inc: Unknown device cbb2 (rev
02)
0000:00:01.0 PCI bridge: ATI Technologies Inc PCI Bridge [IGP 340M]
0000:00:06.0 Multimedia audio controller: ALi Corporation M5451 PCI
AC-Link Controller Audio Device (rev 02)
0000:00:07.0 ISA bridge: ALi Corporation M1533 PCI to ISA Bridge
[Aladdin IV]
0000:00:08.0 Modem: ALi Corporation M5457 AC'97 Modem Controller
0000:00:09.0 Network controller: Broadcom Corporation BCM4306 802.11b/g
Wireless LAN Controller (rev 02)
0000:00:0a.0 CardBus bridge: Texas Instruments PCI1410 PC card Cardbus
Controller (rev 02)
0000:00:0b.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB
1.1 Controller (rev 50)
0000:00:0b.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB
1.1 Controller (rev 50)
0000:00:0b.2 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 51)
0000:00:0c.0 FireWire (IEEE 1394): Texas Instruments TSB43AB21
IEEE-1394a-2000 Controller (PHY/Link)
0000:00:10.0 IDE interface: ALi Corporation M5229 IDE (rev c4)
0000:00:11.0 Bridge: ALi Corporation M7101 Power Management Controller
[PMU]
0000:00:12.0 Ethernet controller: National Semiconductor Corporation
DP83815 (MacPhyter) Ethernet Controller
0000:01:05.0 VGA compatible controller: ATI Technologies Inc Radeon IGP
340M

thanks,
-p

(p.s. if you could keep at least CCing me, I'd appreciate it)
--=20
       Paul Swartz
(o_    http://z3p.livejournal.com/  _o)
//\    z3p@twistedmatrix.com        /\\
V_/_   AIM: z3penguin              _\_V->

--=-85+i45UKXf6dP0HU/44J
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBCeZlon20RAFzwsckRArNqAJ0fyibHvGhRHpO/bQjqb71jOIH+jwCfWGdI
uqq5Krp1GVxb00kn4nk4KUo=
=KPwJ
-----END PGP SIGNATURE-----

--=-85+i45UKXf6dP0HU/44J--



--===============1294432456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1294432456==--


