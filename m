From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8 updates
Date: Fri, 26 Mar 2004 13:27:42 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040326122742.GA8871@dominikbrodowski.de>
References: <20040326120151.GA3102@elf.ucw.cz>
	<20040326121915.GA207@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0378373951=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040326121915.GA207@elf.ucw.cz>
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
Cc: paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>


--===============0378373951==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2004 at 01:19:15PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > Few updates, enable ACPI, add common printing function, fix typo, move
> > "pst out of sequence" where it belongs, fix formating in
> > powernow-k8.h. I'm not quite sure what this is against, so this is
> > "eyes only".
>=20
> Its strange, ACPI code does not seem to mention batps at all, still
> cpu goes to 800MHz when I unplug the cord... Perhaps it should at
> least say something into the syslog?

=2E.. again our differences about verbosity... :-)

	Dominik

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAZCG+Z8MDCHJbN8YRAmUAAJ4lUWeCfCovWM8KO1OQHTjEbfeaRACgnayT
D0JQ1Hv4q8i4QGjNQLKEtUA=
=WeI0
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--


--===============0378373951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0378373951==--

