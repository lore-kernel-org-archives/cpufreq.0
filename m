From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq segfaults when network cable plugged in
Date: Sun, 25 Apr 2004 15:44:20 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040425134420.GC8772@dominikbrodowski.de>
References: <20040412004335.5995e422.thecoop@runbox.com>
	<20040412083058.GB7785@dominikbrodowski.de>
	<20040412190024.6b78f3b9.thecoop@runbox.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0689208238=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040412190024.6b78f3b9.thecoop@runbox.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Simon Cooper <thecoop@runbox.com>
Cc: cpufreq@www.linux.org.uk


--===============0689208238==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2004 at 07:00:24PM +0100, Simon Cooper wrote:
> On Mon, 12 Apr 2004 10:30:58 +0200
> Dominik Brodowski <linux@dominikbrodowski.de> wrote:
>=20
> > On Mon, Apr 12, 2004 at 12:43:35AM +0100, Simon Cooper wrote:
> > > right, this is very strange, cpufreq (compiled into the kernel) segfa=
ults
> > > whenever the network cable on my laptop is plugged in on bootup but b=
oots
> > > ok when it is plugged in after the kernel has loaded. i can post the =
entire
> > > segfault msg but it'll need me to write it all down. driver is 'r8139'
> > > (1000Mbps card), kernel version 2.6.5-mm2
> >=20
> > Hm, this is really very strange.=20
> >=20
> > Which cpufreq drivers do you use / are compiled into the kernel?
> > What are the last two to four functions called, where's the EIP at
> > the segfault? [the first few function names mentioned in the oops]
> >=20
> > Thanks,
> > 	Dominik
> >=20
>=20
> well, technically its a kernel oops (attempted ot kill init). powersave a=
nd performance govenors are compiled in, using p4_clockmod driver. Sometime=
s it boots fine with the cable in, but it oops's most of the time:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
018
> ...
> EIP: 0060:[<c02f7c45>]  Not tainted VLI
> EIP is at cpufreq_notify_transition+0x79/0x98
> ...
> Call trace:
> [<c010f543>] cpufreq_p4_setdc+0x1eb/0x306
> [<c01706d3>] d_lookup+0x29/0x52
> [<c010f6bb>] cpufreq_p4_target+0x5d/0x69
> [<c02f757d>] __cpufreq_driver_target+0x22/0x26
> ...

This very strange. Especially as all such NULL pointer dereferences would
already happen _earlier_. It seems to me that this might be a bug in the
networking driver, which -randomly?- affects unrelated other
kernel/userspace components...

	Dominik

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAi8C0Z8MDCHJbN8YRAnRuAJwNCO7EPSjkrXlWBj8b6yBIKbrjmwCeLgmD
yTsQpZ2HpQbTIG23BTtCU7w=
=ndFH
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--


--===============0689208238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0689208238==--

