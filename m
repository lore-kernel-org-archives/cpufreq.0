From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Thu, 05 Aug 2004 16:02:50 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091736171.10552.26.camel@pc>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0763209434=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040805195248.GA32045@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk


--===============0763209434==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6PoVGP1JqfKQMyqrNLsW"


--=-6PoVGP1JqfKQMyqrNLsW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-05 at 20:52 +0100, Dave Jones wrote:
> On Thu, Aug 05, 2004 at 03:34:42PM -0400, Brian J. Murrell wrote:
>  > On Thu, 2004-08-05 at 21:26 +0200, Dominik Brodowski wrote:
>  > > cat /sys/devices/system/cpu/cpu0/cpufreq/*
>  >=20
>  > Just to be sure you knew which values where for which nodes I did a
>  >=20
>  > grep ".*" /sys/devices/system/cpu/cpu0/cpufreq/*
>  >=20
>  > and got:
>  >=20
>  > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:2200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:1200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:220=
0000 1200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:users=
pace performance
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:speedstep-ich
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:userspace
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:2200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:1200000
>  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:1200000
>=20
>=20
> My guess is that speedstep_get_processor_frequency() is returning null
>=20
> What does /proc/cpuinfo say ?

Right now:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
stepping        : 7
cpu MHz         : 1196.613
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 2359.29

After a bit of "cat </dev/urandom >/dev/null":

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
stepping        : 7
cpu MHz         : 2193.791
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 4325.37

Do you want shall I enable SPEEDSTEP_DEBUG and see what comes out?

b.


--=-6PoVGP1JqfKQMyqrNLsW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBEpJql3EQlGLyuXARAqQgAKC2VHTwlZrC0e7/l6AiBdLn657DQQCgtew8
eyYuaf/eJFJf7woGQf32sTk=
=gYWU
-----END PGP SIGNATURE-----

--=-6PoVGP1JqfKQMyqrNLsW--



--===============0763209434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0763209434==--


