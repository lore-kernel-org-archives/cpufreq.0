From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: My latest powernow-k8.c
Date: Fri, 19 Mar 2004 14:35:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040319133517.GA28122@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C59A@txexmtae.amd.com>
	<20040319112429.GB5726@elf.ucw.cz>
	<20040319124122.GG28592@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0419965887=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040319124122.GG28592@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>


--===============0419965887==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2004 at 01:41:22PM +0100, Bruno Ducrot wrote:
> On Fri, Mar 19, 2004 at 12:24:29PM +0100, Pavel Machek wrote:
> > Hi!
> >=20
> > > Attached are my latest .c and .h ... I am sending the whole files rat=
her than patches, as a check that I did not miss a patch that you wanted. M=
ail here has been a little less reliable that one might wish for.
> > >=20
> > > I added back in the cpu number in the dprintks to aid MP debugging. I=
 fixed a PSB problem where the battery limits were getting lost. And, I twe=
aked the smp processor init stuff as discussed in emails.
> > >=20
> > > I am still thinking about the FIXME where Dominik asked for more vali=
dity checking. So, that is still FIXME.
> >=20
> > Huh, now this is strange:
> >=20
> > root@amd:~# echo "0%88%88%powersave" > /proc/cpufreq
> > root@amd:~# cat /proc/cpufreq
> >           minimum CPU frequency  -  maximum CPU frequency  -  policy
> > CPU  0      1584000 kHz ( 88 %)  -    1600000 kHz ( 88 %)  - powersave
> > root@amd:~#

Why is this strange? Can you elaborate, please?

	Dominik

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAWvcVZ8MDCHJbN8YRApT8AKCpLmqB30dYHEE4GEOcl9HGeGSQrACcC24H
1O/zB+Sx8+VjEqiMhJ94zuA=
=i4zK
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--


--===============0419965887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0419965887==--

