From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 10:38:53 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1066725533.5237.3.camel@laptop.fenrus.com>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6124666445396576=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
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
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>


--===============6124666445396576==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-S/VVdAcv/ouC+l4UsFx7"


--=-S/VVdAcv/ouC+l4UsFx7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-10-21 at 04:56, Pallipadi, Venkatesh wrote:
> Patch 3/3: New dynamic cpufreq driver (called=20
> DemandBasedSwitch driver), which periodically monitors CPU=20
> usage and changes the CPU frequency based on the demand.


it's all nice code and such, but I still wonder why this can't be done
by a userland policy daemon. The 2.6 kernel has the infrastructure to
give very detailed information to userspace (eg top etc) about idle
percentages...... I didn't see anything in this driver that couldn't be
done from userspace.

Note that I'm not totally against doing some of this in the kernel; I
can well see the point of say, detecting an IRQ overload and based on
that, go to max speed in the kernel because it's a situation where
userspace doesn't even run; but the patch as is doesn't do any such
advanced things...

--=-S/VVdAcv/ouC+l4UsFx7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/lPCdxULwo51rQBIRAv5VAJwMsnktwQ29tXjQfg4ErZ8/A74VyACfWT2O
QCHHEyS3+KWp8/0icuBvGjk=
=BS2i
-----END PGP SIGNATURE-----

--=-S/VVdAcv/ouC+l4UsFx7--


--===============6124666445396576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============6124666445396576==--

