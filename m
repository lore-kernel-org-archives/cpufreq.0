From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] Add module aliases for acpi-cpufreq
Date: Tue, 22 Jan 2013 18:38:36 +0100
Message-ID: <20130122173835.GB6431@pd.tnic>
References: <1358872944-7676-1-git-send-email-matthew.garrett@nebula.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358876141; bh=yCI2ZuEP211Gq3HaB9ylKa2Jh0bn8iYC3Upk1K2bmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=n/RcK/u+OlInSm1tyb1E8px39iB0TS+lSx9LY+
	xSiwMXTEC+2AhedU5xxThBeLgj3WAQjBoHS6zJzW+D1RjO4pArTWIL04bMDH06tQmig
	mIbtDtNPGSxfYgxTaMzAn/H891kDZLBn9N/CM/P9kxWUMJAC2qJzw02udR+zwJbFEY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1358876140; bh=yCI2ZuEP211Gq3HaB9ylKa2Jh0bn8iYC3Upk1K2bmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=tpuk8tS4R4Lp7KPvq7V5tZybQRj9zMUh/xShs1
	SrT6+3gXoEKjDkcEZlVybWEdUz8I15YqwlPTOuEHmzlzFlfmcaHIysIPSdTSgLXVmMi
	7Shzbx6UHM7ayhI68RBJ5wuIu/fj370/z/T1/ILCknmLkS3QOq7NKPZyAKk2wj8GVg=
Content-Disposition: inline
In-Reply-To: <1358872944-7676-1-git-send-email-matthew.garrett@nebula.com>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: rjw@sisk.pl, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Leonid Isaev <lisaev@umail.iu.edu>

On Tue, Jan 22, 2013 at 11:42:24AM -0500, Matthew Garrett wrote:
> The acpi core will call request_module("acpi-cpufreq") on subsystem init,
> but this will fail if the module isn't available at that stage of boot.
> Add some module aliases to ensure that udev can load the module on Intel
> and AMD systems with the appropriate feature bits - I /think/ that this
> will also work on VIA systems, but haven't verified that.
> 
> Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>

Let's add some more tags:

Link: http://lkml.kernel.org/r/1448223.sdUJnNSRz4@vostro.rjw.lan
Tested-by: Leonid Isaev <lisaev@umail.iu.edu>
Acked-by: Borislav Petkov <bp@suse.de>

Rafael, this is all yours. :-)

Thanks.

> ---
>  drivers/cpufreq/acpi-cpufreq.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
> index 0d048f6..7b0d49d 100644
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -1030,4 +1030,11 @@ MODULE_PARM_DESC(acpi_pstate_strict,
>  late_initcall(acpi_cpufreq_init);
>  module_exit(acpi_cpufreq_exit);
>  
> +static const struct x86_cpu_id acpi_cpufreq_ids[] = {
> +	X86_FEATURE_MATCH(X86_FEATURE_ACPI),
> +	X86_FEATURE_MATCH(X86_FEATURE_HW_PSTATE),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, acpi_cpufreq_ids);
> +
>  MODULE_ALIAS("acpi");
> -- 
> 1.8.0.2
> 
> 

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
