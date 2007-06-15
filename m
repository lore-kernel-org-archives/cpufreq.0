From: "=?utf-8?q?S=2E=C3=87a=C4=9Flar?= Onur" <caglar@pardus.org.tr>
Subject: Re: [BUG] Interesting race between cpufreq_ondemand and snd_atiixp
Date: Sat, 16 Jun 2007 02:36:18 +0300
Message-ID: <200706160236.18841.caglar@pardus.org.tr>
References: <200706160233.47659.caglar@pardus.org.tr>
Reply-To: caglar@pardus.org.tr
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1760366.UEGl4Iu3Rm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755991AbXFOXhj@vger.kernel.org>
In-Reply-To: <200706160233.47659.caglar@pardus.org.tr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, tiwai@suse.de

--nextPart1760366.UEGl4Iu3Rm
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

16 Haz 2007 Cts tarihinde, S.=C3=87a=C4=9Flar Onur =C5=9Funlar=C4=B1 yazm=
=C4=B1=C5=9Ft=C4=B1:=20
=2E..
> 3. echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		^^^ performance

Sorry for typo!

>    strace -o log -f -tttTTT mpg123 some.mp3
>
> works without a problem [full log @ 3]

Cheers
=2D-=20
S.=C3=87a=C4=9Flar Onur <caglar@pardus.org.tr>
http://cekirdek.pardus.org.tr/~caglar/

Linux is like living in a teepee. No Windows, no Gates and an Apache in hou=
se!

--nextPart1760366.UEGl4Iu3Rm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4 (GNU/Linux)

iD8DBQBGcyJyy7E6i0LKo6YRAlRUAKCfLMmTSiBw/rDGh8yZ0keQYacqMwCbBEvc
8/O/x7a89jzy2ZC8kgcxjHo=
=bp19
-----END PGP SIGNATURE-----

--nextPart1760366.UEGl4Iu3Rm--
