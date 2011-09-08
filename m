From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] cpufreq: pcc-cpufreq: sanity check to prevent a NULL
 pointer dereference
Date: Thu, 8 Sep 2011 16:52:57 -0700
Message-ID: <20110908165257.7b613baf.akpm@linux-foundation.org>
References: <20110831200910.27633.20372.sendpatchset@nchumbalkar.americas.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110831200910.27633.20372.sendpatchset@nchumbalkar.americas.cpqcorp.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Cc: davej@codemonkey.org.uk, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, stable@kernel.org

On Wed, 31 Aug 2011 20:08:45 +0000 (UTC)
Naga Chumbalkar <nagananda.chumbalkar@hp.com> wrote:

> If, for whatever reason, "pr" ends up being NULL we would end up in a PANIC 
> as seen below:
> 
> Loading CPUFreq modules[  437.661360] BUG: unable to handle kernel NULL pointer
> dereference at (null)
> IP: [<ffffffffa0434314>] pcc_cpufreq_cpu_init+0x74/0x220 [pcc_cpufreq]
> 
> It's better to prevent the PANIC by failing the driver, and allowing the system to boot.
> 
> Signed-off-by: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
> Cc: stable@kernel.org
> 
> diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> index 7b0603e..cdc02ac 100644
> --- a/drivers/cpufreq/pcc-cpufreq.c
> +++ b/drivers/cpufreq/pcc-cpufreq.c
> @@ -261,6 +261,9 @@ static int pcc_get_offset(int cpu)
>  	pr = per_cpu(processors, cpu);
>  	pcc_cpu_data = per_cpu_ptr(pcc_cpu_info, cpu);
>  
> +	if (!pr)
> +		return -ENODEV;
> +
>  	status = acpi_evaluate_object(pr->handle, "PCCP", NULL, &buffer);
>  	if (ACPI_FAILURE(status))
>  		return -ENODEV;

hm, from reading drivers/acpi/processor_driver.c it appears that
per_cpu(processors, n)==NULL is an expected and valid state.  Heaven
knows what that state actually *means* - apparently this is a secret.

I assume that you've hit this crash in real live code, hence your
suggestion of a -stable backport?
