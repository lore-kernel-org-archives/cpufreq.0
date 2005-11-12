From: Bernd Paysan <bernd.paysan@gmx.de>
Subject: [PATCH] problems with Athlon64 X2 (dual core)
Date: Sat, 12 Nov 2005 18:33:36 +0100
Message-ID: <200511121833.47055.bernd.paysan@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0463542449=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

--===============0463542449==
Content-Type: multipart/signed; boundary="nextPart1263194.ShbaWHkvId";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1263194.ShbaWHkvId
Content-Type: multipart/mixed;
  boundary="Boundary-01=_6didDCAlxCb29xB"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_6didDCAlxCb29xB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

[already posted as bug report on the sourceforge page]

Hi, =20
 =20
As far as I can tell, cpufreq/powersaved (of 0.10.15.1, as in=20
SuSE 10.0) seems to have a  severe problem with the=20
Athlon64 X2 dual core chips. If I load just one core, the=20
CPU frequency boost is unreliable (toggles  between 1GHz=20
and 2GHz). Loading the second core, too, sort-of-fixes that=20
problem. =20
=20
The reason is obvious: The Athlon X2 has a *single* CPU =20
frequency setting which affects *both* cores. So you can't =20
simply use a SMP setting, treating the two CPUs as two =20
processors with two speed settings, you have to know that =20
it's a dual-core CPU, and that you can't independently set =20
the CPU frequency. If one core is loaded, both must run at =20
double frequency. =20
 =20
Note that the kernel does know about this fact: =20
 =20
/sys/devices/system/cpu/cpu0/cpufreq> cat affected_cpus  =20
0 1 =20
/sys/devices/system/cpu/cpu1/cpufreq> cat affected_cpus  =20
0 1 =20
 =20
Setting powersaved to be more verbose confirms the =20
confusion (the following is with one core loaded by an =20
endless loop, the other core loaded lightly): =20
 =20
=2D------------------------------------------------ =20
Nov 10 13:24:48 linux [powersave]: Info (setSpeed:90) =20
Speed set to: 1800000KHz  in =20
file /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed =20
Nov 10 13:24:48 linux [powersave]: Info (setSpeed:90) =20
Speed set to: 2000000KHz  in =20
file /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed =20
Nov 10 13:24:48 linux [powersave]: Info (adjustSpeed:196) =20
Speed directly set to max (2000000) MHz =20
Nov 10 13:24:48 linux [powersave]: Info =20
(decreaseSpeed:138) current speed: 2000000KHz     new =20
speed: 1800000KHz =20
Nov 10 13:24:48 linux [powersave]: Info (setSpeed:90) =20
Speed set to: 1800000KHz  in =20
file /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed =20
Nov 10 13:24:48 linux [powersave]: Info (adjustSpeed:207) =20
Speed decreased to (1800000) MHz =20
Nov 10 13:24:48 linux [powersave]: Info =20
(decreaseSpeed:138) current speed: 2000000KHz     new =20
speed: 1800000KHz =20
Nov 10 13:24:48 linux [powersave]: Info (setSpeed:90) =20
Speed set to: 1800000KHz  in =20
file /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed =20
Nov 10 13:24:48 linux [powersave]: Info (adjustSpeed:207) =20
Speed decreased to (1800000) MHz =20
Nov 10 13:24:48 linux [powersave]: Info (setSpeed:90) =20
Speed set to: 2000000KHz  in =20
file /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed =20
Nov 10 13:24:48 linux [powersave]: Info (adjustSpeed:196) =20
Speed directly set to max (2000000) MHz =20
Nov 10 13:24:48 linux [powersave]: Info =20
(decreaseSpeed:138) current speed: 1800000KHz     new =20
speed: 1000000KHz =20
Nov 10 13:24:48 linux [powersave]: Info (setSpeed:90) =20
Speed set to: 1000000KHz  in =20
file /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed =20
Nov 10 13:24:48 linux [powersave]: Info (adjustSpeed:207) =20
Speed decreased to (1000000) MHz =20
=2D------------------------------------------------ =20
 =20
This seems to be a pretty severe bug, rendering =20
cpufreq unreliable on a dual-core Athlon64.=20

Looking into the source confirms the problem. I suggest to do the=20
following:=20
=20
Look at cpufreq/affected_cpus, and store this as bitmask or list=20
instead of the number stored in the variable cpu now. There=20
should be only one object per chip (=3D set of affected processors).=20
=46or setSpeed, walk through all the processors defined in the=20
mask, get their load, and set the speed to the highest frequency=20
found.

I wrote a small "proof of the concept"-patch that takes the=20
affected_cpus data, and creates a bit-mask (implemented only for the=20
userspace part, since that's what I use). It doesn't eliminate the=20
second scanned CPU out of the list, but it works for me.

What do you think?

=2D-=20
Bernd Paysan
"If you want it done right, you have to do it yourself"
http://www.jwdt.com/~paysan/

--Boundary-01=_6didDCAlxCb29xB
Content-Type: text/x-diff; charset="us-ascii"; name="powersave-0.10.19.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="powersave-0.10.19.patch"

diff -u -r powersave-0.10.19.orig/daemon/cpufreq.cpp powersave-0.10.19/daem=
on/cpufreq.cpp
=2D-- powersave-0.10.19.orig/daemon/cpufreq.cpp	2005-10-24 17:45:43.0000000=
00 +0200
+++ powersave-0.10.19/daemon/cpufreq.cpp	2005-11-11 17:24:24.000000000 +0100
@@ -128,6 +128,9 @@
 		strstr << SYSFS_FILES << "cpu" << cpu << "/cpufreq/scaling_available_fre=
quencies";
 		AVAILABLE_FREQS_FILE =3D strstr.str();
 		strstr.str("");
+		strstr << SYSFS_FILES << "cpu" << cpu << "/cpufreq/affected_cpus";
+		AFFECTED_CPUS =3D strstr.str();
+		strstr.str("");
 	}
 	// supported speeds
=20
diff -u -r powersave-0.10.19.orig/daemon/cpufreq.h powersave-0.10.19/daemon=
/cpufreq.h
=2D-- powersave-0.10.19.orig/daemon/cpufreq.h	2005-10-24 17:45:43.000000000=
 +0200
+++ powersave-0.10.19/daemon/cpufreq.h	2005-11-11 15:46:23.000000000 +0100
@@ -89,6 +89,7 @@
 	 */
 	string MIN_SPEED_FILE;
 	string MAX_SPEED_FILE;
+	string AFFECTED_CPUS;
 	string AVAILABLE_FREQS_FILE;
=20
 	/** @brief configuration variables
@@ -183,6 +184,7 @@
 	/** @brief Stores to which CPU this object corresponds
 	 *  This is the same as the maps are accessed object_cpus_xxx[cpu] */
 	int cpu;
+	long long cpumask;
=20
 	/** @brief This can be called outside after calling createCPUFreqObject()
 	 * =20
diff -u -r powersave-0.10.19.orig/daemon/cpufreq_userspace.cpp powersave-0.=
10.19/daemon/cpufreq_userspace.cpp
=2D-- powersave-0.10.19.orig/daemon/cpufreq_userspace.cpp	2005-10-23 22:25:=
29.000000000 +0200
+++ powersave-0.10.19/daemon/cpufreq_userspace.cpp	2005-11-11 17:25:19.0000=
00000 +0100
@@ -24,6 +24,30 @@
=20
 #include "cpufreq.h"
=20
+/** @brief read values from a file, convert to bit mask */
+inline long long read_mask(const char *filename)
+{
+	char line[MAX_LINE_SIZE];
+	int offset =3D 0;
+	long long mask =3D 0;
+	char * tmp;
+	if (read_line(filename, line, sizeof line) < 0) {
+		// we already throw an error in read_line()
+		return 0;
+	} else {
+		pDebug(DBG_INFO, "Value '%s' read from %s", line, filename);
+		do {
+		  mask |=3D (((long long)1) << atoi(line+offset));
+		  tmp =3D strstr(line+offset, " ");
+		  if(tmp)
+		    offset =3D tmp - line;
+		  else
+		    break;
+		} while(line[offset] !=3D '\0');
+		return mask;
+	}
+}
+
 CPUFreq_Userspace::CPUFreq_Userspace(int sysfs, int cpu):CPUFreq_Interface=
(sysfs, cpu)
 {
=20
@@ -66,6 +90,7 @@
 	current_speed =3D 0;
 	last_cpu_load =3D 50;
 	new_speed =3D 0;
+	cpumask =3D read_mask(AFFECTED_CPUS.c_str());
=20
 #ifdef CPUFREQ_MEASURE
 	for (int x =3D 0; x <=3D MAX_SPEEDS; x++)
@@ -162,16 +187,25 @@
 	return 1;
 }
=20
=2Dint CPUFreq_Userspace::setMode(CPUFREQ_MODE mode)
+inline double min(double a, double b)
 {
+  return (a < b) ? a : b;
+}
=20
+int CPUFreq_Userspace::setMode(CPUFREQ_MODE mode)
+{
+        int i; double maxload=3D100.0;
 	/* throw these two lines out to force governor to be set */
 	if (mode =3D=3D CPUFreq_Interface::mode)
 		return 0;
=20
 	CPUFreq_Interface::mode =3D mode;
=20
=2D	adjustSpeed(getCPULoad(cpu));
+	for(i=3Dcpu; i < cpus; i++) {
+	  if((((long long)1)<<i) & cpumask)
+	    maxload=3Dmin(getCPULoad(i),maxload);
+	}
+	adjustSpeed(maxload);
 	return 0;
 }
=20
diff -u -r powersave-0.10.19.orig/scripts/rcpowersaved powersave-0.10.19/sc=
ripts/rcpowersaved
=2D-- powersave-0.10.19.orig/scripts/rcpowersaved	2005-10-25 10:08:09.00000=
0000 +0200
+++ powersave-0.10.19/scripts/rcpowersaved	2005-11-11 17:37:20.000000000 +0=
100
@@ -64,7 +64,7 @@
 test -x $powersaved_BIN || exit 5
 # Check for existence of needed config file and read it
=20
=2DCONFIG=3D/usr/local/etc/powersave
+CONFIG=3D/etc/powersave
=20
 test -r $CONFIG || exit 6
 . $CONFIG/common

--Boundary-01=_6didDCAlxCb29xB--

--nextPart1263194.ShbaWHkvId
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBDdid6i4ILt2cAfDARAp8JAJ4641bEP+mv3KLB/9cpE+1Wc7LgmwCg4+gC
pvyvnxccbfw9NsGRidBhW3s=
=tuQ9
-----END PGP SIGNATURE-----

--nextPart1263194.ShbaWHkvId--


--===============0463542449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0463542449==--

