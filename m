From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Thu, 05 Aug 2004 17:45:37 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091742337.10552.44.camel@pc>
References: <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0311041658=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040805210916.GB23087@dominikbrodowski.de>
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
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk


--===============0311041658==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-E/fs8JUL6LAgA7Gz3Ghc"


--=-E/fs8JUL6LAgA7Gz3Ghc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-05 at 23:09 +0200, Dominik Brodowski wrote:
> My bet is that speedstep_get_processor_frequency() returns something=20
> between one and 100000 kHz instead of the proper value _only_ _upon_
> _resuming_.

Yeah.

> So it'd be great if you could enable SPEEDSTEP_DEBUG in both
> files mentioned above, re-test the "resume process", and tell us what the
> lines right before the oops say.

OK.  BTW: while building I got a compile error:

arch/i386/kernel/cpu/cpufreq/speedstep-smi.c: In function `speedstep_set_st=
ate':arch/i386/kernel/cpu/cpufreq/speedstep-smi.c:183: error: `freqs' undec=
lared (first use in this function)

I worked around that to get it to build, but something needs fixing
there, obviously.

The messages I get before the oops (and the oops for posterity):

Back to C!
zapping low mappings.
speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x16300a16 0x0
FSB code =3D 0, msr_lo =3D 372247062
fsb =3D 100000
mult =3D 372247062
speedstep-lib: P4 - FSB 100000 kHz; Multiplier 22
pentium4_get_frequency() returns =3D 2200000
Warning: CPU frequency out of sync: cpufreq and timingcore thinks of 120000=
0, i.do_div(4757913600000, 2200000)
do_div(4826899000000, 2200000)
do_div(4306623200000, 2200000)
divide error: 0000 [#1]
Modules linked in: parport_pc(U) lp(U) parport(U) autofs4(U) ds(U) yenta_so=
cket)CPU:    0
EIP:    0060:[<02111f15>]    Not tainted
EFLAGS: 00000216   (2.6.7-1.503custom)
EIP is at time_cpufreq_notifier+0x29c/0x2a3
eax: 0233f4e8   ebx: 00000892   ecx: 00217a7d   edx: 0000063c
esi: 000003ea   edi: 002191c0   ebp: 00000000   esp: 20704ec0
ds: 0068   es: 007b   ss: 0068
Process bash (pid: 3853, threadinfo=3D20704000 task=3D1f6b6630)
Stack: 0233ccc0 20704ef0 00000008 00000004 0212c929 20704ef0 21f6b684 023c1=
828
       02291741 02324d42 00124f80 002191c0 00000000 00124f80 002191c0 0210e=
bc0
       0235edb4 023548e0 0222c151 00000000 00000002 00000246 0222f17c 02139=
0ae
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
Code: 31 c0 5b 5e 5f 5d c3 55 bd a4 cc 33 02 57 56 53 83 ec 24 8b


--=-E/fs8JUL6LAgA7Gz3Ghc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBEqqBl3EQlGLyuXARAswuAJsHZ2mzT5PMgDJiJS3golKH/tNOvQCg2wB7
AEflcG8RQQO0o1iu0cjt440=
=4/4R
-----END PGP SIGNATURE-----

--=-E/fs8JUL6LAgA7Gz3Ghc--



--===============0311041658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0311041658==--


