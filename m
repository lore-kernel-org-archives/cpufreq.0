From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Desktop with DVS
Date: Mon, 22 Mar 2004 21:17:33 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322201733.GA9780@dominikbrodowski.de>
References: <8825450.1079962608@d-128-74-92.bootp.Virginia.EDU>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0055587846=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <8825450.1079962608@d-128-74-92.bootp.Virginia.EDU>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Zhijian Lu <zl4j@cms.mail.virginia.edu>
Cc: cpufreq@www.linux.org.uk


--===============0055587846==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2004 at 01:36:48PM -0500, Zhijian Lu wrote:
> Hello,
>=20
> This may be off the loop. But does anyone know if there are=20
> any desktop computers with dynamic voltage scaling capacity?

For x86{,_64}: AFAIK there are several choices:=20
- some x86_64 AMD [server] processors and mainboards support=20
  voltage scaling,
- there are some special mainboards which support Intel Pentium M processors
- the transmeta efficeon CPU supports dynamic voltage scaling without
  any operating system interaction
- maybe some others (VIA) which I've missed.

Please note that unless you chose Transmeta CPUs, you also need support from
the operating system to _dynamically_ change the frequency. This should be
implemented in form of a cpufreq governor; some thus patches have been
discussed on this mailing list, none have been in a mergeable state. But you
can find them in the archives, if you look hard :-)

	Dominik




--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAX0ndZ8MDCHJbN8YRAsMVAJ4y5B0RqmmqWndNozNnXdAkFInIvACgg8O2
i9zgP3IDDGh8qJnV57YirAo=
=itEL
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--


--===============0055587846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0055587846==--

