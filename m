From: Len Brown <len.brown@intel.com>
Subject: Re: [PATCH] Longhaul - Add ignore_latency option
Date: Wed, 23 Aug 2006 23:22:18 -0400
Message-ID: <200608232322.19005.len.brown@intel.com>
References: <44DED1C4.7060108@interia.pl>
Reply-To: Len Brown <lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44DED1C4.7060108@interia.pl>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk
Cc: Dave Jones <davej@redhat.com>

On Sunday 13 August 2006 03:16, Rafa=B3 Bilski wrote:
> Some laptops with VIA C3 processor, CLE266 chipset and
> AMI BIOS have incorrect latency values in FADT table. These
> laptops seems to be C3 capable, but latency values are to
> big: 101 for C2 and 1017 for C3. This option will allow
> user to skip C3 latency test but not C3 address test. AMI
> BIOS is setting C3 address to correct value in DSDT table.

This looks very fishy.

C2 latency above 100usec and C3 latency above 1000 usec
are the official way for the BIOS to tell the OS to NOT USE
those C-states.  Under no conditions should Linux second
guess those explicit instructions -- the BIOS may have put
those values there because you get silent data corruption
on that particular stepping of the processor or chipset
if they are enabled.

But the real question is why the longhaul driver is checking
for C2 and C3 support in the first place -- as they are not
directly related to the availability of P-states.

=2DLen


> Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>
>=20
> ---
>=20
> diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/c=
pu/cpufreq/longhaul.c
> --- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
> +++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
> @@ -65,7 +65,7 @@ static int port22_en =3D 0;
> =20
>  /* Module parameters */
>  static int dont_scale_voltage;
> -
> +static int ignore_latency =3D 0;
> =20
>  #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "long=
haul", msg)
> =20
> @@ -665,8 +665,10 @@ static int __init longhaul_cpu_init(stru
>  	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
>  		/* Check ACPI support for C3 state */
>  		cx =3D &pr->power.states[ACPI_STATE_C3];
> -		if (cx->address =3D=3D 0 || cx->latency > 1000)
> +		if (cx->address =3D=3D 0 ||=20
> +		   (cx->latency > 1000 && ignore_latency =3D=3D 0) )
>  			goto err_acpi;
> +
>  	} else {
>  		/* Check ACPI support for bus master arbiter disable */
>  		if (!pr->flags.bm_control) {
> @@ -773,6 +775,8 @@ static void __exit longhaul_exit(void)
> =20
>  module_param (dont_scale_voltage, int, 0644);
>  MODULE_PARM_DESC(dont_scale_voltage, "Don't scale voltage of processor");
> +module_param(ignore_latency, int, 0644);
> +MODULE_PARM_DESC(ignore_latency, "Skip ACPI C3 latency test");
> =20
>  MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
>  MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
> @@ -780,4 +784,3 @@ MODULE_LICENSE ("GPL");
> =20
>  late_initcall(longhaul_init);
>  module_exit(longhaul_exit);
> -
>=20
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>=20
