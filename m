From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4_clockmod or speedstep_ich | acpi?
Date: Wed, 28 Jan 2004 23:41:06 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040128224106.GA5987@dominikbrodowski.de>
References: <4011EC55.5030304@sbh.eng.br> <20040124060321.GP25416@poupinou.org>
	<4015CFE8.1030002@corp.grupos.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============40023157313669433=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <4015CFE8.1030002@corp.grupos.com.br>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Marcus Grando <marcus@corp.grupos.com.br>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============40023157313669433==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2004 at 12:41:44AM -0200, Marcus Grando wrote:
> Hi,
>=20
> But why my kernel show this messages, if celeron not support speedstep-ic=
h?
>=20
> cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
> cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
> cpufreq: modules offers voltage scaling in addition of frequency=20
> scaling. You
> cpufreq: should use either one instead of p4-clockmod, if possible.
>=20
> Regards
>=20
> Ducrot Bruno wrote:
> >On Sat, Jan 24, 2004 at 01:53:57AM -0200, Marcus Grando wrote:
> >
> >>Hi,
> >>
> >>I have a toshiba satellite a10 127, and use p4 clockmod in cpufreq. I=
=20
> >>look this kernel messages:
> >>
> >>cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
> >>cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufr=
eq
> >>cpufreq: modules offers voltage scaling in addition of frequency=20
> >>scaling. You
> >>cpufreq: should use either one instead of p4-clockmod, if possible.
> >>
> >
> >
> >...
> >
> >>CPU:     After generic identify, caps: bfebf9ff 00000000 00000000 00000=
000
> >>CPU:     After vendor identify, caps: bfebf9ff 00000000 00000000 000000=
00
> >>CPU: Trace cache: 12K uops, L1 D cache: 8K
> >>CPU: L2 cache: 256K
> >>CPU:     After all inits, caps: bfebf9ff 00000000 00000000 00000080
> >>CPU: Intel Mobile Intel(R) Celeron(R) CPU 2.00GHz stepping 09
> >
> >                             ^^^^^^^
> >		  A celeron is not speedstep capable.
> >

Could you try out this patch, please?

	Dominik

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.1-speedstep_lib_fix_p4m_detection"
Content-Transfer-Encoding: quoted-printable

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-01-16 =
20:30:36.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-01-28 23:32:49.=
637733272 +0100
@@ -184,17 +184,55 @@
 		if (c->x86_model !=3D 2)
 			return 0;
=20
-		if ((c->x86_mask !=3D 4) && /* B-stepping [M-P4-M] */
-			(c->x86_mask !=3D 7) && /* C-stepping [M-P4-M] */
-			(c->x86_mask !=3D 9))   /* D-stepping [M-P4-M or M-P4/533] */
-			return 0;
-
 		ebx =3D cpuid_ebx(0x00000001);
 		ebx &=3D 0x000000FF;
-		if ((ebx !=3D 0x0e) && (ebx !=3D 0x0f))
-			return 0;
=20
-		return SPEEDSTEP_PROCESSOR_P4M;
+		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->86_mask);
+
+		switch (c->x86_mask) {
+		case 4:=20
+			/*
+			 * B-stepping [M-P4-M]=20
+			 * sample has ebx =3D 0x0f, production has 0x0e.
+			 */
+			if ((ebx =3D=3D 0x0e) || (ebx =3D=3D 0x0f))
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		case 7:=20
+			/*
+			 * C-stepping [M-P4-M]
+			 * needs to have ebx=3D0x0e, else it's a celeron:
+			 * cf. 25130917.pdf / page 7, footnote 5 even
+			 * though 25072120.pdf / page 7 doesn't say
+			 * samples are only of B-stepping...
+			 */
+			if (ebx =3D=3D 0x0e)
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		case 9:
+			/*
+			 * D-stepping [M-P4-M or M-P4/533]
+			 *
+			 * this is totally strange: CPUID 0x0F29 is
+			 * used by M-P4-M, M-P4/533 and(!) Celeron CPUs.
+			 * The latter need to be sorted out as they don't
+			 * support speedstep.
+			 * Celerons with CPUID 0x0F29 may have either
+			 * ebx=3D0x8 or 0xf -- 25130917.pdf doesn't say anything
+			 * specific.
+			 * M-P4-Ms may have either ebx=3D0xe or 0xf [see above]
+			 * M-P4/533 have either ebx=3D0xe or 0xf. [25317607.pdf]
+			 * So, how to distinguish all those processors with
+			 * ebx=3D0xf? I don't know. Sort them out, and wait
+			 * whether someone complains.
+			 */
+			if (ebx =3D=3D 0x0e)
+				return SPEEDSTEP_PROCESSOR_P4M;
+			break;
+		default:
+			break;
+		}
+		return 0;
 	}
=20
 	switch (c->x86_model) {

--45Z9DzgjV8m4Oswq--

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAGDqCZ8MDCHJbN8YRAh1nAJ95vfad5mnLwMAFXfpOsY58cs0eggCfZRE+
70wvh8g9LGAxfOoc5FDB8LI=
=qOeE
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--


--===============40023157313669433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============40023157313669433==--

