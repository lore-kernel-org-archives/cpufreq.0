From: Arjan van de Ven <arjanv@redhat.com>
Subject: RE: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Thu, 23 Oct 2003 10:19:44 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1066897184.395.1.camel@laptop.fenrus.com>
References: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============34720731574602137=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk


--===============34720731574602137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-JaPVGzjBxhqUz9mw0AJ/"


--=-JaPVGzjBxhqUz9mw0AJ/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-10-22 at 20:21, Pallipadi, Venkatesh wrote:

> And with the kind of power savings that comes with these frequency
> changes, this behaviour=20
> results in  longer battery life. However, as yet I do not have any
> numbers to quantify this gain,=20
> mainly because I do not have any setup where I can measure actual power.
> =20

some time ago I did this by using the ACPI method of asking the battery
what the current use is at this point in time; it's of course not as
exact as a full measurement setup but it's a nice poor mans power watch
too ....

--=-JaPVGzjBxhqUz9mw0AJ/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/l48gxULwo51rQBIRAtW0AJ9IIicpInycauPOVjsenTpHRNVbfwCfWZOS
GHjNTACegB3v9PkAIdUUeGc=
=ybgw
-----END PGP SIGNATURE-----

--=-JaPVGzjBxhqUz9mw0AJ/--


--===============34720731574602137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============34720731574602137==--

