From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] fix up CPU detection in p4-clockmod
Date: Sun, 11 Jan 2004 12:33:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111113302.GA8308@dominikbrodowski.de>
References: <20040110151248.GA7989@dominikbrodowski.de>
	<20040110155048.GA17500@redhat.com>
	<20040110141946.6b0ed7ff.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============31948552838783018=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110141946.6b0ed7ff.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Andrew Morton <akpm@osdl.org>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk


--===============31948552838783018==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 02:19:46PM -0800, Andrew Morton wrote:
> Dave Jones <davej@redhat.com> wrote:
> >
> > On Sat, Jan 10, 2004 at 04:12:48PM +0100, Dominik Brodowski wrote:
> >  > Too many users use the p4-clockmod cpufreq driver instead of the more
> >  > advanced speedstep-centrino, speedstep-ich or even acpi drivers. All=
 of the
> >  > latter (usually) provide voltage scaling, while the p4-clockmod driv=
er only
> >  > offers a variant of frequency scaling. So, warn users if they try ou=
t this
> >  > driver instead.
> >  >=20
> >  > Also, instead of using a local copy, use the speedstep_lib infrastru=
cture
> >  > for detecting the processor speed. Adding the Pentium-M get_frequency
> >  > function to that module only costs about 200 bytes in object size.
> >=20
> > another idea might be putting the cpu identify code into a speedstep.ko
> > and have that request_module the right module
> >=20
>=20
> That seems like a more user-friendly approach to me.
>=20
> I'll merge Dominik's patch while we think about it.

We still need cpu identification code in the various speedstep-* drivers as
they need to do a few things differently on different CPUs...

The "request_modul"ing of the right module could be done more easily in
userspace, IMHO. A small sample is attached.

	Dominik

--vtzGhvizbBRQ85DL
Content-Type: application/x-sh
Content-Disposition: attachment; filename="cpufreq_x86.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A=0A# Copyright (C) 2004 Dominik Brodowski <linux@brodo.de>=0A#=
=0A# This script is free software; you can redistribute it and/or modify=0A=
# it under the terms of the GNU General Public License version 2 as=0A# pub=
lished by the Free Software Foundation.=0A#=0A# This script tries to detect=
 the best suited x86 cpufreq driver, and=0A# load it using "modprobe" comma=
nds.=0A#=0A#=0A=0ADEBUG=3D1=0A=0AKV=3D"$(uname -r | cut -c1-3)"=0A=0Aif [ "=
$KV" !=3D "2.6" ]; then=0A	echo "Wrong kernel version"=0A	exit 1=0Afi=0A=0A=
# the cpufreq drivers=0AACPI=3D0=0AP4CLOCKMOD=3D0=0ASPEEDSTEP_SMI=3D0=0ASPE=
EDSTEP_ICH=3D0=0ASPEEDSTEP_CENTRINO=3D0=0AFLAG_EST=3D0=0AFLAG_ACPI=3D0=0AFL=
AG_ACC=3D0=0A=0A# parse /proc/cpuinfo =0AFAMILY=3D"$(cat /proc/cpuinfo | gr=
ep "cpu family" | cut -c14-)"=0AMODEL=3D"$(cat /proc/cpuinfo | grep "model"=
 | grep -v "model name" | cut -c10-)"=0ASTEPPING=3D"$(cat /proc/cpuinfo | g=
rep "stepping" | cut -c12-)"=0A=0A# parse for vendor=0Acat /proc/cpuinfo | =
grep vendor_id | grep Intel &> /dev/null && INTEL=3D1=0A=0A# parse flags=0A=
cat /proc/cpuinfo | grep "flags" | grep " est" &> /dev/null && FLAG_EST=3D1=
=0Acat /proc/cpuinfo | grep "flags" | grep " acpi" &> /dev/null && FLAG_ACP=
I=3D1=0Acat /proc/cpuinfo | grep "flags" | grep " tm" &> /dev/null && FLAG_=
ACC=3D1=0A=0A=0Aif [ $DEBUG -eq 1 ]; then=0A	echo "CPU family is $FAMILY"=
=0A	echo "CPU model is $MODEL"=0A	echo "CPU stepping is $STEPPING"=0A	echo =
"CPU vendor: Intel? $INTEL"=0Afi=0A=0A=0Aif [ $INTEL -eq 1 ];  then=0A	case=
 "$FAMILY" in=0A		"6")=0A			if [ $DEBUG -eq 1 ]; then=0A				echo "Pentium 3=
 or Pentium M detected."=0A			fi=0A			case "$MODEL" in=0A				"9")=0A					if=
 [ "$STEPPING" =3D=3D "5" ] ; then=0A						if [ $FLAG_EST -eq 1 ]; then=0A	=
						SPEEDSTEP_CENTRINO=3D1=0A						fi=0A					fi=0A					;;=0A				"8")=0A		=
			SPEEDSTEP_SMI=3D1=0A					SPEEDSTEP_ICH=3D1=0A					;;=0A				"11")=0A					=
SPEEDSTEP_ICH=3D1=0A					;;=0A				*)=0A					echo "Unknown CPU."=0A					;;=
=0A			esac=0A			;;=0A		"15")=0A			if [ $DEBUG -eq 1 ]; then=0A				echo "Pen=
tium 4 detected."=0A			fi=0A			if [ "$MODEL" =3D=3D "2" ]; then=0A				case =
"$STEPPING" in=0A					"4")=0A						SPEEDSTEP_ICH=3D1=0A						;;=0A					"7")=
=0A						SPEEDSTEP_ICH=3D1=0A						;;=0A					"9")=0A						SPEEDSTEP_ICH=3D1=
=0A						;;=0A					*)=0A						true=0A						;;=0A				esac=0A			fi=0A			;;=0A=
		*)=0A			echo "unknown Intel Processor. Aborting."=0A			exit 1=0A			;;=0A	=
esac=0A	if [ $FLAG_ACPI -eq 1 ]; then=0A		if [ $FLAG_ACC -eq 1 ]; then=0A		=
	P4CLOCKMOD=3D1;=0A		fi=0A	fi=0A	ACPI=3D1=0Afi=0A=0Aif [ $DEBUG -eq 1 ]; th=
en=0A	echo "ACPI? $ACPI"=0A	echo "P4CLOCKMOD? $P4CLOCKMOD"=0A	echo "SPEEDST=
EP_CENTRINO? $SPEEDSTEP_CENTRINO"=0A	echo "SPEEDSTEP_ICH? $SPEEDSTEP_ICH"=
=0A	echo "SPEEDSTEP_SMI? $SPEEDSTEP_SMI"=0Afi=0A=0Aif [ $SPEEDSTEP_CENTRINO=
 -eq 1 ]; then=0A	modprobe speedstep-centrino=0Afi=0A=0Aif [ $SPEEDSTEP_ICH=
 -eq 1 ]; then=0A	modprobe speedstep-ich=0Afi=0A=0Aif [ $ACPI -eq 1 ]; then=
=0A	modprobe acpi=0Afi=0A=0Aif [ $P4CLOCKMOD -eq 1 ]; then=0A	modprobe p4-c=
lockmod=0Afi=0A=0Aif [ $SPEEDSTEP_SMI -eq 1 ]; then=0A	modprobe speedstep-s=
mi=0Afi=0A
--vtzGhvizbBRQ85DL--

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAATRuZ8MDCHJbN8YRAtIJAJ46Q3TjZPVAK0aoZzGfyyqNTXKxDQCfbG8B
JEqRet2UrtjnWl4QlCOzrHw=
=fWut
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--


--===============31948552838783018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============31948552838783018==--

