From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [ANNOUNCE] cpufrequtils-0.1 released
Date: Fri, 17 Dec 2004 23:50:00 +0100
Message-ID: <20041217225000.GA8245@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0638048557=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org


--===============0638048557==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

cpufrequtils-0.1 is out and available at

http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils-0.1.tar.b=
z2

and will arrive the same place at kernel.org mirrors soon.

It conists of the following elements:


libcpufreq
----------

"libcpufreq" is a library which offers a unified access method for userspac=
e=20
tools and programs to the cpufreq core and drivers in the Linux kernel. This
allows for code reduction in userspace tools, a clean implementation of
the interaction to the cpufreq core, and support for both the sysfs and proc
interfaces [depending on configuration, see below].


utils
-----

"cpufreq-info" determines current cpufreq settings, and provides useful
debug information to users and bug-hunters.
"cpufreq-set" allows to set a specific frequency and/or new cpufreq policies
without having to type "/sys/devices/system/cpu/cpu0/cpufreq" all the time.


debug
-----

A few debug tools helpful for cpufreq have been merged into this package,
but as they are highly architecture specific they are not built by default.


compilation and installation
----------------------------

=2E/configure && make
su
make install

should suffice on most systems. It builds default libcpufreq,
cpufreq-set and cpufreq-info files and installs them in /usr/local/lib and
/usr/local/bin, respectively. Due to the autotoolization by Mattia Dongili
the standard options to make and make install, like "--prefix=3D/usr", can =
be
passed and (should) work correctly.


options and dependencies
------------------------

=2E/configure by default enables the sysfs interface, but disables the
deprecated /proc interface to the cpufreq core in the Linux kernel. For
the sysfs interface to build and work correctly, you need "libsysfs", which
is part of the "sysfsutils" package. Current requirement is
	sysfsutils-1.0.0
or later.

To disable the sysfs interface, pass the option "--disable-sysfs" to
=2E/configure.


To enable the (deprecated) /proc interface support, pass the option
"--enable-proc" to ./configure.


THANKS
------
Many thanks to Mattia Dongili who wrote the autotoolization and
libtoolization, the manpages and the italian language file for cpufrequtils=
;=20
to Dave Jones for his feedback and his dump_psb tool; to Bruno Ducrot for h=
is=20
powernow-k8-decode and intel_gsic tools as well as the french language file;
and to various others commenting on the pre-releases of cpufrequtils-0.1.


	Dominik

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBw2KYZ8MDCHJbN8YRAtFMAJ9BtIev5b2EzvH1RWVt63iAJpoa2ACdELkl
cjxxsG0pCGk31V7hWjGwmxY=
=FV+u
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============0638048557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0638048557==--

