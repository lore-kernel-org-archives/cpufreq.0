From: Carlos Garcia Campos <carlosgc@gnome.org>
Subject: ANNOUNCE: GNOME CPU Frequency Scaling Monitor 0.3
Date: Sat, 02 Oct 2004 17:58:24 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1096732704.1055.11.camel@kalptl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0961196836=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============0961196836==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-v079MmIvL+wPXYvGSsEL"


--=-v079MmIvL+wPXYvGSsEL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,=20

Dominik Brodowski suggested me to announce the GNOME CPUFreq applet release=
s here :-)

Greetings

Application
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

GNOME CPUFreq Applet 0.3

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

GNOME CPUFreq Applet is a CPU Frequency Scaling Monitor for GNOME Panel

Features
=3D=3D=3D=3D=3D=3D=3D=3D

   * Support for proc or sys filesystems
   * Support for multiprocessor systems

Prerequisites
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

   * GNOME 2 libraries
   * GNOME Panel libraries
   * GNOME-VFS libraries
   * GConf

Overview of Changes in GNOME CPUFreq Applet 0.2.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

   * Added the possibility to change the CPU Frequency (Carlos Garc=C3=ADa)
   * Improved the behavior in userspace governor and /proc interface.=20
     Fixes Debian bug #273041 (Carlos Garc=C3=ADa)
   * Support for new governors (Dominik Brodowski, Carlos Garc=C3=ADa)
   * Not show the cpu number in the tooltip in monoprocessor systems
(Carlos Garc=C3=ADa)
   * Other minor bug fixes (Carlos Garc=C3=ADa)
   * New and updated translations:
   	- de (Hendrik Brandt)
  =20
Thanks to Alan Swanson, Dominik Brodowski, Marius Gedminas, etc. for bug
reporting

Additional Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The applet is now able to change the CPU frequency. To do that, a
generic command=20
line tool will be installed, and the applet will use it. Since it's
needed to be root=20
to change the CPU frequency, the command line tool will be installed
suid root.=20
But, this default behavior could be altered by passing arguments to the
configure=20
script.=20

If you don't want to install the command line tool, you can use --
disable-frequency-selector
If you want to install the command line tool, but you don't want it suid
root, you can=20
use --enable-suid=3Dno


Tarballs can be downloaded from
   http://carlosgc.linups.org/files/gnome-cpufreq-applet/gnome-cpufreq-
applet-0.3.tar.gz

CVS
   http://cvs.gnome.org/viewcvs/gnome-cpufreq-applet/

GNOME CPUFreq Applet is currently being packaged as part of Debian
Unstable
   http://packages.debian.org/unstable/gnome/gnome-cpufreq-applet.html

Screeshots
   http://carlosgc.linups.org/files/gnome-cpufreq-applet/shots/

Bugs can be reported to
   carlosgc gnome org

Suggestions, patches, comments, etc can be sent to
   carlosgc gnome org

GNOME Files
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

http://www.gnomefiles.org/app.php?soft_id=3D71


--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Carlos Garcia Campos a.k.a. KaL
   elkalmail@yahoo.es
   carlosgc@gnome.org
   http://carlosgc.linups.org
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
            =20
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0x523E6462

--=-v079MmIvL+wPXYvGSsEL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBXtAgjxBOalI+ZGIRAkW/AJ9Nm2GJVHoj9pzuZOAJ5xI8xWC5EwCfQ4Sg
Q00fOB+k7bzSfWLDbzfMwMs=
=8AB3
-----END PGP SIGNATURE-----

--=-v079MmIvL+wPXYvGSsEL--



--===============0961196836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0961196836==--


