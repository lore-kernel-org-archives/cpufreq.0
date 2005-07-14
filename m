From: Eric Piel <Eric.Piel@lifl.fr>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Thu, 14 Jul 2005 15:32:30 +0200
Message-ID: <42D6696E.4080505@lifl.fr>
References: <1121341256.10537.12.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1121341256.10537.12.camel@icampbell-debian>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ian Campbell <icampbell@arcom.com>
Cc: cpufreq@lists.linux.org.uk

14.07.2005 13:40, Ian Campbell wrote/a =C3=A9crit:
> Hi,=20
Hello,

I don't know so much about cpufreq, so only very few comments:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ 2.6/arch/arm/mach-pxa/cpu-pxa.c	2005-07-14 10:57:04.000000000 +0100
> +
> +static void pxa_select_freq_table(struct cpufreq_policy *policy,
> +				  pxa_freqs_t ** settings,
> +				  struct cpufreq_frequency_table **table)
> +{
> +	if (strcmp(policy->governor->name, "performance") =3D=3D 0) {
> +		if (settings)
> +			*settings =3D pxa255_run_freqs;
> +		if (table)
> +			*table =3D pxa255_run_freq_table;
> +	} else {
> +		if (settings)
> +			*settings =3D pxa255_turbo_freqs;
> +		if (table)
> +			*table =3D pxa255_turbo_freq_table;
> +	}
> +}
So your driver depends on a hard-coded name of a governor ? It seems=20
suspicious...


> +
> +static int pxa_set_target(struct cpufreq_policy *policy,
> +			  unsigned int target_freq, unsigned int relation)
> +{
:
> +
> +	/* Get the current policy */
> +	pxa_select_freq_table(policy, &pxa_freq_settings, &pxa_freqs_table);
> +
> +	/* Lookup the next frequency */
> +	if (cpufreq_frequency_table_target(policy, pxa_freqs_table,
> +					   target_freq, relation, &idx))
> +		return -EINVAL;
> +
> +	freqs.old =3D get_clk_frequency_khz(0);
> +	freqs.new =3D pxa_freq_settings[idx].khz;
It's probably a good idea to include such a code:
	if (freqs.new =3D=3D freqs.old)
		return 0;

This avoid to do lots of things while it would change nothing.


> +static int pxa_cpufreq_init(struct cpufreq_policy *policy)
> +{
:
> +	policy->cpuinfo.min_freq =3D PXA25x_MIN_FREQ;
> +	policy->cpuinfo.transition_latency =3D 1000;	/* FIXME: 1 ms, assumed =
*/
If you want to say 1ms, you have to write 1000000 (it's in nanosecond).=20
This value is quite important for the ondemand governor so if you have=20
better knowledge of the latency, don't hesitate to fix it!

> +
> +static struct cpufreq_driver pxa_cpufreq_driver =3D {
> +	.verify	=3D pxa_verify_policy,
> +	.target	=3D pxa_set_target,
> +	.init	=3D pxa_cpufreq_init,
> +	.get	=3D pxa_cpufreq_get,
> +	.name	=3D "PXA25x",
> +};
Not sure it's a good idea to put the name in uppercase.

Eric
