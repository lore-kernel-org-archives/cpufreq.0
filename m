From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo
 cpufreq-info param
Date: Tue, 5 Oct 2010 16:47:17 +0200
Message-ID: <20101005144717.GA20505@aftab>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
 <1286281394-14699-6-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1286281394-14699-6-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux@dominikbrodowski.net" <linux@dominikbrodowski.net>, Len Brown <len.brown@intel.com>

From: Thomas Renninger <trenn@suse.de>
Date: Tue, Oct 05, 2010 at 08:23:14AM -0400

> Prints out this by default (also works with --cpu X param):
>   Analyzing Boost Capabilities on CPU 0:
>   Supported: yes
>   Active: yes

I think it would be simpler if you dump the boosting information in
cpufreq-info, i.e. without an explicit --boost option or whatever. You
can then use the "--boost" option to control the boosting like this:

cpufreq-set --boost (on|off) - toggles boosting
cpufreq-set --boost - without an option could dump the current boosting setting.

Hmm...

> With activation one has to be careful...
> On AMD, it's enough if any of the CPUs shows "Active: no" and boost mode
> is not active (cmp with powernow-k8 kernel code).

yes. But we keep it consistent so that all cores show either off or on.

<snip>

> Possible further enhancements:
>    cpufreq-set --turbo_active (or similar)

see above.

> to enable/disable turbo/boost mode.
> 
> For AMD there already is:
> /sys/devices/system/cpu/cpu0/cpufreq/cpb
> but this could all get handled in userspace and this recently introduced
> interface could get removed again.

I don't think it will be removed soon. Rather, if you use the /sysfs
interface you need kernel support for it and cpufrequtils might run on
older kernels which don't have the feature yet. So you want to do all
the detection/control in userspace, independent from the kernel version.

> Then enabling/disabling could all be done on CPU 0 which cannot be taken
> offline.
>   -> To be discussed.

You need to enable/disable the boosting on AMD by toggling bit 25 in
MSR_K7_HWCR on all cpus.

> Potentially dangerous is if cores get offlined while boost mode got
> disbled, then the userspace tool would not be able to enable it again.
> But as this stuff is meant for debugging and performance measuring
> only, it should be enough to document this a bit in a manpage...

You can issue a warning whenever you detect that a subset of the cores
has been offlined. Then the tool should fail changing the boosting
state, IMHO.

> Signed-off-by: Thomas Renninger <trenn@suse.de>
> CC: Dominik Brodowski <linux@dominikbrodowski.net>
> CC: cpufreq@vger.kernel.org
> CC: Borislav Petkov <borislav.petkov@amd.com>
> CC: Len Brown <len.brown@intel.com>
> ---
>  lib/cpufreq.c        |   37 +++++++++++++++++++++++++++++++++++++
>  lib/cpufreq.h        |    8 ++++++++
>  lib/msr.c            |   37 +++++++++++++++++++++++++++++++++++++
>  lib/msr.h            |    5 +++++
>  utils/cpufreq-info.c |   29 ++++++++++++++++++++++++++++-
>  5 files changed, 115 insertions(+), 1 deletions(-)
> 
> diff --git a/lib/cpufreq.c b/lib/cpufreq.c
> index ae7d8c5..0b5fe9f 100644
> --- a/lib/cpufreq.c
> +++ b/lib/cpufreq.c
> @@ -12,6 +12,8 @@
>  
>  #include "cpufreq.h"
>  #include "sysfs.h"
> +#include "cpuid.h"
> +#include "msr.h"
>  
>  int cpufreq_cpu_exists(unsigned int cpu)
>  {
> @@ -188,3 +190,38 @@ unsigned long cpufreq_get_transitions(unsigned int cpu) {
>  
>  	return (ret);
>  }
> +
> +int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active)
> +{
> +	struct cpupower_cpu_info cpu_info;
> +	int ret;
> +
> +	*support = *active = 0;
> +
> +	ret = get_cpu_info(0, &cpu_info);
> +	if (ret)
> +		return ret;
> +
> +	if (cpu_info.vendor == X86_VENDOR_INTEL) {
> +		ret = msr_intel_has_boost_support(cpu);
> +		if (ret <= 0)
> +			return ret;
> +		*support = ret;
> +		ret = msr_intel_boost_is_active(cpu);
> +		if (ret <= 0)
> +			return ret;
> +		*active = ret;
> +	} else if (cpu_info.vendor == X86_VENDOR_AMD) {
> +		if (cpu_info.ext_cpuid_level < 0x80000007)
> +			return 0;
> +		if ((cpuid_edx(0x80000007) >> 9) & 0x1)
> +			*support = 1;
> +		else
> +			return 0;

wrap this in amd_has_boost_support()?

> +		ret = msr_amd_boost_is_active(cpu);
> +		if (ret <= 0)
> +			return ret;
> +		*active = ret;
> +	}
> +	return 0;
> +}
> diff --git a/lib/cpufreq.h b/lib/cpufreq.h
> index 03be906..506b6fc 100644
> --- a/lib/cpufreq.h
> +++ b/lib/cpufreq.h
> @@ -208,6 +208,14 @@ extern int cpufreq_modify_policy_governor(unsigned int cpu, char *governor);
>  
>  extern int cpufreq_set_frequency(unsigned int cpu, unsigned long target_frequency);
>  
> +/* get boost mode support/activation
> + *
> + * Check whether Intel's "Turbo Boost Technology" or AMD's
> + * "Dynamic Speed Boost Technology" is supported and if, whether it's activated
> + */
> +extern int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active);
> +
> +
>  #ifdef __cplusplus
>  }
>  #endif
> diff --git a/lib/msr.c b/lib/msr.c
> index bccea8d..9921ff1 100644
> --- a/lib/msr.c
> +++ b/lib/msr.c
> @@ -18,6 +18,8 @@
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  
> +#define MSR_IA32_MISC_ENABLES	0x1a0
> +
>  
>  /* General X86 MSRs */
>  #define MSR_IA32_APERF		0x000000E8
> @@ -25,9 +27,11 @@
>  
>  /* AMD specific MSRs */
>  #define MSR_FIDVID_STATUS	0xc0010042
> +#define MSR_K7_HWCR		0xc0010015
>  
>  /* Intel specific MSRs */
>  #define MSR_IA32_PERF_STATUS	0x198
> +#define MSR_IA32_MISC_ENABLES	0x1a0
>  
>  /* AMD specific bits */
>  #define AMD_S_HI_CURRENT_VID	0x0000001f
> @@ -123,8 +127,41 @@ int msr_amd_get_fidvid(unsigned int cpu, uint32_t *fid, uint32_t *vid)
>  	return 0;
>  }
>  
> +int msr_amd_boost_is_active(unsigned int cpu)
> +{
> +	uint64_t k7_hwcr;
> +	int ret;
> +
> +	ret = read_msr(cpu, MSR_K7_HWCR, &k7_hwcr);
> +	if (ret)
> +		return ret;
> +	return !((k7_hwcr >> 25) & 0x1);
> +}

This should be done differently on AMD: we want to
iterate over all cores and check this bit and see
whether its setting is consistent. See how it is done in
<arch/x86/kernel/cpu/cpufreq/powernow-k8.c::powernowk8_init()> in the
kernel.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
