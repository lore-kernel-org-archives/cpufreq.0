From: Mark Watts <m.watts@eris.qinetiq.com>
Subject: Dell Latitude C400 - is this SpeedSetp capable?
Date: Tue, 13 Jul 2004 12:12:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200407131212.17298.m.watts@eris.qinetiq.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: Text/Plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Subject says it all really...

I do know that if I boot with no AC power it runs at ~800MHz, but plugging =
the=20
AC back in changes nothing.


/proc/cpuinfo is:

$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 11
model name      : Intel(R) Pentium(R) III Mobile CPU      1200MHz
stepping        : 1
cpu MHz         : 1196.370
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov =
pat=20
pse36 mmx fxsr sse
bogomips        : 2375.68


=2D --=20
Mark Watts
Senior Systems Engineer
QinetiQ Trusted Information Management
Trusted Solutions and Services group
GPG Public Key ID: 455420ED

=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA88ORBn4EFUVUIO0RAiToAJ47bZv6ccgnbUaoYxU2/Jjrqrz3uACfdM2W
PUt8P6LaChGvorONqwZm/S8=3D
=3DWgPN
=2D----END PGP SIGNATURE-----
