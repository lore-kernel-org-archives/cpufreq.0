From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: My latest powernow-k8.c
Date: Fri, 19 Mar 2004 15:33:06 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040319143306.GA7246@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C59A@txexmtae.amd.com>
	<20040319112429.GB5726@elf.ucw.cz>
	<20040319124122.GG28592@poupinou.org>
	<20040319133517.GA28122@dominikbrodowski.de>
	<20040319135605.GD248@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0947800736=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040319135605.GD248@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Pavel Machek <pavel@ucw.cz>
Cc: Bruno Ducrot <ducrot@poupinou.org>, Cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============0947800736==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2004 at 02:56:05PM +0100, Pavel Machek wrote:
> Hi!
> > > > > Attached are my latest .c and .h ... I am sending the whole files=
 rather than patches, as a check that I did not miss a patch that you wante=
d. Mail here has been a little less reliable that one might wish for.
> > > > >=20
> > > > > I added back in the cpu number in the dprintks to aid MP debuggin=
g. I fixed a PSB problem where the battery limits were getting lost. And, I=
 tweaked the smp processor init stuff as discussed in emails.
> > > > >=20
> > > > > I am still thinking about the FIXME where Dominik asked for more =
validity checking. So, that is still FIXME.
> > > >=20
> > > > Huh, now this is strange:
> > > >=20
> > > > root@amd:~# echo "0%88%88%powersave" > /proc/cpufreq
> > > > root@amd:~# cat /proc/cpufreq
> > > >           minimum CPU frequency  -  maximum CPU frequency  -  policy
> > > > CPU  0      1584000 kHz ( 88 %)  -    1600000 kHz ( 88 %)  - powers=
ave
> > > > root@amd:~#
> >=20
> > Why is this strange? Can you elaborate, please?
>=20
> CPU can not do 1.584MHz. Why did it round 88% down to 1.584GHz but
> maximum frequency  1.6GHz? Kernel 2.6.

1.8 GHz * 0.88 =3D 1584000 kHz -- min and max are set to this value at firs=
t.
As there is no state the CPU can be set to in between min and max, the max
value is increased to the next higher state [see
cpufreq_frequency_table_verify()] So there's nothing strange here, IMHO.

	Dominik

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAWwSiZ8MDCHJbN8YRAoYjAKCSCkOsZt+mBZkDd9b+T6ktrGBF2QCgjDXu
wyxgUUz8cJ13I0/ExebqhQs=
=J1z9
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--


--===============0947800736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0947800736==--

