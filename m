From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: new user + a question :-)
Date: Fri, 12 Mar 2004 15:34:07 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040312143407.GA4813@dominikbrodowski.de>
References: <200402280040.i1S0e4rA007642@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0745337755=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200402280040.i1S0e4rA007642@localhost.localdomain>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Franco <net.surfer@tiscali.it>
Cc: cpufreq@www.linux.org.uk


--===============0745337755==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2004 at 01:40:03AM +0100, Franco wrote:
> Hello,
>=20
> I am a new user in this list. I am not a developer,
> and I am using kernel 2.6.3. I have already read
> the files under Documentation/cpu-freq, and seen
> the list of supported processors in user-guide.txt.
>=20
> If I have understood correctly, there are two kinds of CPU,
> depending on whether they can do for dynamic frequency scaling
> themselves, or they require a governor. But, I wasn't able
> to find which are the CPUs of one type or the other.
> Could you clarify this for me? (just for x86 architecture)

"longrun"-capable processors from Transmeta (Crusoe and Efficeon?) do
dynamic frequency scaling by themselves, all others require governors.

> ...cutting this mail short, and saying it with different words:
> I'm going to buy new hardware, and I'd really like
> to have dynamic frequency scaling (with linux!).
> Which is the safest bet?

As no dynamic frequency scaling governor (only static governors) are
currently in Linux kernels, the Transmeta processors are the "safest" bet.

> Which are the CPUs (if any) allowing me
> to do it now, and which ones are likely to be (well) supported
> in a near future?

However, the other CPUs supported by cpufreq can do dynamic frequency
scaling as well -- if a dynamic frequency scaling governor becomes available
for real and safe [*] usage.

	Dominik

[*] (technically and legally)

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUcpfZ8MDCHJbN8YRAskCAJ94oJF5xrRf0QM1a1RI9a35R8xYNgCfdk/V
w0EGGbm9ByAslS8eXRWyLHg=
=kYEP
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--


--===============0745337755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0745337755==--

