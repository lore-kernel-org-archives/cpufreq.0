From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: New PowerManagement - cpufreq category?
Date: Mon, 16 Feb 2004 19:59:08 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040216185908.GA8531@dominikbrodowski.de>
References: <20040216081412.GA8955@dominikbrodowski.de>
	<6350000.1076946204@[10.10.2.4]>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============95809707218229723=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <6350000.1076946204@[10.10.2.4]>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: "Martin J. Bligh" <mbligh@aracnet.com>
Cc: bugme-admin@osdl.org, cpufreq@www.linux.org.uk


--===============95809707218229723==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2004 at 07:43:25AM -0800, Martin J. Bligh wrote:
> --Dominik Brodowski <mail@dominikbrodowski.de> wrote (on Monday, February=
 16, 2004 09:14:12 +0100):
>=20
> > Quoting
> > ------- Additional Comment #1 From Len Brown  2004-02-14 22:53 -------
> > from bug #2081:
> > "(we really should have a better category than power-management/other f=
or
> > cpufreq stuff)"
> >=20
> >=20
> > What do you think about a new component "cpufreq" as part of=20
> > "Power Management"?
>=20
> If it's a separated component that's receiving a fair number of bugs,=20
Currently, the open bugs #2025, #2081, #1696 and #2111 would fall under this
category. Maybe I missed some, though.

> then yes we could. Who is the maintainer,
Dave Jones <davej@redhat.com>

> and where does it lie under the source tree?
drivers/cpufreq/ and, for i386 [though other archs also support cpufreq]
arch/i386/kernel/cpu/cpufreq/

	Dominik

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAMRL8Z8MDCHJbN8YRAvJGAKCDPm+40lbsoSatq88mWjXGoiRgCgCbB/QP
/WPZ4ZVrdsw5yFGGuk4xzJE=
=8g4n
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--


--===============95809707218229723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============95809707218229723==--

