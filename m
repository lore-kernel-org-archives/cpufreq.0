From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Acer Aspire  1350 broken PST
Date: Mon, 19 Apr 2004 13:54:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040419115421.GA19425@dominikbrodowski.de>
References: <c5osds$fed$1@sea.gmane.org> <20040416151135.GV8953@poupinou.org>
	<c5otiu$ime$1@sea.gmane.org> <20040416152432.GW8953@poupinou.org>
	<c5p3e0$6js$1@sea.gmane.org> <20040416182013.GZ8953@poupinou.org>
	<20040417093220.GA7975@dominikbrodowski.de>
	<20040417130021.GB8953@poupinou.org>
	<20040417165838.GA7553@dominikbrodowski.de>
	<20040419092624.GA13861@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0189918686=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040419092624.GA13861@poupinou.org>
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
Cc: jy <jy454@yahoo.fr>, cpufreq@www.linux.org.uk


--===============0189918686==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2004 at 11:26:24AM +0200, Bruno Ducrot wrote:
> On Sat, Apr 17, 2004 at 06:58:38PM +0200, Dominik Brodowski wrote:
> >=20
> > [*] though I do not know whether the timing core would be able to handl=
e it
> > generally...
>=20
> The problem is that AMD64 (and opterons)  processors do have expected
> behaviour, that is if you change the frequency, TSC clock will change
> as well, and there are SMP capable processors that are planed IIRC.
> Also, I think TSC timer will not work properly if powernow-k8 on such
> system (each processors would have different TSC frequencies),
> unless heavy changes to the TSC timer code.  I'm not sure if making
> it work does really matter, there is other good timers (like ACPI-timer)
> after all.

Even though most, if not all, AMD64 processors have HPET-timers on the
motherboards, there's still much tsc interaction going on :-(. Will take a
look at it soon.

	Dominik

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAg73tZ8MDCHJbN8YRApdGAKCkHTBIITN5FE2yt3gHnIFRHkumPACghoeg
vHXHLFHx8U7ZuyDW41EXXqQ=
=SPTU
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--


--===============0189918686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0189918686==--

