From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] Make acpi-cpufreq more robust against BIOS freq
	changes behind our back
Date: Wed, 21 May 2008 15:15:01 +0200
Message-ID: <1211375701.29901.11.camel@queen.suse.de>
References: <482DCF52.6030307@awtrey.com>
	<20080519000810.GA11313@codemonkey.org.uk>
	<1211279939.21269.403.camel@queen.suse.de>
	<48341AB8.3090401@awtrey.com>
	<1211375286.29901.7.camel@queen.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1211375286.29901.7.camel@queen.suse.de>
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
To: "Anthony L. Awtrey" <tony@awtrey.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Greg KH <gregkh@suse.de>, Stable <Stable@kernel.org>, cpufreq@lists.linux.org.uk

On Wed, 2008-05-21 at 15:08 +0200, Thomas Renninger wrote:
> Hi,
> 
> Please consider this one for stable integration.
...
> If this one patches for you for 2.6.24.4 also, maybe it even gets in
> there.
Hmm, I added this to OpenSUSE 10.3, means 2.6.22.
I only had to adjust the arch/i386 vs arch/x86 patch.
If this gets into the stable kernel, I wonder how far back this makes
sense. Shall I send a 2.6.22 based version?

   Thomas
> 
> ------------
> 
> commit e56a727b023d40d1adf660168883f30f2e6abe0a
> Author: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> Date:   Mon Apr 28 15:13:43 2008 -0400
> 
>     [CPUFREQ] Make acpi-cpufreq more robust against BIOS freq changes behind our back.
>     
>     We checked the hardware freq with OS cached freq value in get_cur_freqon_cpu().
>     
>     Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
>     Signed-off-by: Thomas Renninger <trenn@suse.de>
>     Signed-off-by: Dave Jones <davej@redhat.com>
> 
> diff --git a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
> index e2d870d..8db8f73 100644
> --- a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
> +++ b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
> @@ -339,6 +339,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
>  {
>  	struct acpi_cpufreq_data *data = per_cpu(drv_data, cpu);
>  	unsigned int freq;
> +	unsigned int cached_freq;
>  
>  	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
>  
> @@ -347,7 +348,16 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
>  		return 0;
>  	}
>  
> +	cached_freq = data->freq_table[data->acpi_data->state].frequency;
>  	freq = extract_freq(get_cur_val(&cpumask_of_cpu(cpu)), data);
> +	if (freq != cached_freq) {
> +		/*
> +		 * The dreaded BIOS frequency change behind our back.
> +		 * Force set the frequency on next target call.
> +		 */
> +		data->resume = 1;
> +	}
> +
>  	dprintk("cur freq = %u\n", freq);
>  
>  	return freq;
> 
> 
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
