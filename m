From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 16:41:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110154110.GA8735@dominikbrodowski.de>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============47378314454775294=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040110152145.GA10160@grep.be>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Wouter Verhelst <wouter@grep.be>
Cc: cpufreq@www.linux.org.uk


--===============47378314454775294==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2004 at 04:21:45PM +0100, Wouter Verhelst wrote:
> On Sat, Jan 10, 2004 at 02:18:24PM +0100, Dominik Brodowski wrote:
> > On Sat, Jan 10, 2004 at 12:08:00PM +0100, Wouter Verhelst wrote:
> > > Vanilla 2.6.1, but I had the same problem with 2.6.0 (didn't try
> > > p4-clockmod on any kernel before that).
> >=20
> > You shouldn't need to use p4-clockmod at all... speedstep-ich is a bett=
er
> > choice for your system...
>=20
> This doesn't seem to work, it says 'No such device'. I have a VIA 82C686
> south bridge, not an Intel one, so I guess that's the reason.

Unfortunately, you're right. VIA doesn't publish their spec sheets as Intel
does, so there's no speedstep-via driver (yet). Maybe acpi.ko works?

	Dominik

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAAB0WZ8MDCHJbN8YRAj2cAJ9SiOSZSbQBkLmPz7tPuqjpffFiEwCghu30
9121q3AE37VYp0ZgyvK0X2o=
=5Pkx
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--


--===============47378314454775294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============47378314454775294==--

