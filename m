From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Invoking cpufreq from a C program
Date: Sun, 8 Feb 2004 17:07:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040208160728.GE19441@dominikbrodowski.de>
References: <000001c3e75d$f2817110$0200a8c0@LETHALXP>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4311339882361156=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <000001c3e75d$f2817110$0200a8c0@LETHALXP>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Drew Varner <drew.varner@us.army.mil>
Cc: cpufreq@www.linux.org.uk


--===============4311339882361156==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 30, 2004 at 01:21:57PM -0500, Drew Varner wrote:
> Hey Folks,
>=20
> I want to invoke cpufreq (change processor performance states) from C cod=
e.
> Should I use the /proc interface or import the cpufreq libraries?

You should use the sysfs interface, and the userspace cpufreq governor.

However, a kernel based cpufreq governor might be a better choice --
depending on what you intend to do...

	Dominik

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAJl7AZ8MDCHJbN8YRAu23AJ0eJobep7WnobX9zn/DDQptv7gWRwCdGiqU
CbyM9cM0XoX0+5UyxR0riAc=
=PqNI
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--


--===============4311339882361156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============4311339882361156==--

