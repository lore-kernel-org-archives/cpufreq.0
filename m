From: Arjan van de Ven <arjanv@redhat.com>
Subject: RE: [ACPI] _PDC method in DSDT
Date: 23 Jun 2003 09:59:11 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056355150.1699.4.camel@laptop.fenrus.com>
References: <F760B14C9561B941B89469F59BA3A84725A301@orsmsx401.jf.intel.com>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-t3Vw/yBdGAmYjQE0u6IG"
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <F760B14C9561B941B89469F59BA3A84725A301@orsmsx401.jf.intel.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: "Grover, Andrew" <andrew.grover@intel.com>
Cc: David Moore <dcm@acm.org>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq@www.linux.org.uk


--=-t3Vw/yBdGAmYjQE0u6IG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-06-23 at 09:11, Grover, Andrew wrote:

> However, since the recently added non-vendor-supported Pentium M cpufreq
> driver uses hardcoded tables and cpuid instead of relying on ACPI for
> this information anyways, adding _PDC support to processor.c would not
> affect its behavior. If that driver were changed to use ACPI for
> determining platform capabilities, like Windows and our released binary
> driver do, then yes, adding _PDC support would be important.

Intel is more than welcome to release the linux driver under the GPL :)

--=-t3Vw/yBdGAmYjQE0u6IG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA+9rNOxULwo51rQBIRAgAmAJ9lrfozcJujl2Vf385qBaAy6Fi+vQCfZ17h
3JW6y8JhL+1PY8oPAFlYwvA=
=uU7I
-----END PGP SIGNATURE-----

--=-t3Vw/yBdGAmYjQE0u6IG--
