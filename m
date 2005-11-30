From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [powernow-k8] some wrong frequencies on opterons 252, howto
 find them?
Date: Wed, 30 Nov 2005 14:46:58 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A843032189BC@SAUSEXMB1.amd.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

> > It's a BIOS bug/feature, for sure.  Take it up with HP -=20
> > they've been known to make design decisions like this before.
> >=20
>=20
> Thanks to confirm this.  I will contact HP in order to get it fixed.
>=20
> In the meantime (and for those who may need a solution for an=20
> override) I will provide that patch to your driver.  Of=20
> course, I don't request it being merged for obvious reasons.
>=20
> The only (maybe) thing that may be other people want to be=20
> merged in mainline is that we can get the current voltage.  I=20
> could separate the voltage attribute if you think it may be=20
> fun to have.

I can support powernow_show_voltage and powernow_show_table,
but AMD will not maintain powernow_store_table. =20

> --- linux-2.6.14.3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c=09
> 2005/11/30 17:14:03	1.1
> +++ linux-2.6.14.3/arch/i386/kernel/cpu/cpufreq/powernow-k8.c=09
> 2005/11/30 18:44:19
> @@ -1129,8 +1129,163 @@ static unsigned int powernowk8_get (unsi
>  	return khz;
>  }
> =20
> +static ssize_t powernow_show_voltage(struct cpufreq_policy=20
> *pol, char=20
> +*buf) {
> +	struct powernow_k8_data *data =3D powernow_data[pol->cpu];
> +	cpumask_t oldmask;
> +	u32 voltage =3D 0;
> +
> +	oldmask =3D current->cpus_allowed;
> +	set_cpus_allowed(current, cpumask_of_cpu(pol->cpu));
> +	if (smp_processor_id() !=3D pol->cpu) {
> +		printk(KERN_ERR "limiting to cpu %u failed\n",=20
> pol->cpu);
> +		goto err_out;
> +	}
> +
> +	preempt_disable();
> +
> +	if (query_current_values_with_pending_wait(data))
> +		goto err_out;
> +
> +	voltage =3D 1550 - data->currvid * 25;

should be
voltage =3D find_millivolts_from_vid(data, data->currvid);
that way it's forward-proofed if we change the voltage
algorithm on future generations of processors.

> +err_out:
> +	preempt_enable_no_resched();
> +	set_cpus_allowed(current, oldmask);
> +
> +	return sprintf(buf, "%d\n", voltage);
> +}
> +
> +static struct freq_attr powernow_attr_voltage =3D {
> +	.attr =3D { .name =3D "powernow_voltage", .mode =3D 0444},
> +	.show =3D powernow_show_voltage,
> +};
> +
> +static ssize_t powernow_show_table(struct cpufreq_policy *pol, char=20
> +*buf) {
> +	int i;
> +	ssize_t count =3D 0;
> +	struct powernow_k8_data *data =3D powernow_data[pol->cpu];
> +	struct cpufreq_frequency_table *table =3D data->powernow_table;
> +
> +	count +=3D sprintf(&buf[count], "%d %d %d %d %d %d %d %d\n",
> +			 data->numps,
> +			 data->batps,
> +			 data->rvo,
> +			 data->irt,
> +			 data->vidmvs,
> +			 data->vstable,
> +			 data->plllock,
> +			 data->exttype);
> +
> +	for (i =3D 0; table[i].frequency !=3D CPUFREQ_TABLE_END; ++i) {
> +		if (table[i].frequency =3D=3D CPUFREQ_ENTRY_INVALID)
> +			count +=3D sprintf(&buf[count], "XX ");
> +		else
> +			count +=3D sprintf(&buf[count], "%d ",
> +					table[i].frequency);
> +		count +=3D sprintf(&buf[count], "0x%.4x\n",
> +					table[i].index);
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t powernow_store_table(struct cpufreq_policy *pol,
> +		const char *buf, size_t count)
> +{
....
> +}

That function scares me.  It's only useful for people with a
mostly working set of _PSS objects, since it won't generate
the irt, rvo, pllock, etc.  People attempting to use it
should be very careful, since incorrect fid/vid pairs=20
will hardlock the machine and potentially damage the
processor.  I definitely don't want it in the mainstream code.

> +
> +static struct freq_attr powernow_attr_table =3D {
> +	.attr =3D { .name =3D "powernow_table", .mode =3D 0644},
> +	.show =3D powernow_show_table,
> +	.store =3D powernow_store_table,
> +};

Can we get rid of the .store?

>  static struct freq_attr* powernow_k8_attr[] =3D {
>  	&cpufreq_freq_attr_scaling_available_freqs,
> +	&powernow_attr_voltage,
> +	&powernow_attr_table,
>  	NULL,
>  };
>=20

-Mark Langsdorf
AMD, Inc.
