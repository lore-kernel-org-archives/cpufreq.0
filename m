From: "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Thu, 23 Oct 2003 14:50:06 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <7F740D512C7C1046AB53446D3720017304B04F@scsmsx402.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Moore, Robert" <robert.moore@intel.com>, Pavel Machek <pavel@ucw.cz>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, Dominik Brodowski <linux@brodo.de>, linux-acpi <linux-acpi@intel.com>, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

Me too, because it would be consistent with the other ones; i.e. how the
user perceives them.

	Jun
> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Moore, Robert
> Sent: Thursday, October 23, 2003 1:48 PM
> To: Pavel Machek; Pallipadi, Venkatesh
> Cc: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org;
linux-acpi;
> Nakajima, Jun; Mallick, Asit K; Dominik Brodowski
> Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
P-
> state driver
>=20
>=20
> I would vote for "cpufreq_dynamic"
>=20
> Bob
>=20
>=20
> -----Original Message-----
> From: Pavel Machek [mailto:pavel@ucw.cz]
> Sent: Thursday, October 23, 2003 7:17 AM
> To: Pallipadi, Venkatesh
> Cc: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org;
linux-acpi;
> Nakajima, Jun; Mallick, Asit K; Dominik Brodowski
> Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
> P-state driver
>=20
> Hi!
>=20
> > Patch 3/3: New dynamic cpufreq driver (called
> > DemandBasedSwitch driver), which periodically monitors CPU
> > usage and changes the CPU frequency based on the demand.
> >
> > diffstat dbs3.patch
> > drivers/cpufreq/Kconfig       |   25 ++++
> > drivers/cpufreq/Makefile      |    1
> > drivers/cpufreq/cpufreq_dbs.c |  214
> >
> Could you name it cpufreq_demand? We have enough
> TLAs as is.
> 				Pavwl
>=20
>=20
> --
> 				Pavel
> Written on sharp zaurus, because my Velo1 broke. If you have Velo you
> don't need...
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
