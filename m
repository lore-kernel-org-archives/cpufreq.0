From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Thu, 05 Aug 2004 15:34:42 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091734482.10552.20.camel@pc>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1844402225=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040805192613.GA9008@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk


--===============1844402225==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-CZtj2yJmY52dGhRPLGaX"


--=-CZtj2yJmY52dGhRPLGaX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-05 at 21:26 +0200, Dominik Brodowski wrote:
> cat /sys/devices/system/cpu/cpu0/cpufreq/*

Just to be sure you knew which values where for which nodes I did a

grep ".*" /sys/devices/system/cpu/cpu0/cpufreq/*

and got:

/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:2200000
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:2200000 =
1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:userspace =
performance
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:speedstep-ich
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:userspace
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:2200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:1200000

b.


--=-CZtj2yJmY52dGhRPLGaX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBEovRl3EQlGLyuXARAoWnAJ0fQzqSx2viZY7AcAa64YXgQsgAlACfa1Vz
zBrGdXVa3f8P8R6sTP5caGY=
=J6GI
-----END PGP SIGNATURE-----

--=-CZtj2yJmY52dGhRPLGaX--



--===============1844402225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1844402225==--


