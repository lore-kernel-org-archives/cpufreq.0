From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 10:15:31 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6007791A@scsmsx403.sc.intel.com>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>


> -----Original Message-----
> From: Ducrot Bruno [mailto:ducrot@poupinou.org]=20
>=20
> There is already a patch from Dominik Brodowski for the apci=20
> p-state which IMHO
> is better at least by design. =20

Are you referring to cleanup of ACPI P-state driver by Dominik?
That patch is indeed nice and clean. But that is mostly=20
orthogonal to this patch. I mean,=20
- SMP awareness in P-state driver=20
- P-state coordination between HT siblings
will still be required even after Dominik's patch. Though exact=20
location of these changes will change when applied over Dominik's=20
patch.

There is a small overlap in handling MSR based P-state transitions,=20
but that is a real minor change in my patch and I am reusing most=20
of the existing IO based transitions code for MSR based ones.


> Your do not handle correctly=20
> other processors
> than Intel. =20

I am sorry. I do not understand this comment.=20
- Major part of Patch 1 is adding SMP awareness, which has
nothing specific to Intel at all.
- A part of patch 1 adds MSR based transition capability.=20
This is based on ACPI spec. It will work any processor=20
that is ACPI compatible and again there are no specific=20
checks for Intel here.


> But the HT stuff may be interresting, though.

Thanks.=20
-Venkatesh
