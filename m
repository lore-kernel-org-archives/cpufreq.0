From: Jan Rychter <jan@rychter.com>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
 P-state driver
Date: Mon, 03 Nov 2003 19:21:34 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m24qxk4y4h.fsf@tnuctip.rychter.com>
References: <BF1FE1855350A0479097B3A0D2A80EE0CC87F7@hdsmsx402.hd.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============59520166574095379=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <BF1FE1855350A0479097B3A0D2A80EE0CC87F7@hdsmsx402.hd.intel.com>
	(Len Brown's message of "Mon, 3 Nov 2003 22:14:23 -0500")
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: "Brown, Len" <len.brown@intel.com>
Cc: Mukesh Rajan <megabyte1024@hotmail.com>, linux-acpi <linux-acpi@intel.com>, cpufreq@www.linux.org.uk

--===============59520166574095379==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=

>>>>> "Len" == Len Brown writes:
 >> I have done some measurements on a Toshiba S7/290LNKW, which has a
 >> 900MHz Pentium-M. The results have been posted to this list a while
 >> ago -- the most surprising one being that the Pentium-M in that
 >> machine seemed to always consume the same amount of power when idle,
 >> independent of operating frequency.  The frequency only made a
 >> difference when the CPU was actually doing something (or when I made
 >> it not use the C3 state by loading usb-uhci).

 Len> Probably the cpu is running HLT in the idle loop, so the power
 Len> consumption there would not vary with MHz.

Oh -- well, that's exactly what I wanted to check. It seems it does vary
for speedstepped Pentium-III Mobile, according to my measurements,
that's why I was surprised.

This should influence the design of dynamic power management -- if the
CPU is already idle, there is no point in slowing it down. It only makes
sense to change the frequency when we're actually doing something.

--J.

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/pxtCLth4/7/QhDoRAo/1AJ9G4ZnsEnpzSGMAUwB9m6bgZX/tNQCfRIP7
NTd7AHIwt7TW1Did53Mvfk4=
=H+v7
-----END PGP SIGNATURE-----
--=-=-=--


--===============59520166574095379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============59520166574095379==--

