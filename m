From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4_clockmod or speedstep_ich | acpi?
Date: Wed, 28 Jan 2004 17:53:06 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040128165306.GB6658@dominikbrodowski.de>
References: <4011EC55.5030304@sbh.eng.br> <20040124060321.GP25416@poupinou.org>
	<4015CFE8.1030002@corp.grupos.com.br>
	<20040127093911.GH25416@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============66710996239430576=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040127093911.GH25416@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--===============66710996239430576==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2004 at 10:39:11AM +0100, Ducrot Bruno wrote:
> On Tue, Jan 27, 2004 at 12:41:44AM -0200, Marcus Grando wrote:
> > Hi,
> >=20
> > But why my kernel show this messages, if celeron not support speedstep-=
ich?
> >=20
> > cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
> > cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufr=
eq
> > cpufreq: modules offers voltage scaling in addition of frequency=20
> > scaling. You
> > cpufreq: should use either one instead of p4-clockmod, if possible.
> >=20
>=20
> Because this code was added in order to tell people who have a
> P4m to take into account the speedstep-ich, etc.  Just that
> it seems this code is not able to distinguish yet p4m and celerons...

Will take a look at it.

	Dominik

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAF+jyZ8MDCHJbN8YRAibOAJ9bBleim2JnCNSlcnPa8seRqBrZawCfTIlI
P0uryCk1U5mtzL3VHFBX7Vs=
=cUwa
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--


--===============66710996239430576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============66710996239430576==--

