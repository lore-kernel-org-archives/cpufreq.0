From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.6 kernel crashes - cpufreq
Date: Sat, 20 Dec 2003 19:35:51 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031220183551.GA4140@dominikbrodowski.de>
References: <3FE48A30.9010805@markgillespie.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============41226240101861933=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <3FE48A30.9010805@markgillespie.co.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Mark Gillespie <email@markgillespie.co.uk>
Cc: Cpufreq@www.linux.org.uk


--===============41226240101861933==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2003 at 05:43:12PM +0000, Mark Gillespie wrote:
> well, I decided to have a go at putting a 2.6 kernel together for my=20
> eden miniIITX system (currently running 2.4.23).  I compiled the kernel,=
=20
> and rebooted, but the kernel panics and does a stack dump.  It CPUFreq=20
> and the userspace governer seems to be the falling over point.
>=20
> Is this a know problem?  Anything I can do to work around it?

I think it might be an ACPI problem again... can you do the following,
please?
a) write down the call trace [function names are enough]
b) disable CONFIG_X86_ACPI_CPUFREQ and try again

Thanks, and happy holidays,
	Dominik
--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/5JaHZ8MDCHJbN8YRAr39AJ9kjFHEupjdOx5hl4fT3Is0opplkgCfbLYX
JBDWHa8Kz+2P2jEhWknV2h8=
=QObQ
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--


--===============41226240101861933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============41226240101861933==--

