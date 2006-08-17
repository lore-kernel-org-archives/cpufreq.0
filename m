From: Carlos Garcia Campos <carlosgc@gnome.org>
Subject: RE: cpufreq stops working after a while
Date: Thu, 17 Aug 2006 12:58:51 +0200
Message-ID: <1155812332.3220.5.camel@localhost.localdomain>
References: <EB12A50964762B4D8111D55B764A8454741E13@scsmsx413.amr.corp.intel.com>
	<1155752344.3554.4.camel@localhost.localdomain>
	<1155811619.4302.1271.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1463545738=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1155811619.4302.1271.camel@queen.suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk


--===============1463545738==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-xLB5OCyc5jgKQGiULMaJ"


--=-xLB5OCyc5jgKQGiULMaJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El jue, 17-08-2006 a las 12:46 +0200, Thomas Renninger escribi=C3=B3:
> On Wed, 2006-08-16 at 20:19 +0200, Carlos Garcia Campos wrote:
> > El mi=C3=A9, 16-08-2006 a las 06:27 -0700, Pallipadi, Venkatesh escribi=
=C3=B3:
> > > =20
> > Here is what I got from debug messages:=20
> >=20
> > 1.- scaling_max_freq is set to 600000
> >=20
> > speedstep-centrino: target=3D1520000kHz old=3D1600000 new=3D1400000 msr=
=3D0e24
> > cpufreq-core: notification 0 of frequency transition to 1400000 kHz
> > userspace: saving cpu_cur_freq of cpu 0 to be 1400000 kHz
> > cpufreq-core: notification 1 of frequency transition to 1400000 kHz
> > cpufreq-core: scaling loops_per_jiffy to 1395912 for frequency 1400000 =
kHz
> > userspace: saving cpu_cur_freq of cpu 0 to be 1400000 kHz
> > cpufreq-core: target for CPU 0: 1440000 kHz, relation 1
> > printk: 42 messages suppressed.
> > cpufreq-core: updating policy for CPU 0
> > cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing co=
re thinks of 1600000, is 600000 kHz.
> BIOS probably reduced freq behind kernel's back (you didn't unplug AC?,
> so this machine might also just reduce freq by BIOS for thermal
> issues?):

No, AC is always plugged.

> I expect you run through:
>  drivers/cpufreq/cpufreq.c:cpufreq_update_policy():
>       /* BIOS might change freq behind our back
>           -> ask driver for current freq and notify governors about a cha=
nge */
>         if (cpufreq_driver->get) {
>                 policy.cur =3D cpufreq_driver->get(cpu);
>                 if (!data->cur) {
>                         dprintk("Driver did not initialize current freq")=
;
>                         data->cur =3D policy.cur;
>                 } else {
>                         if (data->cur !=3D policy.cur)
>                                 cpufreq_out_of_sync(cpu, data->cur, polic=
y.cur);
>                 }
>         }
>=20
> > cpufreq-core: notification 0 of frequency transition to 600000 kHz
> > userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
> > cpufreq-core: notification 1 of frequency transition to 600000 kHz
> > cpufreq-core: scaling loops_per_jiffy to 598248 for frequency 600000 kH=
z
> > userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
> > cpufreq-core: setting new policy for CPU 0: 600000 - 1600000 kHz
> > freq-table: request for verification of policy (600000 - 1600000 kHz) f=
or cpu 0
> > freq-table: verification lead to (600000 - 1600000 kHz) for cpu 0
> > freq-table: request for verification of policy (600000 - 600000 kHz) fo=
r cpu 0
> > freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
> > cpufreq-core: new min and max freqs are 600000 - 600000 kHz
> > cpufreq-core: governor: change or update limits
> > cpufreq-core: __cpufreq_governor for CPU 0, event 3
> > cpufreq-core: target for CPU 0: 600000 kHz, relation 1
> > freq-table: request for target 600000 kHz (relation: 1) for cpu 0
> >=20
> > 2.- I can set 1600000 again and it works
> >=20
> > cpufreq-core: updating policy for CPU 0
> > cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing co=
re thinks of 600000, is 1600000 kHz.
> Looks like BIOS decided that we can use highest freq again and directly
> sets the freq to 1600 and kernel didn't notice.
> > cpufreq-core: notification 0 of frequency transition to 1600000 kHz
> > userspace: saving cpu_cur_freq of cpu 0 to be 1600000 kHz
> > cpufreq-core: scaling loops_per_jiffy to 1595328 for frequency 1600000 =
kHz
> > cpufreq-core: notification 1 of frequency transition to 1600000 kHz
> > userspace: saving cpu_cur_freq of cpu 0 to be 1600000 kHz
> > cpufreq-core: setting new policy for CPU 0: 600000 - 600000 kHz
> > freq-table: request for verification of policy (600000 - 600000 kHz) fo=
r cpu 0
> Oh something went wrong, request should always be from (600000-1600000).
> > freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
> > freq-table: request for verification of policy (600000 - 600000 kHz) fo=
r cpu 0
> > freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
> Eventually freq could get limited here if BIOS (_PPC) still does not
> allow highest freq. But here it would/should allow it again.
> It seems as if the "real" max_freq can still be accidently overridden by
> the temporary limited max_freq.
> I think this could only happen by calling cpufreq_set_policy(..) (or the
> one used by min,max sysfs writes), but maybe it may also happen
> somewhere else...
>=20
> > cpufreq-core: new min and max freqs are 600000 - 600000 kHz
> > cpufreq-core: governor: change or update limits
> > cpufreq-core: __cpufreq_governor for CPU 0, event 3
> > cpufreq-core: target for CPU 0: 600000 kHz, relation 1
> > freq-table: request for target 600000 kHz (relation: 1) for cpu 0
> > freq-table: target is 7 (600000 kHz, 1554)
> > speedstep-centrino: target=3D600000kHz old=3D1600000 new=3D600000 msr=
=3D0612
> >=20
> > I hope it helps to catch the problem.=20
>=20
> If you could tell us what kind of userspace tool you are using to
> control cpufreq, that would help a lot.

I don't use any tool. I use conservative governor. When scaling_max_freq
is set to 600 I try to set 1600 again directly with echo. I don't use
any other tool to control cpufreq.

> If this tool still makes use of the deprecated /proc/ interface then
> better upgrade this one.

No, it's even not compiled.=20

> IMO cpufreq_set_policy should not be exported as it is quite dangerous,
> doing:
>=20
> policy.max=3Dxy
> cpufreq_set_policy(&policy)
>=20
> Will override the static max_freq (data->user_policy.max) with the
> temporarily limited one (what should only happen if writing to
> scaling_max_freq).
>=20
> Only place I found this call was in drivers/acpi/processor_perflib.c
> If your userspace tool sets frequency over that one (what it should not
> do):
> /proc/acpi/processor/XY/performance
> this patch might help, otherwise it will not.
>=20
> But instead of this patch, I think it's better to rip out this file
> totally as it also does not provide SMP capabilities (on an SMP system
> writing to it, may randomly modify frequency of one of the CPUs).
>=20
> Compile tested and patched again 2.6.18-rc4:
>=20
>  drivers/acpi/processor_perflib.c |    9 +++++----
>  drivers/cpufreq/cpufreq.c        |    4 +---
>  2 files changed, 6 insertions(+), 7 deletions(-)
>=20
> Index: linux-2.6.18-rc4/drivers/acpi/processor_perflib.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.18-rc4.orig/drivers/acpi/processor_perflib.c
> +++ linux-2.6.18-rc4/drivers/acpi/processor_perflib.c
> @@ -457,7 +457,7 @@ acpi_processor_write_performance(struct=20
>  	struct acpi_processor *pr =3D (struct acpi_processor *)m->private;
>  	struct acpi_processor_performance *perf;
>  	char state_string[12] =3D { '\0' };
> -	unsigned int new_state =3D 0;
> +	unsigned int new_state, new_freq =3D 0;
>  	struct cpufreq_policy policy;
> =20
>=20
> @@ -480,10 +480,11 @@ acpi_processor_write_performance(struct=20
>  	cpufreq_get_policy(&policy, pr->id);
> =20
>  	policy.cpu =3D pr->id;
> -	policy.min =3D perf->states[new_state].core_frequency * 1000;
> -	policy.max =3D perf->states[new_state].core_frequency * 1000;
> +	new_freq =3D perf->states[new_state].core_frequency * 1000;
> +
> +	__cpufreq_driver_target(&policy, new_freq, CPUFREQ_RELATION_L);
> +
> =20
> -	result =3D cpufreq_set_policy(&policy);
>  	if (result)
>  		return result;
> =20
> Index: linux-2.6.18-rc4/drivers/cpufreq/cpufreq.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.18-rc4.orig/drivers/cpufreq/cpufreq.c
> +++ linux-2.6.18-rc4/drivers/cpufreq/cpufreq.c
> @@ -1448,7 +1448,7 @@ error_out:
>   *
>   *	Sets a new CPU frequency and voltage scaling policy.
>   */
> -int cpufreq_set_policy(struct cpufreq_policy *policy)
> +static int cpufreq_set_policy(struct cpufreq_policy *policy)
>  {
>  	int ret =3D 0;
>  	struct cpufreq_policy *data;
> @@ -1478,8 +1478,6 @@ int cpufreq_set_policy(struct cpufreq_po
> =20
>  	return ret;
>  }
> -EXPORT_SYMBOL(cpufreq_set_policy);
> -
> =20
>  /**
>   *	cpufreq_update_policy - re-evaluate an existing cpufreq policy
>=20
>=20

Thanks a lot,=20
--=20
Carlos Garcia Campos (KaL)
   elkalmail@yahoo.es
   carlosgc@gnome.org
   http://carlosgc.linups.org
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0x523E6462

--=-xLB5OCyc5jgKQGiULMaJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBE5EvrjxBOalI+ZGIRAsIpAJ9MowHIwkstWtyGEZHfJU6nkxTjpwCfZEuO
YedV9xEREco96ZQMvCec+fI=
=1Cu8
-----END PGP SIGNATURE-----

--=-xLB5OCyc5jgKQGiULMaJ--



--===============1463545738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1463545738==--


