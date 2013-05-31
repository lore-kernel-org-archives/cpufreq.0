From: Len Brown <lenb@kernel.org>
Subject: Re: [PATCH] acpi-cpufreq: set current frequency based on target P-State
Date: Fri, 31 May 2013 17:33:17 -0400
Message-ID: <CAJvTdK=enFeKbUOyo7b8zu-E+CHR5CMzBWTfgEsSQ5f3SCw2Tw@mail.gmail.com>
References: <1370029517-10423-1-git-send-email-rosslagerwall@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=9MbYzZQhU45+ItD/5EMjNlcAwz+0OOTbOcV4/FpD49A=;
        b=gIYPnrdfCoqzMzzZVgvOHmjBFG2FrRc2+fW1QZoh+ZiuMIRMPVex7r05NFMJPHR5Av
         rha69g6cSc2OQ1P4oddlRDegtA+20foOUkE7rFSAH2OnEGG3Srp/Gitl7bDEIJ2pEuYt
         Q0bxCUu7dZWfS/M2xeqycu5+jsUmMtjKyeuxOw7o6JiTz+yo2UIYD1N/HMgQKpxCexzv
         g8QRAhmWCSsS4kliKIb8GKlf5/Bald0xsDowLsJvheYqpaklidx1SfnBxcy6JoYkP2y6
         9k+ZzLTdl3qx1a718MDZGPpZfm/EZHQYXQv1uibUdq5ktTx4kvDeXcRoRAUlkUELeja/
         en/A==
In-Reply-To: <1370029517-10423-1-git-send-email-rosslagerwall@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ross Lagerwall <rosslagerwall@gmail.com>
Cc: cpufreq@vger.kernel.org, Andre Przywara <andre.przywara@amd.com>, Matthew Garrett <mjg@redhat.com>

On Fri, May 31, 2013 at 3:45 PM, Ross Lagerwall <rosslagerwall@gmail.com> wrote:
>
> 4b31e774 fixed bug #4634 and caused the driver to always set the
> target P-State at least once since the initial P-State may not be the
> desired one.  5a1c0228 caused a regression in this behavior.
>
> This fixes the regression by setting policy->cur based on the CPU's
> target frequency rather than the CPU's current reported frequency
> (which may be different).  This means the P-State will be set initially
> if the CPU's target frequency is different from the governor's target
> frequency.
>
> This fixes an issue where setting the default governor to performance
> wouldn't correctly enable turbo mode on all cores.
>
> Signed-off-by: Ross Lagerwall <rosslagerwall@gmail.com>

Reviewed-by: Len Brown <len.brown@intel.com>

Ack -- MSR_IA32_PERF_STATUS is ill-conceived.  It is un-reliable
by its very definition.  Any code that depends on it should be questioned...

thanks,
Len Brown, Intel Open Source Technology Center

> ---
>  drivers/cpufreq/acpi-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
> index 11b8b4b..edc089e 100644
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -347,11 +347,11 @@ static u32 get_cur_val(const struct cpumask *mask)
>         switch (per_cpu(acfreq_data, cpumask_first(mask))->cpu_feature) {
>         case SYSTEM_INTEL_MSR_CAPABLE:
>                 cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
> -               cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
> +               cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
>                 break;
>         case SYSTEM_AMD_MSR_CAPABLE:
>                 cmd.type = SYSTEM_AMD_MSR_CAPABLE;
> -               cmd.addr.msr.reg = MSR_AMD_PERF_STATUS;
> +               cmd.addr.msr.reg = MSR_AMD_PERF_CTL;
>                 break;
>         case SYSTEM_IO_CAPABLE:
>                 cmd.type = SYSTEM_IO_CAPABLE;
> --
> 1.8.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html




--
Len Brown, Intel Open Source Technology Center
