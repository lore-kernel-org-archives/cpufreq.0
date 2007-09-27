From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Thu, 27 Sep 2007 17:29:35 -0400
Message-ID: <46FC20BF.7080504@redhat.com>
References: <200709272259.18445.ederstefan@gmx.de>
	<1373497972.20070928011406@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071833451=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1373497972.20070928011406@mail.ru>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: realded@mail.ru
Cc: cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0071833451==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF25EFFA7D188035B9443AFBC"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF25EFFA7D188035B9443AFBC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

realded@mail.ru wrote:
> Hi, I have the same question. Tryed all powersaving modules, but
> no one worked.
> Stefan> Hallo everyone,
> Stefan> ist there a chance for powersaving with the following CPU? And =
if so, what are
> Stefan> the related modules to load?

acpi-cpufreq + cpufreq-ondemand works on the core2 quad I'm typing this
on...

$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 Quad CPU           @ 2.66GHz
stepping        : 7
cpu MHz         : 1596.000
cache size      : 4096 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall
nx lm constant_tsc pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm=

bogomips        : 5335.65
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual

If it doesn't work for you, I'd probably blame your motherboard BIOS.

--=20
Jarod Wilson
jwilson@redhat.com



--------------enigF25EFFA7D188035B9443AFBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFG/CC/tO+bni+75QMRAlP8AJ0bwTyQW/JnyYp5k3PGjlyz58FAPgCeLAkV
y8CS80ML3V+IT3i/S27dXoU=
=/CyA
-----END PGP SIGNATURE-----

--------------enigF25EFFA7D188035B9443AFBC--


--===============0071833451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0071833451==--

