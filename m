From: Christian Krafft <krafft@de.ibm.com>
Subject: Re: removal of cpufreq_set_policy()
Date: Tue, 22 May 2007 00:43:48 +0200
Message-ID: <20070522004348.0add10eb@localhost>
References: <1178522195.6353.246.camel@localhost.localdomain>
	<1178528071.1231.942.camel@queen.suse.de>
	<1178529617.14928.4.camel@localhost.localdomain>
	<1179748453.20299.68.camel@sublime.suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177513350=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1179748453.20299.68.camel@sublime.suse.de>
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, cpufreq@lists.linux.org.uk, Arnd Bergmann <arnd@arndb.de>, davej@redhat.com

--===============1177513350==
Content-Type: multipart/signed; boundary=Sig_kOvz0NRDD9ucCJDg1o3DYm+;
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_kOvz0NRDD9ucCJDg1o3DYm+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 21 May 2007 06:54:13 -0500
Thomas Renninger <trenn@suse.de> wrote:

> On Mon, 2007-05-07 at 19:20 +1000, Benjamin Herrenschmidt wrote:
> > On Mon, 2007-05-07 at 10:54 +0200, Thomas Renninger wrote:
> >=20
> > > set_policy is buggy:
> > >   It calls verify_within_limits (where max_freq might get reduced)
> > >   then sets
> > >   data->user_policy.max =3D data->max;
> > >   which is used to restore to highest freq with update_policy, but
> > >   an already lowered freq might get assigned (e.g. if initialized
> > >   on battery with limited freq, you will never ever reach higher
> > >   freqs again).
> > >=20
> > > I grepped the whole kernel and couldn't find cpufreq_set_policy to be
> > > used anywhere else.
> >=20
> > Looks like cbe_cpufreq driver was merged at the same time as you were
> > removing set_polcy :-)
> Yes.
> >=20
> > > The cell cpufreq driver also does not match?:
> > > linux-2.6.21_tests/arch/powerpc/platforms/cell/cbe_cpufreq.c
> > >=20
> > > Can you give me a pointer to the code, is this an external project?
> >=20
> > It should be in that cbe_cpufreq.c file in current -git. I'm not the
> > author of the driver though, I'm just reporting the build failure :-)=20
> >=20
> > Arnd and Christian, can you check what's up ?
> >=20
> > I think that driver uses set_policy to enforce new limits upon request
> > from the system management.
> >=20
> > I know I did something similar, though slightly different, for powermac,
> > in drivers/macintosh/windfarm_cpufreq_clamp.c which is a module in my
> > thermal control infrastructure that clamps down the cpufreq when an
> > overtemp condition is detected.
>=20
> I can reproduce this with -rc2.
> cpufreq_set_policy came in with this one:
> 2007-04-23 Christian Krafft [POWERPC] cell: use pmi in cpufreq driver
>=20
> Attached patch is setting the limit like it's done for x86 in
> driver/acpi/processor_perflib.c
> IMO the interface is more complicated as it needs to be (maybe I am
> wrong),
> but it seems that this is the way it's intended to work.
>=20
> Please review, ehh, I don't have HW to test and don't even know what pmi
> is,
> can someone give this patch a test and try whether freq is limited and
> increased again correctly if "pmi" kicks in (compile tested...).

Thanks for fixing the compile issue.

Unfortunately the whole PMI stuff is broken by hardware till now.
I also don't have working hardware and the whole interface is under discuss=
ion atm.
Therefor I disabled cpufreq and pmi in cell_defconfig for now.

Until the hardware guys can fix the problem, it should not hurt that the co=
de is in.
If they don't manage to provide that interface the whole pmi code will have=
 to be removed again.

The code should just not get called, if no pmi device can be found.

This is where I have two comments below.

I checked patch (including the two comments) on hardware without pmi.=20
At least that looks still good.



>=20
>        Thomas
>=20
> Limit frequency for cell powerpc via cpufreq notifier chain
>=20
> and get rid of cpufreq_set_policy call that caused a build
> failure due interfering commits
>=20
> Signed-off-by: Thomas Renninger <trenn@suse.de>
>=20
>=20
> ---
>  arch/powerpc/platforms/cell/cbe_cpufreq.c |   28 ++++++++++++++++++++++-=
-----
>  1 file changed, 22 insertions(+), 6 deletions(-)
>=20
> Index: linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.22-rc2.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
> +++ linux-2.6.22-rc2/arch/powerpc/platforms/cell/cbe_cpufreq.c
> @@ -67,6 +67,7 @@ static u64 MIC_Slow_Next_Timer_table[] =3D
>  	0x00003FC000000000ull,
>  };
>=20
> +static unsigned int pmi_frequency_limit =3D 0;
>  /*
>   * hardware specific functions
>   */
> @@ -164,7 +165,6 @@ static int set_pmode(int cpu, unsigned i
>=20
>  static void cbe_cpufreq_handle_pmi(struct of_device *dev, pmi_message_t =
pmi_msg)
>  {
> -	struct cpufreq_policy policy;
>  	u8 cpu;
>  	u8 cbe_pmode_new;
>=20
> @@ -173,15 +173,27 @@ static void cbe_cpufreq_handle_pmi(struc
>  	cpu =3D cbe_node_to_cpu(pmi_msg.data1);
>  	cbe_pmode_new =3D pmi_msg.data2;
>=20
> -	cpufreq_get_policy(&policy, cpu);
> +	pmi_frequency_limit =3D cbe_freqs[cbe_pmode_new].frequency;
>=20
> -	policy.max =3D min(policy.max, cbe_freqs[cbe_pmode_new].frequency);
> -	policy.min =3D min(policy.min, policy.max);
> +	pr_debug("cbe_handle_pmi: max freq=3D%d\n", pmi_frequency_limit);
> +}
> +
> +static int pmi_notifier(struct notifier_block *nb,
> +				       unsigned long event, void *data)
> +{
> +	struct cpufreq_policy *policy =3D data;
> +
> +	if (event !=3D CPUFREQ_INCOMPATIBLE)
> +		return 0;
>=20
> -	pr_debug("cbe_handle_pmi: new policy.min=3D%d policy.max=3D%d\n", polic=
y.min, policy.max);
> -	cpufreq_set_policy(&policy);
> +	cpufreq_verify_within_limits(policy, 0, pmi_frequency_limit);
> +	return 0;
>  }
>=20
> +static struct notifier_block pmi_notifier_block =3D {
> +	.notifier_call =3D pmi_notifier,
> +};
> +
>  static struct pmi_handler cbe_pmi_handler =3D {
>  	.type			=3D PMI_TYPE_FREQ_CHANGE,
>  	.handle_pmi_message	=3D cbe_cpufreq_handle_pmi,
> @@ -238,6 +250,10 @@ static int cbe_cpufreq_cpu_init(struct c
>=20
>  	cpufreq_frequency_table_get_attr(cbe_freqs, policy->cpu);
>=20
> +	/* frequency might get limited later, initialize limit with max_freq */
> +	pmi_frequency_limit =3D max_freq;
> +	cpufreq_register_notifier(&pmi_notifier_block, CPUFREQ_POLICY_NOTIFIER);
> +

This just needs to be done, if pmi_dev is not NULL.
Also in that case the notifier needs to be unregistered in cbe_cpufreq_cpu_=
exit().

>  	/* this ensures that policy->cpuinfo_min and policy->cpuinfo_max are se=
t correctly */
>  	return cpufreq_frequency_table_cpuinfo(policy, cbe_freqs);
>  }
>=20




--=20
Mit freundlichen Gruessen,
kind regards,

Christian Krafft
IBM Systems & Technology Group,
Linux Kernel Development
IT Specialist


Vorsitzender des Aufsichtsrats:	Martin Jetter
Geschaeftsfuehrung:		Herbert Kircher
Sitz der Gesellschaft:		Boeblingen
Registriergericht:		Amtsgericht Stuttgart, HRB 243294


--Sig_kOvz0NRDD9ucCJDg1o3DYm+
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGUiCy6rqK4qDx+dcRAnaEAKCXc0K9yiZ8Urnz0DeooL9qiWgu/gCeMB+1
OrYTSPJK7VpcCYnpf+0/GaU=
=mCBs
-----END PGP SIGNATURE-----

--Sig_kOvz0NRDD9ucCJDg1o3DYm+--


--===============1177513350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1177513350==--

