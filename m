From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Fri, 06 Aug 2004 13:43:34 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091814215.10552.133.camel@pc>
References: <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0667246369=="
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


--===============0667246369==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-0oHy6+HCv6spxwEsn2IR"


--=-0oHy6+HCv6spxwEsn2IR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-08-05 at 23:09 +0200, Dominik Brodowski wrote:
>=20
> My bet is that speedstep_get_processor_frequency() returns something=20
> between one and 100000 kHz instead of the proper value _only_ _upon_
> _resuming_.

What do _I_ win?  :-)

>  So it'd be great if you could enable SPEEDSTEP_DEBUG in both
> files mentioned above, re-test the "resume process", and tell us what the
> lines right before the oops say.

OK, enabled, and a boatload of other debug that I inserted in there:

Back to C!
zapping low mappings.
speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x16300a16 0x0
FSB code =3D 0, msr_lo =3D 372247062
fsb =3D 100000
mult =3D 372247062
speedstep-lib: P4 - FSB 100000 kHz; Multiplier 22
pentium4_get_frequency() returns =3D 2200000
Warning: CPU frequency out of sync: cpufreq and timingcore thinks of 120000=
0, is 2200000 kHz.
here we are in time_cpufreq_notifier 0
here we are in time_cpufreq_notifier 1
here we are in cpufreq_scale 0, old =3D 2162688, div =3D 2200000, mult =3D =
2200000
calling do_div(4757913600000, 2200000)
here we are in cpufreq_scale 1, returning 2162688
here we are in cpufreq_scale 0, old =3D 2193684, div =3D 2200000, mult =3D =
2200000
calling do_div(4826104800000, 2200000)
here we are in cpufreq_scale 1, returning 2193684
here we are in time_cpufreq_notifier 2, cpu_khz =3D 2193684
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
cket(U) pcmcia_core(U) sunrpc(U) 3c59x(U) floppy(U) sg(U) scsi_mod(U) dm_mo=
d(U) uhci_hcd(U) button(U) battery(U) asus_acpi(U) ac(U) radeon(U) md5(U) i=
pv6(U) ext3(U)
jbd(U)
CPU:    0
EIP:    0060:[<02111fd6>]    Not tainted
EFLAGS: 00000202   (2.6.7-1.503custom)
EIP is at time_cpufreq_notifier+0x35d/0x36c
eax: 0233f4e8   ebx: 00000891   ecx: 0233d480   edx: 00000000
esi: 00000891   edi: 02302986   ebp: 001ddff6   esp: 204f4eb4
ds: 0068   es: 007b   ss: 0068
Process bash (pid: 4250, threadinfo=3D204f4000 task=3D1eca5830)
Stack: 02302a53 e0f84e80 00000000 0233ccc0 204f4ef0 00000008 00000004 0212c=
929
       204f4ef0 21f6b684 023c1828 02291741 02324f2b 00124f80 002191c0 00000=
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
Code: e8 cd ce 00 00 83 c4 0c 31 c0 5b 5e 5f 5d c3 55 bd a4 cc 33

Here is my printk littered time_cpufreq_notifier to correlate all those
messages above:

static int
time_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
		       void *data)
{
	struct cpufreq_freqs *freq =3D data;

printk("here we are in time_cpufreq_notifier 0\n");
	write_seqlock_irq(&xtime_lock);
	if (!ref_freq) {
		ref_freq =3D freq->old;
		loops_per_jiffy_ref =3D cpu_data[freq->cpu].loops_per_jiffy;
#ifndef CONFIG_SMP
		fast_gettimeoffset_ref =3D fast_gettimeoffset_quotient;
		cpu_khz_ref =3D cpu_khz;
#endif
	}

	if ((val =3D=3D CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
	    (val =3D=3D CPUFREQ_POSTCHANGE && freq->old > freq->new) ||
	    (val =3D=3D CPUFREQ_RESUMECHANGE)) {
printk("here we are in time_cpufreq_notifier 1\n");
		if (!(freq->flags & CPUFREQ_CONST_LOOPS))
			cpu_data[freq->cpu].loops_per_jiffy =3D cpufreq_scale(loops_per_jiffy_re=
f, ref_freq, freq->new);
#ifndef CONFIG_SMP
		if (cpu_khz)
			cpu_khz =3D cpufreq_scale(cpu_khz_ref, ref_freq, freq->new);
printk("here we are in time_cpufreq_notifier 2, cpu_khz =3D %lu\n", cpu_khz=
);
		if (use_tsc) {
			if (!(freq->flags & CPUFREQ_CONST_LOOPS)) {
				fast_gettimeoffset_quotient =3D cpufreq_scale(fast_gettimeoffset_ref, f=
req->new, ref_freq);
printk("here we are in time_cpufreq_notifier 3, fast_gettimeoffset_quotient=
 =3D %lu\n", fast_gettimeoffset_quotient);
				set_cyc2ns_scale(cpu_khz/1000);
			}
		}
#endif
printk("here we are in time_cpufreq_notifier 4\n");
	}
printk("here we are in time_cpufreq_notifier 5\n");
	write_sequnlock_irq(&xtime_lock);
printk("here we are in time_cpufreq_notifier 6\n");

	return 0;
}

Notice in the debug output, we never get the "here we are in
time_cpufreq_notifier 6" message.

Thots?

b.


--=-0oHy6+HCv6spxwEsn2IR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBE8NGl3EQlGLyuXARAuvpAJ0YoyQpHsVrxuADaGc/4v58Wn+IwQCg122c
QAbZqmtOtq4BtAbg443hAZc=
=1HWn
-----END PGP SIGNATURE-----

--=-0oHy6+HCv6spxwEsn2IR--



--===============0667246369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0667246369==--


