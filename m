From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: oops on resume
Date: Mon, 09 Aug 2004 13:27:50 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1092072470.14584.29.camel@pc>
References: <1091734482.10552.20.camel@pc>
	<20040805195248.GA32045@redhat.com> <1091736171.10552.26.camel@pc>
	<20040805200857.GA28775@redhat.com> <1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040807132449.GA9569@dominikbrodowski.de>
	<1091905423.29221.1.camel@pc>
	<20040808162408.GA7986@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1201083539=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040808162408.GA7986@dominikbrodowski.de>
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


--===============1201083539==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-ZNG8Edy2QqX7C7deZw2B"


--=-ZNG8Edy2QqX7C7deZw2B
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-08-08 at 18:24 +0200, Dominik Brodowski wrote:
>=20
> Anyways, I've prepared a patch to work around the "local_irq_enable()" ca=
ll.
> Could you test it, please?

No oops this time, but here is the console output:

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
calling cpufreq_scale(2162688, 2200000, 2200000)
here we are in cpufreq_scale 0, old =3D 2162688, div =3D 2200000, mult =3D =
2200000
calling do_div(4757913600000, 2200000)
here we are in cpufreq_scale 1, returning 2162688
calling cpufreq_scale(2193778, 2200000, 2200000)
here we are in cpufreq_scale 0, old =3D 2193778, div =3D 2200000, mult =3D =
2200000
calling do_div(4826311600000, 2200000)
here we are in cpufreq_scale 1, returning 2193778
here we are in time_cpufreq_notifier 2, cpu_khz =3D 2193778
calling cpufreq_scale(1957794, 2200000, 2200000)
here we are in cpufreq_scale 0, old =3D 1957794, div =3D 2200000, mult =3D =
2200000
calling do_div(4307146800000, 2200000)
here we are in cpufreq_scale 1, returning 1957794
here we are in time_cpufreq_notifier 3, fast_gettimeoffset_quotient =3D 195=
7794
here we are in set_cyc2ns_scale 0, cpu_mhz =3D 2193
here we are in time_cpufreq_notifier 4
here we are in time_cpufreq_notifier 5
here we are in time_cpufreq_notifier 6
here we are in cpufreq_scale 0, old =3D 2162688, div =3D 2200000, mult =3D =
2200000
calling do_div(4757913600000, 2200000)
here we are in cpufreq_scale 1, returning 2162688
PM: Finishing up.
PCI: Setting latency timer of device 0000:00:1d.0 to 64
PCI: Setting latency timer of device 0000:00:1d.0 to 64
ACPI: PCI interrupt 0000:00:1f.1[A] -> GSI 11 (level, low) -> IRQ 11
eth0: command 0x5800 did not complete! Status=3D0xffff
eth0: command 0x2804 did not complete! Status=3D0xffff
drivers/acpi/osl.c:737: spin_lock(drivers/acpi/osl.c:21fe0bf8) already lock=
ed by drivers/acpi/osl.c/737
drivers/acpi/osl.c:756: spin_unlock(drivers/acpi/osl.c:21fe0bf8) not locked
Restarting tasks... done
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x5800 did not complete! Status=3D0xffff
eth0: command 0x2804 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff
eth0: command 0x3002 did not complete! Status=3D0xffff


So we do hit "time_cpufreq_notifier 6" now, but we also get some errors
about spinlocks.  The screen is black and my ssh session is dead so I am
not so sure of the state of the machine.  I should have put a getty on
that serial console.  Wait, I just logged in "blindly" on the console
and did a shutdown, so it seems to have resumed ok, apart from the above
issues.

b.


--=-ZNG8Edy2QqX7C7deZw2B
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBF7QWl3EQlGLyuXARAlYVAKDScfpmwJp7su7S7/U7VM/rrnaGrgCfTMpK
Kdrwp5l9Vgb18IF04pZs3LI=
=cF/R
-----END PGP SIGNATURE-----

--=-ZNG8Edy2QqX7C7deZw2B--



--===============1201083539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1201083539==--


