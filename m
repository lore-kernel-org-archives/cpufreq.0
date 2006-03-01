From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 17:23:26 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600762929B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "shin, jacob" <jacob.shin@amd.com>, Andi Kleen <ak@suse.de>, cpufreq@lists.linux.org.uk
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>

=20
Questions:

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of shin, jacob
>Sent: Monday, February 27, 2006 5:55 PM
>@@ -623,6 +628,32 @@ static int cpufreq_add_dev (struct sys_d
> 		goto err_out;
> 	}
>=20
>+#ifdef CONFIG_SMP
>+	for_each_cpu_mask(j, policy->cpus) {
>+		if (cpu =3D=3D j)
>+			continue;
>+
>+		/* check for existing affected CPUs.  They may=20
>not be aware
>+		 * of it due to CPU Hotplug.
>+		 */
>+		managed_policy =3D cpufreq_cpu_get(j);

I see multiple cpufreq_cpu_get() without cpmplementing=20
cpufreq_cpu_put(). Is it intentional?


>+		if (unlikely(managed_policy)) {
>+			spin_lock_irqsave(&cpufreq_driver_lock, flags);
>+			managed_policy->cpus =3D policy->cpus;
>+			cpufreq_cpu_data[cpu] =3D managed_policy;
>+		=09
>spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
>+
>+			dprintk("CPU already managed, adding link\n");
>+			sysfs_create_link(&sys_dev->kobj,
>+					 =20
>&managed_policy->kobj, "cpufreq");
>+
>+			cpufreq_debug_enable_ratelimit();
>+			mutex_unlock(&policy->lock);
>+			ret =3D 0;
>+			goto err_out_driver_exit; /* call=20
>driver->exit() */

Why is this going through the error path here. Is the call to exit()
required?


Thanks,
Venki
