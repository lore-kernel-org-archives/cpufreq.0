From: "Moore, Robert" <robert.moore@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Thu, 23 Oct 2003 13:47:49 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <CFF522B18982EA4481D3A3E23B83141C24B4DF@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>


I would vote for "cpufreq_dynamic"

Bob


-----Original Message-----
From: Pavel Machek [mailto:pavel@ucw.cz]=20
Sent: Thursday, October 23, 2003 7:17 AM
To: Pallipadi, Venkatesh
Cc: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org; linux-acpi;
Nakajima, Jun; Mallick, Asit K; Dominik Brodowski
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
P-state driver

Hi!

> Patch 3/3: New dynamic cpufreq driver (called=20
> DemandBasedSwitch driver), which periodically monitors CPU=20
> usage and changes the CPU frequency based on the demand.
>=20
> diffstat dbs3.patch=20
> drivers/cpufreq/Kconfig       |   25 ++++
> drivers/cpufreq/Makefile      |    1=20
> drivers/cpufreq/cpufreq_dbs.c |  214
>=20
Could you name it cpufreq_demand? We have enough
TLAs as is.
				Pavwl


--=20
				Pavel
Written on sharp zaurus, because my Velo1 broke. If you have Velo you
don't need...
