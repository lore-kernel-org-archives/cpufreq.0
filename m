From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 1/2] cpupower: Show Intel turbo ratio support via
 ./cpupower frequency-info
Date: Fri, 29 Jul 2011 19:38:02 +0200
Message-ID: <20110729173801.GB30265@comet.dominikbrodowski.net>
References: <1311242094-79312-1-git-send-email-trenn@suse.de>
 <1311242094-79312-2-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1311242094-79312-2-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: lenb@kernel.org, cpufreq@vger.kernel.org

Applied both patches, thanks.

	Dominik

On Thu, Jul 21, 2011 at 11:54:53AM +0200, Thomas Renninger wrote:
> This adds the last piece missing from turbostat (if called with -v).
> It shows on Intel machines supporting Turbo Boost how many cores
> have to be active/idle to enter which boost mode (frequency).
> 
> Whether the HW really enters these boost modes can be verified via
> ./cpupower monitor.
> 
> Signed-off-by: Thomas Renninger <trenn@suse.de>
> CC: lenb@kernel.org
> CC: linux@dominikbrodowski.net
> CC: cpufreq@vger.kernel.org
> ---
>  tools/power/cpupower/utils/cpufreq-info.c    |   54 ++++++++++++++++++++------
>  tools/power/cpupower/utils/helpers/cpuid.c   |   29 +++++++++++++-
>  tools/power/cpupower/utils/helpers/helpers.h |   13 ++++--
>  tools/power/cpupower/utils/helpers/msr.c     |   16 ++++++++
>  4 files changed, 95 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/power/cpupower/utils/cpufreq-info.c b/tools/power/cpupower/utils/cpufreq-info.c
> index 8628644..5a1d25f 100644
> --- a/tools/power/cpupower/utils/cpufreq-info.c
> +++ b/tools/power/cpupower/utils/cpufreq-info.c
> @@ -165,26 +165,56 @@ static int get_boost_mode(unsigned int cpu)
>  	printf(_("    Supported: %s\n"), support ? _("yes") : _("no"));
>  	printf(_("    Active: %s\n"), active ? _("yes") : _("no"));
>  
> -	/* ToDo: Only works for AMD for now... */
> -
>  	if (cpupower_cpu_info.vendor == X86_VENDOR_AMD &&
>  	    cpupower_cpu_info.family >= 0x10) {
>  		ret = decode_pstates(cpu, cpupower_cpu_info.family, b_states,
>  				     pstates, &pstate_no);
>  		if (ret)
>  			return ret;
> -	} else
> -		return 0;
>  
> -	printf(_("    Boost States: %d\n"), b_states);
> -	printf(_("    Total States: %d\n"), pstate_no);
> -	for (i = 0; i < pstate_no; i++) {
> -		if (i < b_states)
> -			printf(_("    Pstate-Pb%d: %luMHz (boost state)\n"),
> -			       i, pstates[i]);
> +		printf(_("    Boost States: %d\n"), b_states);
> +		printf(_("    Total States: %d\n"), pstate_no);
> +		for (i = 0; i < pstate_no; i++) {
> +			if (i < b_states)
> +				printf(_("    Pstate-Pb%d: %luMHz (boost state)"
> +					 "\n"), i, pstates[i]);
> +			else
> +				printf(_("    Pstate-P%d:  %luMHz\n"),
> +				       i - b_states, pstates[i]);
> +		}
> +	} else if (cpupower_cpu_info.caps & CPUPOWER_CAP_HAS_TURBO_RATIO) {
> +		double bclk;
> +		unsigned long long intel_turbo_ratio = 0;
> +		unsigned int ratio;
> +
> +		/* Any way to autodetect this ? */
> +		if (cpupower_cpu_info.caps & CPUPOWER_CAP_IS_SNB)
> +			bclk = 100.00;
>  		else
> -			printf(_("    Pstate-P%d:  %luMHz\n"),
> -			       i - b_states, pstates[i]);
> +			bclk = 133.33;
> +		intel_turbo_ratio = msr_intel_get_turbo_ratio(cpu);
> +		dprint ("    Ratio: 0x%llx - bclk: %f\n",
> +			intel_turbo_ratio, bclk);
> +
> +		ratio = (intel_turbo_ratio >> 24) & 0xFF;
> +		if (ratio)
> +			printf(_("    %.0f MHz max turbo 4 active cores\n"),
> +			       ratio * bclk);
> +
> +		ratio = (intel_turbo_ratio >> 16) & 0xFF;
> +		if (ratio)
> +			printf(_("    %.0f MHz max turbo 3 active cores\n"),
> +			       ratio * bclk);
> +
> +		ratio = (intel_turbo_ratio >> 8) & 0xFF;
> +		if (ratio)
> +			printf(_("    %.0f MHz max turbo 2 active cores\n"),
> +			       ratio * bclk);
> +
> +		ratio = (intel_turbo_ratio >> 0) & 0xFF;
> +		if (ratio)
> +			printf(_("    %.0f MHz max turbo 1 active cores\n"),
> +			       ratio * bclk);
>  	}
>  	return 0;
>  }
> diff --git a/tools/power/cpupower/utils/helpers/cpuid.c b/tools/power/cpupower/utils/helpers/cpuid.c
> index 944b2c1..a97f091 100644
> --- a/tools/power/cpupower/utils/helpers/cpuid.c
> +++ b/tools/power/cpupower/utils/helpers/cpuid.c
> @@ -130,10 +130,37 @@ out:
>  			cpu_info->caps |= CPUPOWER_CAP_AMD_CBP;
>  	}
>  
> -	/* Intel's perf-bias MSR support */
>  	if (cpu_info->vendor == X86_VENDOR_INTEL) {
> +		/* Intel's perf-bias MSR support */
>  		if (cpuid_level >= 6 && (cpuid_ecx(6) & (1 << 3)))
>  			cpu_info->caps |= CPUPOWER_CAP_PERF_BIAS;
> +
> +		/* Intel's Turbo Ratio Limit support */
> +		if (cpu_info->family == 6) {
> +			switch (cpu_info->model) {
> +			case 0x1A:	/* Core i7, Xeon 5500 series
> +					 * Bloomfield, Gainstown NHM-EP
> +					 */
> +			case 0x1E:	/* Core i7 and i5 Processor
> +					 * Clarksfield, Lynnfield, Jasper Forest
> +					 */
> +			case 0x1F:	/* Core i7 and i5 Processor - Nehalem */
> +			case 0x25:	/* Westmere Client
> +					 * Clarkdale, Arrandale
> +					 */
> +			case 0x2C:	/* Westmere EP - Gulftown */
> +				cpu_info->caps |= CPUPOWER_CAP_HAS_TURBO_RATIO;
> +			case 0x2A:	/* SNB */
> +			case 0x2D:	/* SNB Xeon */
> +				cpu_info->caps |= CPUPOWER_CAP_HAS_TURBO_RATIO;
> +				cpu_info->caps |= CPUPOWER_CAP_IS_SNB;
> +				break;
> +			case 0x2E:	/* Nehalem-EX Xeon - Beckton */
> +			case 0x2F:	/* Westmere-EX Xeon - Eagleton */
> +			default:
> +				break;
> +			}
> +		}
>  	}
>  
>  	/*	printf("ID: %u - Extid: 0x%x - Caps: 0x%llx\n",
> diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
> index 048f065..9125a55 100644
> --- a/tools/power/cpupower/utils/helpers/helpers.h
> +++ b/tools/power/cpupower/utils/helpers/helpers.h
> @@ -52,10 +52,12 @@ extern int be_verbose;
>  enum cpupower_cpu_vendor {X86_VENDOR_UNKNOWN = 0, X86_VENDOR_INTEL,
>  			  X86_VENDOR_AMD, X86_VENDOR_MAX};
>  
> -#define CPUPOWER_CAP_INV_TSC	0x00000001
> -#define CPUPOWER_CAP_APERF	0x00000002
> -#define CPUPOWER_CAP_AMD_CBP	0x00000004
> -#define CPUPOWER_CAP_PERF_BIAS	0x00000008
> +#define CPUPOWER_CAP_INV_TSC		0x00000001
> +#define CPUPOWER_CAP_APERF		0x00000002
> +#define CPUPOWER_CAP_AMD_CBP		0x00000004
> +#define CPUPOWER_CAP_PERF_BIAS		0x00000008
> +#define CPUPOWER_CAP_HAS_TURBO_RATIO	0x00000010
> +#define CPUPOWER_CAP_IS_SNB		0x00000011
>  
>  #define MAX_HW_PSTATES 10
>  
> @@ -111,6 +113,7 @@ extern int write_msr(int cpu, unsigned int idx, unsigned long long val);
>  
>  extern int msr_intel_set_perf_bias(unsigned int cpu, unsigned int val);
>  extern int msr_intel_get_perf_bias(unsigned int cpu);
> +extern unsigned long long msr_intel_get_turbo_ratio(unsigned int cpu);
>  
>  extern int msr_intel_has_boost_support(unsigned int cpu);
>  extern int msr_intel_boost_is_active(unsigned int cpu);
> @@ -157,6 +160,8 @@ static inline int msr_intel_set_perf_bias(unsigned int cpu, unsigned int val)
>  { return -1; };
>  static inline int msr_intel_get_perf_bias(unsigned int cpu)
>  { return -1; };
> +static inline unsigned long long msr_intel_get_turbo_ratio(unsigned int cpu)
> +{ return 0; };
>  
>  static inline int msr_intel_has_boost_support(unsigned int cpu)
>  { return -1; };
> diff --git a/tools/power/cpupower/utils/helpers/msr.c b/tools/power/cpupower/utils/helpers/msr.c
> index 93d48bd..7869ca6 100644
> --- a/tools/power/cpupower/utils/helpers/msr.c
> +++ b/tools/power/cpupower/utils/helpers/msr.c
> @@ -11,6 +11,7 @@
>  #define MSR_IA32_PERF_STATUS		0x198
>  #define MSR_IA32_MISC_ENABLES		0x1a0
>  #define MSR_IA32_ENERGY_PERF_BIAS	0x1b0
> +#define MSR_NEHALEM_TURBO_RATIO_LIMIT	0x1ad
>  
>  /*
>   * read_msr
> @@ -79,6 +80,7 @@ int msr_intel_has_boost_support(unsigned int cpu)
>  	ret = read_msr(cpu, MSR_IA32_MISC_ENABLES, &misc_enables);
>  	if (ret)
>  		return ret;
> +
>  	return (misc_enables >> 38) & 0x1;
>  }
>  
> @@ -119,4 +121,18 @@ int msr_intel_set_perf_bias(unsigned int cpu, unsigned int val)
>  		return ret;
>  	return 0;
>  }
> +
> +unsigned long long msr_intel_get_turbo_ratio(unsigned int cpu)
> +{
> +	unsigned long long val;
> +	int ret;
> +
> +	if (!(cpupower_cpu_info.caps & CPUPOWER_CAP_HAS_TURBO_RATIO))
> +		return -1;
> +
> +	ret = read_msr(cpu, MSR_NEHALEM_TURBO_RATIO_LIMIT, &val);
> +	if (ret)
> +		return ret;
> +	return val;
> +}
>  #endif
> -- 
> 1.7.3.4
> 
