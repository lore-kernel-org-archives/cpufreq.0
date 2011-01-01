From: Daniel Klaffenbach <danielklaffenbach@gmail.com>
Subject: Issues with ondemand governor on overclocked CPU
Date: Sat, 1 Jan 2011 23:13:26 +0100
Message-ID: <201101012313.39077.danielklaffenbach@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1448989.Jpj4BdNGOn";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :message-id;
        bh=eua/PrOyIxuabbgZuPsHgL0BcH8JG7CwmfXxkd9ovec=;
        b=i7XUY0i1WTLST5BEZg1T6Lzv2UWWsI5m0M1pqphPpengDJCJm+pLpB3g8zXtYz4e9r
         Z+ETWAahAMMlCKI4X9frwzisxZ698+iYPJWib7HVCz6hwZEWjFA0ZXIaO5Ve55xVdRTb
         UrUYoTsgEhl8/cePOemzoSJ/Nru1Q4AjH5WZs=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

--nextPart1448989.Jpj4BdNGOn
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using a Core2 Quad (Q9650) on a Gigabyte GA-EP45-DS4 board. The defaul=
t=20
CPU specs look like this:
  * FSB: 333MHz,
  * Multiplier: 6-9
=20
without overclocking frequency scaling with acpi-cpufreq works pretty well =
=2D=20
it either uses a 6x multiplier (2 GHz) or a 9x multiplier (3 GHz).
=20
After setting the FSB to 400MHz and limiting the multiplier to 6-8 in the B=
IOS=20
(3,2 GHz), frequency scaling with the ondemand governor does not work any=20
more. The actual frequency information is still correct:

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies=20
3200000 2400000

However the ondemand governor does not do any upscaling any more - the CPU =
is=20
stuck at 2,4 GHz. It is still possible to use the maximum frequency by sett=
ing=20
"scaling_min_freq" to "3200000" (or probably by using the performance=20
governor).

Is this expected? Could this be a bug? Without limiting the multiplier=20
(leaving the default 6/9) ondemand scaling also works as usual (2,4 GHz/3,6=
=20
GHz).

Kernel version: 2.6-git


Regards,
 Daniel

--nextPart1448989.Jpj4BdNGOn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAk0fpxMACgkQM8RD99ZskA/v2ACfTy39NmErY/sl9XolLGDQrHG/
s24An10MSFmOXudDRF6bbq8wLLYZCWS2
=wp+M
-----END PGP SIGNATURE-----

--nextPart1448989.Jpj4BdNGOn--
