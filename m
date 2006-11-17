From: Reuben Farrelly <reuben-linuxkernel@reub.net>
Subject: Re: [PATCH 2.6.19-rc5-mm2] cpufreq: set policy->curfreq on initialization
Date: Sat, 18 Nov 2006 00:56:14 +1100
Message-ID: <455DBF7E.7060906@reub.net>
References: <EB12A50964762B4D8111D55B764A8454E4128E@scsmsx413.amr.corp.intel.com> <20061115183610.GA4812@inferi.kami.home> <20061115190517.GA2449@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932896AbWKQN4R@vger.kernel.org>
In-Reply-To: <20061115190517.GA2449@inferi.kami.home>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, ego@in.ibm.com, Reuben Farrelly <reuben-linuxkernel@reub.net>, Andrew Morton <akpm@osdl.org>, davej@redhat.com, linux-kernel@vger.kernel.org, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, "Sadykov, Denis M" <denis.m.sadykov@intel.com>



On 16/11/2006 6:05 AM, Mattia Dongili wrote:
> Check the correct variable and set policy->cur upon acpi-cpufreq
> initialization to allow the userspace governor to be used as default.
> 
> Signed-off-by: Mattia Dongili <malattia@linux.it>
> 
> ---
> 
> Reuben, could you also try if this patch fixes the BUG()?
> Thanks

It does, and all looks fine now, thanks.  Sorry for not getting back about it a 
little earlier.

Reuben


> diff --git a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
> index 18f4715..a630f94 100644
> --- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
> +++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
> @@ -699,14 +699,14 @@ static int acpi_cpufreq_cpu_init(struct
>  	if (result)
>  		goto err_freqfree;
>  
> -	switch (data->cpu_feature) {
> +	switch (perf->control_register.space_id) {
>  	case ACPI_ADR_SPACE_SYSTEM_IO:
>  		/* Current speed is unknown and not detectable by IO port */
>  		policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
>  		break;
>  	case ACPI_ADR_SPACE_FIXED_HARDWARE:
>  		acpi_cpufreq_driver.get = get_cur_freq_on_cpu;
> -		get_cur_freq_on_cpu(cpu);
> +		policy->cur = get_cur_freq_on_cpu(cpu);
>  		break;
>  	default:
>  		break;
