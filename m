From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Fri, 06 Aug 2004 18:10:28 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091830228.10552.170.camel@pc>
References: <1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040806211347.GB30427@redhat.com> <1091827110.10552.168.camel@pc>
	<20040806214403.GC30427@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1224770505=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040806214403.GC30427@redhat.com>
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
Cc: cpufreq@www.linux.org.uk


--===============1224770505==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-K5UGcxeQAVVlS13PUsnC"


--=-K5UGcxeQAVVlS13PUsnC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-08-06 at 22:44 +0100, Dave Jones wrote:
>=20
> I have that locally.

Heh.  Yeah, I guess so.

> Can you add some debug printk's just before the cpufreq_scale() calls
> in time_cpufreq_notifier ?  I'd like to know what's being passed there.
> Might be worth a printk actually _in_ cpufreq_scale() too, to make
> sure the args are getting through ok.

Here it is:

Back to C!
zapping low mappings.
speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x16300a16 0x0
FSB code =3D 0, msr_lo =3D 372247062
fsb =3D 100000
mult =3D 372247062
speedstep-lib: P4 - FSB 100000 kHz; Multiplier 22
pentium4_get_frequency() returns =3D 2200000
Warning: CPU frequency out of sync: cpufreq and timingcore thinks of 120000=
0, i.here we are in time_cpufreq_notifier 0
here we are in time_cpufreq_notifier 1
calling cpufreq_scale(2162688, 2200000, 2200000)
here we are in cpufreq_scale 0, old =3D 2162688, div =3D 2200000, mult =3D =
2200000
calling do_div(4757913600000, 2200000)
here we are in cpufreq_scale 1, returning 2162688
calling cpufreq_scale(2193684, 2200000, 2200000)
here we are in cpufreq_scale 0, old =3D 2193684, div =3D 2200000, mult =3D =
2200000
calling do_div(4826104800000, 2200000)
here we are in cpufreq_scale 1, returning 2193684
here we are in time_cpufreq_notifier 2, cpu_khz =3D 2193684
calling cpufreq_scale(1957878, 2200000, 2200000)
here we are in cpufreq_scale 0, old =3D 1957878, div =3D 2200000, mult =3D =
2200000
calling do_div(4307331600000, 2200000)
here we are in cpufreq_scale 1, returning 1957878
here we are in time_cpufreq_notifier 3, fast_gettimeoffset_quotient =3D 195=
7878
here we are in set_cyc2ns_scale 0, cpu_mhz =3D 2193
here we are in time_cpufreq_notifier 4
here we are in time_cpufreq_notifier 5
divide error: 0000 [#1]
Modules linked in: parport_pc(U) lp(U) parport(U) autofs4(U) ds(U) yenta_so=
cket)CPU:    0
EIP:    0060:[<02112032>]    Not tainted
EFLAGS: 00000202   (2.6.7-1.503custom)
EIP is at time_cpufreq_notifier+0x3b9/0x3c8
eax: 0233f4e8   ebx: 00000891   ecx: 0233d480   edx: 00000000
esi: 00000891   edi: 023029aa   ebp: 001ddff6   esp: 21162eb4
ds: 0068   es: 007b   ss: 0068
Process bash (pid: 4695, threadinfo=3D21162000 task=3D1ecde130)
Stack: 02302a77 e0f84e80 00000000 0233ccc0 21162ef0 00000008 00000004 0212c=
929
       21162ef0 21f6b684 023c1828 02291741 02324f4f 00124f80 002191c0 00000=
000
       00124f80 002191c0 0210ebc0 0235edb4 023548e0 0222c151 00000000 00000=
002
Call Trace:
 [<0212c929>] notifier_call_chain+0x17/0x2b
 [<02291741>] cpufreq_resume+0xa9/0xd1
 [<0210ebc0>] mtrr_restore+0x42/0x47
 [<0222c151>] sysdev_resume+0x55/0xa5
 [<0222f17c>] device_power_up+0x5/0xa
 [<021390ae>] suspend_enter+0x25/0x2d
 [<02139131>] enter_state+0x54/0x7f
 [<02139239>] state_store+0x84/0x99
 [<021391b5>] state_store+0x0/0x99
 [<021a56df>] subsys_attr_store+0x19/0x21
 [<021a5852>] flush_write_buffer+0x1d/0x22
 [<021a5879>] sysfs_write_file+0x22/0x35
 [<02160b77>] vfs_write+0xb6/0xe2
 [<02160c11>] sys_write+0x2c/0x42
Code: e8 71 ce 00 00 83 c4 0c 31 c0 5b 5e 5f 5d c3 55 bd a4 cc 33


--=-K5UGcxeQAVVlS13PUsnC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBFAHTl3EQlGLyuXARAiumAJ9C8Bx3BK8idMDG9FIge0bTRKQbNACeL8to
7X6dpmF7PKnWb1tfAXbXwy0=
=kUlM
-----END PGP SIGNATURE-----

--=-K5UGcxeQAVVlS13PUsnC--



--===============1224770505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1224770505==--


