From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Deadlock occurs in cpufreq_userspace.c
Date: Tue, 10 Feb 2004 10:17:35 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6082D12C@scsmsx403.sc.intel.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>, "Li, Shaohua" <shaohua.li@intel.com>, davej@redhat.com
Cc: cpufreq@www.linux.org.uk


Yes. We initially thought about this solution. But, we thought it is
safer to hold policy->lock before changing the frequency. Otherwise, it
may complicate if frequency is changed from multiple places (like
governor and a PPC handler).

If we are going to use __cpufreq_driver_target(), then can we remove
cpufreq_driver_target() altogether? Do you see any other usage to it? We
may also need to update Documentation/cpu-freq/governers.txt to keep it
in sync with the code.

Thanks,
-Venki

> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@dominikbrodowski.de]=20
> Sent: Monday, February 09, 2004 2:46 AM
> To: Li, Shaohua; davej@redhat.com
> Cc: cpufreq@www.linux.org.uk; Pallipadi, Venkatesh
> Subject: Re: Deadlock occurs in cpufreq_userspace.c
>=20
>=20
> Hi,
>=20
> How about this patch?=20
> ->governor() shouldn't fail...
>=20
> 	Dominik
>=20
> On Wed, Feb 04, 2004 at 11:11:13AM +0800, Li, Shaohua wrote:
> > Hi,
> >=20
> >    Consider below 2 paths:
> >=20
> >    1.cpufreq_set (lock userspace_sem) ->cpufreq_driver_target(lock
> > policy->lock)
> >=20
> >    2.cpufreq_set_policy(lock policy->lock)->
> > __cpufreq_governor->cpufreq_governor_userspace (lock userspace_sem)
> >=20
> > then deadlock occurs. Attached is the patch against 2.6.=20
> Please review
> > it.
> >=20
> > =20
> >=20
> > thanks,
> >=20
> > David
>=20
>=20
>=20
> A deadlock possibility was noted in the cpufreq_userspace governor.
>=20
>  drivers/cpufreq/cpufreq_userspace.c |   11 +++++++++--
>  1 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c=20
> linux/drivers/cpufreq/cpufreq_userspace.c
> --- linux-original/drivers/cpufreq/cpufreq_userspace.c=09
> 2004-02-09 09:18:48.000000000 +0100
> +++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-02-09=20
> 11:39:56.819931256 +0100
> @@ -2,7 +2,7 @@
>   *  linux/drivers/cpufreq/cpufreq_userspace.c
>   *
>   *  Copyright (C)  2001 Russell King
> - *            (C)  2002 - 2003 Dominik Brodowski <linux@brodo.de>
> + *            (C)  2002 - 2004 Dominik Brodowski <linux@brodo.de>
>   *
>   * This program is free software; you can redistribute it=20
> and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -112,7 +112,14 @@
>  	if (freq > cpu_max_freq[cpu])
>  		freq =3D cpu_max_freq[cpu];
> =20
> -	ret =3D cpufreq_driver_target(&current_policy[cpu], freq,=20
> +	/*
> +	 * We're safe from concurrent calls to ->target() here
> +	 * as we hold the userspace_sem lock. If we were calling
> +	 * cpufreq_driver_target, a deadlock situation might occur:
> +	 * A: cpufreq_set (lock userspace_sem) ->=20
> cpufreq_driver_target(lock policy->lock)
> +	 * B: cpufreq_set_policy(lock policy->lock) ->=20
> __cpufreq_governor -> cpufreq_governor_userspace (lock userspace_sem)
> +	 */
> +	ret =3D __cpufreq_driver_target(&current_policy[cpu], freq,=20
>  	      CPUFREQ_RELATION_L);
> =20
>   err:
>=20
