From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] If max_freq got reduced (e.g. by _PPC) a write to sysfs
	scaling_governor let cpufreq core stuck at low max_freq for ever
Date: Fri, 14 Apr 2006 14:27:05 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6007E178CD@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Thomas Renninger <trenn@suse.de>, cpufreq@lists.linux.org.uk
Cc: Dave Jones <davej@redhat.com>, Dominik Brodowski <linux@brodo.de>


Looks good.=20
Dave: can you add this patch.

I think we can mark cpufreq_set_policy() for removal as it is only
getting used by deprecated acpi /proc/interface. Probably mark it with
ACPI_CPUFREQ_PROC_INTF?

Thanks,
Venki

>-----Original Message-----
>From: Thomas Renninger [mailto:trenn@suse.de]=20
>Sent: Thursday, April 13, 2006 6:14 AM
>To: cpufreq@lists.linux.org.uk
>Cc: Dave Jones; Pallipadi, Venkatesh
>Subject: Re: [PATCH] If max_freq got reduced (e.g. by _PPC) a=20
>write to sysfs scaling_governor let cpufreq core stuck at low=20
>max_freq for ever
>
>The previous patch had bugs (locking and refcount).
>
>This one could also be related to the latest DELL reports.
>But they only slip into this if a user prog (e.g. powersave=20
>daemon does when
>AC got (un) plugged due to a scheme change) echos something to=20
>/sys/../cpufreq/scaling_governor
>while the frequencies got limited by BIOS.
>
>This one works:
>
>Subject: Max freq stucks at low freq if reduced by _PPC and=20
>sysfs gov access
>
>The problem is reproducable by(if machine is limiting freqs via BIOS):
> - Unplugging AC -> max freq gets limited
> - echo ${governor} >/sys/.../cpufreq/scaling_governor=20
>(policy->user_data.max
>   gets overridden with policy->max and will never come up again.)
>
>This patch exchanged the cpufreq_set_policy call to=20
>__cpufreq_set_policy and
>duplicated it's functionality but did not override user_data.max.
>The same happens with overridding min/max values. If freqs are=20
>limited and
>you override the min freq value, the max freq global value=20
>will also get
>stuck to the limited freq, even if BIOS allows all freqs again.
>Last scenario does only happen if BIOS does not reduce the frequency
>to the lowest value (should never happen, just for correctness...)
>
> drivers/cpufreq/cpufreq.c |   17 +++++++++++++++--
> 1 files changed, 15 insertions(+), 2 deletions(-)
>
>Signed-off-by: Thomas Renninger <trenn@suse.de>
>
>Index: linux-2.6.16/drivers/cpufreq/cpufreq.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>--- linux-2.6.16.orig/drivers/cpufreq/cpufreq.c
>+++ linux-2.6.16/drivers/cpufreq/cpufreq.c
>@@ -350,6 +350,8 @@ show_one(scaling_min_freq, min);
> show_one(scaling_max_freq, max);
> show_one(scaling_cur_freq, cur);
>=20
>+static int __cpufreq_set_policy(struct cpufreq_policy *data,=20
>struct cpufreq_policy *policy);
>+
> /**
>  * cpufreq_per_cpu_attr_write() / store_##file_name() - sysfs=20
>write access
>  */
>@@ -368,7 +370,10 @@ static ssize_t store_##file_name	=09
>			\
> 	if (ret !=3D 1)					=09
>	\
> 		return -EINVAL;				=09
>	\
> 							=09
>	\
>-	ret =3D cpufreq_set_policy(&new_policy);		=09
>	\
>+	mutex_lock(&policy->lock);			=09
>	\
>+	ret =3D __cpufreq_set_policy(policy, &new_policy);=09
>	\
>+	policy->user_policy.object =3D policy->object;	=09
>	\
>+	mutex_unlock(&policy->lock);			=09
>	\
> 							=09
>	\
> 	return ret ? ret : count;			=09
>	\
> }
>@@ -424,7 +429,15 @@ static ssize_t store_scaling_governor (s
> 	if (cpufreq_parse_governor(str_governor,=20
>&new_policy.policy, &new_policy.governor))
> 		return -EINVAL;
>=20
>-	ret =3D cpufreq_set_policy(&new_policy);
>+	/* Do not use cpufreq_set_policy here or the user_policy.max
>+	   will be wrongly overridden */
>+	mutex_lock(&policy->lock);
>+	ret =3D __cpufreq_set_policy(policy, &new_policy);
>+
>+	policy->user_policy.policy =3D policy->policy;
>+	policy->user_policy.governor =3D policy->governor;
>+	mutex_unlock(&policy->lock);
>+
> 	return ret ? ret : count;
> }
>=20
>
