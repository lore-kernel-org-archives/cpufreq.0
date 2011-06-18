From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V2 3/6] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Sat, 18 Jun 2011 13:28:05 +0200
Message-ID: <20110618112805.GB7445@liondog.tnic>
References: <1308340257-10117-1-git-send-email-mjg@redhat.com>
 <1308340257-10117-3-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308396490; bh=IQWejmuqI7q8Ru7PMc1mXwQCr3APx6rooXGnirIBvWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Dar+amC6newb3Vfn49j97JCeCZH1+wUmmYmTi+
	HiJv1uX6/GiMlwZ4emrAEreUp1IFyK6KmnBfb/85II+O7l+7SIEysKM4ymbU8T8Ed/c
	ILmHfISTjHeCITLaQgBYoi4c6zwTLP8hR5QYvpKoxeG+LFOdiVY4fmEqoqPMXOcCuo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308396489; bh=IQWejmuqI7q8Ru7PMc1mXwQCr3APx6rooXGnirIBvWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=S7xZWmynqpdS4iyzs57GcArljZHuJJdMSKlcZk
	Tl8ge8F6PA6Eazbi+L+Waa8NtHFfHGXeessXT/UZV7b4ZINgYbhv6L8+8m2luWZgtUE
	Cc30zGQxBQdc7UDRQmaOATB1h/1ozN+6wonDUbQLawlkuySG8wfSYFx09TVB8oiVoo=
Content-Disposition: inline
In-Reply-To: <1308340257-10117-3-git-send-email-mjg@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg@redhat.com>
Cc: linux-kernel@vger.kernel.org, borislav.petkov@amd.com, davej@redhat.com, mark.langsdorf@amd.com, cpufreq@vger.kernel.org, andreas.herrmann3@amd.com

On Fri, Jun 17, 2011 at 03:50:54PM -0400, Matthew Garrett wrote:
> One feature present in powernow-k8 that isn't present in acpi-cpufreq is
> support for enabling or disabling AMD's core performance boost technology.
> This patch adds that support to acpi-cpufreq, but also extends it to allow
> Intel's dynamic acceleration to be disabled via the same interface. The
> sysfs entry retains the cpb name for compatibility purposes.

Yeah, thinking in retrospect 'cpb' doesn't tell you anything. We
should've called it 'boost' from the beginning. And it makes much more
sense to call it that especially now, when the two methods get merged.

Maybe we should add a 'boost' sysfs node too and slowly phase out 'cpb'
or even leave 'cpb' in powernow-k8 and call it 'boost' here from the
get-go... Hmm...

> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> ---
>  drivers/cpufreq/acpi-cpufreq.c |  160 ++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 160 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
> index 298a947..8e6d89e 100644
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -76,6 +76,86 @@ static struct acpi_processor_performance __percpu *acpi_perf_data;
>  static struct cpufreq_driver acpi_cpufreq_driver;
>  
>  static unsigned int acpi_pstate_strict;
> +static bool cpb_enabled, cpb_supported;
> +static struct msr __percpu *msrs;
> +
> +static void _cpb_toggle_msrs(unsigned int cpu, bool t)
> +{
> +	struct acpi_cpufreq_data *data = per_cpu(acfreq_data, cpu);
> +
> +	get_online_cpus();
> +
> +	switch (data->cpu_feature) {
> +	case SYSTEM_INTEL_MSR_CAPABLE:
> +		rdmsr_on_cpus(cpu_online_mask, MSR_IA32_MISC_ENABLE, msrs);
> +
> +		for_each_cpu(cpu, cpu_online_mask) {
> +			struct msr *reg = per_cpu_ptr(msrs, cpu);
> +			if (t)
> +				reg->q &= ~MSR_IA32_MISC_ENABLE_TURBO_DISABLE;
> +			else
> +				reg->q |= MSR_IA32_MISC_ENABLE_TURBO_DISABLE;
> +		}
> +
> +		wrmsr_on_cpus(cpu_online_mask, MSR_IA32_MISC_ENABLE, msrs);
> +		break;
> +	case SYSTEM_AMD_MSR_CAPABLE:
> +		rdmsr_on_cpus(cpu_online_mask, MSR_K7_HWCR, msrs);
> +
> +		for_each_cpu(cpu, cpu_online_mask) {
> +			struct msr *reg = per_cpu_ptr(msrs, cpu);
> +			if (t)
> +				reg->l &= ~BIT(25);
> +			else
> +				reg->l |= BIT(25);
> +		}
> +
> +		wrmsr_on_cpus(cpu_online_mask, MSR_K7_HWCR, msrs);
> +		break;
> +	}
> +
> +	put_online_cpus();
> +}
> +
> +static void cpb_toggle(unsigned int cpu, bool t)
> +{
> +	if (t && !cpb_enabled) {
> +		cpb_enabled = true;
> +		_cpb_toggle_msrs(cpu, t);
> +		pr_debug("Core Boosting enabled.\n");
> +	} else if (!t && cpb_enabled) {
> +		cpb_enabled = false;
> +		_cpb_toggle_msrs(cpu, t);
> +		pr_debug("Core Boosting disabled.\n");
> +	}
> +}
> +
> +static ssize_t store_cpb(struct cpufreq_policy *policy, const char *buf,
> +			 size_t count)
> +{
> +	int ret = -EINVAL;
> +	unsigned long val = 0;
> +	unsigned int cpu = policy->cpu;
> +
> +	ret = strict_strtoul(buf, 10, &val);
> +	if (!ret && (val == 0 || val == 1) && cpb_supported)
> +		cpb_toggle(cpu, val);
> +	else
> +		return -EINVAL;
> +
> +	return count;
> +}
> +
> +static ssize_t show_cpb(struct cpufreq_policy *policy, char *buf)
> +{
> +	return sprintf(buf, "%u\n", cpb_enabled);
> +}
> +
> +#define define_one_rw(_name) \
> +static struct freq_attr _name = \
> +	__ATTR(_name, 0644, show_##_name, store_##_name)
> +
> +define_one_rw(cpb);
>  
>  static int check_est_cpu(unsigned int cpuid)
>  {
> @@ -446,6 +526,63 @@ static void free_acpi_perf_data(void)
>  	free_percpu(acpi_perf_data);
>  }
>  
> +static int cpb_notify(struct notifier_block *nb, unsigned long action,
> +		      void *hcpu)
> +{
> +	unsigned cpu = (long)hcpu;
> +	u32 lo, hi;
> +	struct acpi_cpufreq_data *data = per_cpu(acfreq_data, cpu);
> +	int msr;
> +	u64 bit;
> +
> +	switch (data->cpu_feature) {
> +	case SYSTEM_INTEL_MSR_CAPABLE:
> +		msr = MSR_IA32_MISC_ENABLE;
> +		bit = MSR_IA32_MISC_ENABLE_TURBO_DISABLE;
> +		break;
> +	case SYSTEM_AMD_MSR_CAPABLE:
> +		msr = MSR_K7_HWCR;
> +		bit = BIT(25);
> +		break;
> +	default:
> +		return NOTIFY_OK;
> +	}

Yeah, can we move the powernow-k8 comment about the boost-state because
it is important:

/*
 * On AMD clear the boost-disable flag on the CPU_DOWN path so that this cpu
 * cannot block the remaining ones from boosting. On the CPU_UP path we
 * simply keep the boost-disable flag in sync with the current global
 * state.
 */

> +	switch (action) {
> +	case CPU_UP_PREPARE:
> +	case CPU_UP_PREPARE_FROZEN:
> +		if (!cpb_enabled) {
> +			rdmsr_on_cpu(cpu, msr, &lo, &hi);
> +			if (bit < BIT(32))
> +				lo |= bit;
> +			else
> +				hi |= (bit >> 32);
> +			wrmsr_on_cpu(cpu, msr, lo, hi);
> +		}
> +		break;
> +
> +	case CPU_DOWN_PREPARE:
> +	case CPU_DOWN_PREPARE_FROZEN:
> +		rdmsr_on_cpu(cpu, msr, &lo, &hi);
> +		if (bit < BIT(32))
> +			lo &= ~bit;
> +		else
> +			hi &= ~(bit >> 32);
> +		wrmsr_on_cpu(cpu, msr, lo, hi);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +
> +static struct notifier_block cpb_nb = {
> +	.notifier_call          = cpb_notify,
> +};
> +
>  /*
>   * acpi_cpufreq_early_init - initialize ACPI P-States library
>   *
> @@ -666,6 +803,21 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	if (result)
>  		goto err_freqfree;
>  
> +	if (boot_cpu_has(X86_FEATURE_CPB) || boot_cpu_has(X86_FEATURE_IDA)) {
> +		msrs = msrs_alloc();
> +
> +		if (!msrs) {
> +			result = -ENOMEM;
> +			goto err_freqfree;
> +		}
> +
> +		cpb_supported = true;
> +
> +		register_cpu_notifier(&cpb_nb);
> +
> +		cpb_toggle(0, true);

You're unconditionally enabling boosting on driver load here while
powernow-k8 simply stated the current boost state. Also, a normal setup
should always come up with boosting enabled (I suppose on Intel too).
However, if you do this here, you're overwriting the boosting settings
a user changed in the BIOS did because a she wanted to turn it off for
whatever reason.

So let's only report the boost state here instead, huh?

> +	}
> +
>  	if (perf->states[0].core_frequency * 1000 != policy->cpuinfo.max_freq)
>  		printk(KERN_WARNING FW_WARN "P-state 0 is not max freq\n");
>  
> @@ -749,6 +901,7 @@ static int acpi_cpufreq_resume(struct cpufreq_policy *policy)
>  
>  static struct freq_attr *acpi_cpufreq_attr[] = {
>  	&cpufreq_freq_attr_scaling_available_freqs,
> +	&cpb,
>  	NULL,
>  };
>  
> @@ -788,6 +941,13 @@ static void __exit acpi_cpufreq_exit(void)
>  {
>  	pr_debug("acpi_cpufreq_exit\n");
>  
> +	if (msrs) {
> +		unregister_cpu_notifier(&cpb_nb);
> +
> +		msrs_free(msrs);
> +		msrs = NULL;
> +	}
> +
>  	cpufreq_unregister_driver(&acpi_cpufreq_driver);
>  
>  	free_percpu(acpi_perf_data);
> -- 
> 1.7.5.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Regards/Gruss,
    Boris.
