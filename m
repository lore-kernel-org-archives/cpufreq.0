From: Gregor Hlawacek <lawa@gmx.at>
Subject: Re: dumb question from curious newbee.
Date: Sun, 22 Jun 2003 12:18:28 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200306221218.39757.lawa@gmx.at>
References: <1056093725.15596.2.camel@localhost> <200306210048.52920.lawa@gmx.at> <1056224149.ef4e0e799ffee@carlthompson.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_+JY9+NzPkxMieby";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1056224149.ef4e0e799ffee@carlthompson.net>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: Cpufreq@www.linux.org.uk


--Boundary-02=_+JY9+NzPkxMieby
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Am Samstag, 21. Juni 2003 21:35 schrieb Carl Thompson:
> Quoting Gregor Hlawacek <lawa@gmx.at>:
> > ...
> >
> > > No, there's no frequency scaling for AMD Duron. But maybe throttling
> > > (power consumption is reduced linear to processing power) is
> > > available
> >
> > -
> >
> > > try out ACPI [http://acpi.sf.net for more information]
> >
> > Maybe I miss understood the whole cpufreq thing. but doesn't the
> > cpufreq thing do exactly that thing. My AMD Duron 1.1 GHz can be slowed
> > down to 500MHz with your backport from cpufreq to 2.4.19, or did I get
> > something wrong
>
> The Regular AMD Duron has no support for PowerNow, and hence no support
> for CPUFreq.  Some versions of the AMD Mobile Duron _do_ have support for
> PowerNow and CPUFreq.  You probably have an AMD Mobile Duron, not an AMD
> Duron.  Different chip.

=C4hmm  okay your point thats right sorry

Gregor

> Carl Thompson
>
> > Gregor
> >
> > btw: will there be any backport of powernow-k7 to 2.4.21?
> >
> >
> > --
> > Gregor Hlawacek                                                =20
> > Austria http://www.unileoben.ac.at/~m9327555/        May the source be
> > with you! This posting is 100% M$ free. Guaranteed by Tux, the friendly
> > penguin.
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq


=2D-=20
Gregor Hlawacek                                                  Austria
http://www.unileoben.ac.at/~m9327555/        May the source be with you!
 This posting is 100% M$ free. Guaranteed by Tux, the friendly penguin.

--Boundary-02=_+JY9+NzPkxMieby
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD4DBQA+9YJ+er3X+/vN824RAlWtAJjfr+tJYsXTM1N+v+st79kgpyctAKCCQlyA
5KFBovrXTiXAjLSC/dhZzg==
=7y+3
-----END PGP SIGNATURE-----

--Boundary-02=_+JY9+NzPkxMieby--
