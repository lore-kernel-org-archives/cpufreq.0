From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/2] powernow-k8: Don't notify of successful
 transition if we failed.
Date: Thu, 16 Jun 2011 00:16:36 +0200
Message-ID: <20110615221636.GB9725@liondog.tnic>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
 <1308164520-14145-2-git-send-email-konrad.wilk@oracle.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308176199; bh=laC5JY7+b55HgsoxeS2MHHmKFnm0yOUbpL7DwWa4YtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=jX5HjU1Yy4oAsHDqSc3IT6phWuPliQROK1X3Kb
	11v+RNiqx1wdFbm2DADYdfcSCWGeaNkHWKYDBWBxxrRCPcormQz8KMKxdHHuQgvPa9z
	IKxhEKnFm2ClGGZGpB3m8SHg8tchNw6KaU4uyJ4N3iMOjl5qafx1Zl6/EV0+43Yv8M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308176198; bh=laC5JY7+b55HgsoxeS2MHHmKFnm0yOUbpL7DwWa4YtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=FZjGaY181ayWE9Tj2yBs+Ss71xixJfT7KqY6eq
	c7XmhnI/MAxDyy0wSMylx3j9i75lSf2t4fuUZFudFX8ylpdFv791bnEHtgXznCh0lg0
	WwwHBUqSJs9XWZ6hctZPbJg3IjhIrJXd75wxWOHqNHNK3XrcjgH9/1x3w2yMGVy3Ro=
Content-Disposition: inline
In-Reply-To: <1308164520-14145-2-git-send-email-konrad.wilk@oracle.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-kernel@vger.kernel.org, davej@redhat.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, cpufreq@vger.kernel.org, andre.przywara@amd.com, Mark.Langsdorf@amd.com

On Wed, Jun 15, 2011 at 03:01:59PM -0400, Konrad Rzeszutek Wilk wrote:
> Before this patch if we failed the transition (either p-state or
> voltage) we would still try to submit the "new" frequencies to cpufreq.
> That is incorrect - also we could submit a non-existing frequency value
> which would cause cpufreq to crash. The ultimate fix is in cpufreq
> to deal with incorrect values, but this patch improves the error
> recovery in the AMD powernowk8 driver.
> 
> The failure that was reported was as follow:
> 
> powernow-k8: Found 1 AMD Athlon(tm) 64 Processor 3700+ (1 cpu cores) (version 2.20.00)
> powernow-k8: fid 0x2 (1000 MHz), vid 0x12
> powernow-k8: fid 0xa (1800 MHz), vid 0xa
> powernow-k8: fid 0xc (2000 MHz), vid 0x8
> powernow-k8: fid 0xe (2200 MHz), vid 0x8
> Marking TSC unstable due to cpufreq changes
> powernow-k8: fid trans failed, fid 0x2, curr 0x0
> BUG: unable to handle kernel paging request at ffff880807e07b78
> IP: [<ffffffff81479163>] cpufreq_stats_update+0x46/0x5b
> ...
> 
> And transition fails and data->currfid ends up with 0. Since
> the machine does not support 800Mhz value when the calculation is
> done ('find_khz_freq_from_fid(data->currfid);') it reports the
> new frequency as 800000 which is bogus. This patch fixes
> the issue during target setting.
> 
> The patch however does not fix the issue in 'powernowk8_cpu_init'
> where the pol->cur can also be set with the 800000 value:
> 
>           pol->cur = find_khz_freq_from_fid(data->currfid);
>   dprintk("policy current frequency %d kHz\n", pol->cur);
> 
>   /* min/max the cpu is capable of */
>   if (cpufreq_frequency_table_cpuinfo(pol, data->powernow_table)) {
> 
> The fix for that looks to update cpufreq_frequency_table_cpuinfo to
> check pol->cur.... but that would cause an regression in how the
> acpi-cpufreq driver works (it sets cpu->cur after calling
> cpufreq_frequency_table_cpuinfo). Instead the fix will be to let
> cpufreq gracefully handle bogus data.
> 
> Reported-by: Tobias Diedrich <ranma+xen@tdiedrich.de>
> Tested-by: Tobias Diedrich <ranma+xen@tdiedrich.de>
> Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> ---
>  arch/x86/kernel/cpu/cpufreq/powernow-k8.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> index 2368e38..7e4a664 100644
> --- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> +++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> @@ -1079,8 +1079,10 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
>  	}
>  
>  	res = transition_fid_vid(data, fid, vid);
> -	freqs.new = find_khz_freq_from_fid(data->currfid);
> +	if (res)
> +		return res;
>  
> +	freqs.new = find_khz_freq_from_fid(data->currfid);
>  	for_each_cpu(i, data->available_cores) {
>  		freqs.cpu = i;
>  		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> @@ -1112,6 +1114,9 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
>  	}
>  
>  	res = transition_pstate(data, pstate);
> +	if (res)
> +		return res;

That's wrong because transition_pstate() returns 0 unconditionally
(at least it does so on 3.0-rc3). But this change accidentally fixes
a different bug because res is used uninitialized, containing stack
garbage otherwise.

A proper fix should be to check against data->max_hw_pstate and
check whether the entry is not CPUFREQ_ENTRY_INVALID (look at
fill_powernow_table_pstate() for example).

I'm guessing this oops happens when powernow-k8 is loaded in the guest
and that the actual power management is done in the hypervisor?

Adding some more people to CC.

-- 
Regards/Gruss,
    Boris.
