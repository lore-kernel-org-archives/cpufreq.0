From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: add new p3m model
Date: Mon, 15 Mar 2004 15:38:27 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315143827.GA9696@dominikbrodowski.de>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315142022.GA7069@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308133135.GU2869@poupinou.org>
	<20040314143407.GA21991@dominikbrodowski.de>
	<20040315142101.GB7069@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0511276014=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040315142022.GA7069@devserv.devel.redhat.com>
	<20040315142101.GB7069@devserv.devel.redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Arjan van de Ven <arjanv@redhat.com>
Cc: davej@redhat.com, Bruno Ducrot <ducrot@poupinou.org>, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk


--===============0511276014==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2004 at 03:21:01PM +0100, Arjan van de Ven wrote:
>=20
> On Sun, Mar 14, 2004 at 03:34:07PM +0100, Dominik Brodowski wrote:
> > On Mon, Mar 08, 2004 at 12:15:31PM +0100, Arjan van de Ven wrote:
> > > Hi,
> > >=20
> > > the patch below adds support for my laptop (Dell Inspiron 2600) which=
 has
> > > ebx return 7 for the p3 mobile in it....
> >=20
> > Can you send a /proc/cpuinfo, please?
>=20
> processor	: 0
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 11
> model name	: Mobile Intel(R) Celeron(TM) CPU         1200MHz
                                  ^^^^^^^
so it's not a mobile Pentium III-M as you said before; but a Celeron.=20
Celeron's don't support SpeedStep [*].

On Mon, Mar 15, 2004 at 03:20:22PM +0100, Arjan van de Ven wrote:
>=20
> On Mon, Mar 15, 2004 at 03:15:17PM +0100, Dominik Brodowski wrote:
> > I like this patch -- I've modified it a bit so that it applies to 2.6.4=
 and
> > also handles Arjan's strange 0x07 Tualatin. Please apply, Dave.=20
>=20
> Well I don't.
> It's copping out by not autodetecting cases that can reasonably be
> autodetected...

Well, as I stated in the description of this patch, it is _too risky_ to
enable SpeedStep on unsupported processors -- and we're talking hardware
failures here.

	Dominik

[*] And while some Celerons may work with certain speedstep drivers, it's so
much out-of-spec that I don't want to risk hardware failure in other cases
and enable speedstep support unconditionally on Centrinos, or even on
specific Centrino models.

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVb/jZ8MDCHJbN8YRAjj+AJ9ksZwT3JW9cNcwun/4miUnN4S7DACeL/Tt
CEMNVh6Zxmze53vAydIecFM=
=rtjJ
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--


--===============0511276014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0511276014==--

