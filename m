From: Frank Mehnert <fm3@os.inf.tu-dresden.de>
Subject: Re: speedstep-piix4 don't work
Date: Fri, 11 Jul 2003 18:08:34 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307111808.34663.fm3@os.inf.tu-dresden.de>
References: <3F0AED86.7040500@theorem.ca> <200307111711.14429.fm3@os.inf.tu-dresden.de> <20030711154859.GH22636@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_CEuD/usUfFPnLMl";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030711154859.GH22636@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: cpufreq@www.linux.org.uk


--Boundary-02=_CEuD/usUfFPnLMl
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Friday 11 July 2003 17:48, Ducrot Bruno wrote:
> On Fri, Jul 11, 2003 at 05:11:09PM +0200, Frank Mehnert wrote:
> Content-Description: signed data
>
> > On Wednesday 09 July 2003 12:08, Ducrot Bruno wrote:
> > > Ok.  Could you remove the lines:
> > >     145         /* We may have to define a 'good' throttling duty ? */
> > >     146         pcntrl &=3D ~(0x7 << 1);
> > >     147         pcntrl |=3D (0x3 << 1);
> > >     148
> > >
> > > That will done exactly the same stuff as the old independant kernel
> > > module. If that still do not work, well I will be a little puzzled
> > > then, but give me still dmesg in any case.
> >
> > I'm a different user than the original one which opened this thread.
>
> Please test attached patch.  (Shame on me).
>
> Index: speedstep-piix4.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file:
> /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c=
,v
> retrieving revision 1.6
> diff -u -r1.6 speedstep-piix4.c
> --- speedstep-piix4.c	11 Jul 2003 13:11:15 -0000	1.6
> +++ speedstep-piix4.c	11 Jul 2003 15:43:05 -0000
> @@ -124,8 +124,9 @@
>  	value =3D inb_p(pmbase + gpo_hilo_port);
>
>  	/* compute new state */
> -	value &=3D ~(1 << gpo_hilo_shift);
> -	value |=3D state << gpo_hilo_shift;
> +	value =3D state ? (value | (1 << gpo_hilo_shift)) : \
> +		        (value & ~(1 << gpo_hilo_shift));
> +

This doesn't change anything (I have testet it) since state is 0 or
1 at this place.

=46rank
=2D-=20
## Dept. of Computer Science, Dresden University of Technology, Germany ##
## http://os.inf.tu-dresden.de/~fm3                                     ##

--Boundary-02=_CEuD/usUfFPnLMl
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/DuEC6z8pigLf3EcRAmEqAJ0VnrxYCw/jp4vB+j5J1q8jJb3bKQCghess
T4+cpGievFA50p9vhYJVHmI=
=mdIE
-----END PGP SIGNATURE-----

--Boundary-02=_CEuD/usUfFPnLMl--
