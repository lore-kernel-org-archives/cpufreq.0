From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 3/8] cpufreq: Add compatibility hack to powernow-k8
Date: Wed, 22 Aug 2012 02:48:05 +0200
Message-ID: <201208220248.05674.trenn@suse.de>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com> <1343305724-2809-4-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1343305724-2809-4-git-send-email-andre.przywara@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andre Przywara <andre.przywara@amd.com>
Cc: cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 26 July 2012 14:28:39 Andre Przywara wrote:
> From: Matthew Garrett <mjg@redhat.com>
> 
> cpufreq modules are often loaded from init scripts that assume that all
> recent AMD systems will use powernow-k8, so we should ensure that loading
> it triggers a load of acpi-cpufreq if the latter is built as a module.
> This avoids the problem of users ending up without any cpufreq support
> after the transition.
> 
> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> Signed-off-by: Andre Przywara <andre.przywara@amd.com>
> ---
>  drivers/cpufreq/powernow-k8.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
> index c0e8164..6e35ed2 100644
> --- a/drivers/cpufreq/powernow-k8.c
> +++ b/drivers/cpufreq/powernow-k8.c
> @@ -1567,8 +1567,12 @@ static int __cpuinit powernowk8_init(void)
>  			supported_cpus++;
>  	}
>  
> -	if (supported_cpus != num_online_cpus())
> +	if (supported_cpus != num_online_cpus()) {
> +		if (static_cpu_has(X86_FEATURE_HW_PSTATE))
> +			request_module("acpi_cpufreq");
> +
>  		return -ENODEV;
> +	}
>  
This is bad/wrong and the patch should simply be left out.
cpufreq modules are autoloaded since some kernel versions and init
scripts loading cpufreq drivers are not needed anymore. This is done
by udev now.

Also request_module can have side effects and should get avoided if
possible.

I also wonder whether it's better to have the request_module() call,
that loads acpi-cpufreq from processor module, get removed. I sent
a patch a while ago to do that:
[PATCH] X86 acpi_cpufreq: Do not use request_module for autoloading

Two reasons:
  1) request_module (at least if called from another module) introduces
     dependencies.
     For example: We have fan.ko, thermal.ko and processor.ko in the initrd,
     as some laptops needed CPU thermal management as early as possible.
     If cpufreq acpi functions are available, it calls request_module(), but
     acpi-cpufreq is not in the initrd and does never get loaded.
  2) Most platforms with missing ACPI cpufreq functions for
     processors with these X86 features:
        X86_FEATURE_HW_PSTATE (AMD)
        X86_FEATURE_EST (Intel)
     can be considered to have buggy BIOSes.
     Especially for AMD it helped people a lot to mention that they should
     upgrade their BIOS in this case.

If 2. is not relevant anymore, request_module() could stay in processor driver,
but one should keep 1. in mind and best compile the processor driver into the
kernel then.

In any way, this patch should be left out, while the rest still works
as expected.

   Thomas
