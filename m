From: Gregor Hlawacek <lawa@gmx.at>
Subject: Re: dumb question from curious newbee.
Date: Sat, 21 Jun 2003 00:48:45 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200306210048.52920.lawa@gmx.at>
References: <1056093725.15596.2.camel@localhost> <20030620174437.GB1889@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_T948+xHJ5flwoWf";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030620174437.GB1889@brodo.de>
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


--Boundary-02=_T948+xHJ5flwoWf
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Am Freitag, 20. Juni 2003 19:44 schrieb Dominik Brodowski:
> On Fri, Jun 20, 2003 at 09:22:05AM +0200, Japie wrote:
> > Hello,
> >
> > Here's the dumb question; Is my AMD Duron with VIA-KT133 capable of
> > freq. stepping? (to reduce temp. in my server.)
>
> No, there's no frequency scaling for AMD Duron. But maybe throttling
> (power consumption is reduced linear to processing power) is available -
> try out ACPI [http://acpi.sf.net for more information]

Maybe I miss understood the whole cpufreq thing. but doesn't the cpufreq=20
thing do exactly that thing. My AMD Duron 1.1 GHz can be slowed down to=20
500MHz with your backport from cpufreq to 2.4.19, or did I get something=20
wrong

Gregor

btw: will there be any backport of powernow-k7 to 2.4.21?


=2D-=20
Gregor Hlawacek                                                  Austria
http://www.unileoben.ac.at/~m9327555/        May the source be with you!
 This posting is 100% M$ free. Guaranteed by Tux, the friendly penguin.

--Boundary-02=_T948+xHJ5flwoWf
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+849Ter3X+/vN824RAg1KAKCyf2X2oe3JLGJoVr9vDTCHZ9fbAgCfdOtJ
/R1bhxAzG3Sube3NESL5GIs=
=sT8Y
-----END PGP SIGNATURE-----

--Boundary-02=_T948+xHJ5flwoWf--
