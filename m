From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/2] powernow-k8: Don't notify of successful
 transition if we failed.
Date: Thu, 16 Jun 2011 17:45:10 +0200
Message-ID: <20110616154510.GA13350@eferding.osrc.amd.com>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
 <1308164520-14145-2-git-send-email-konrad.wilk@oracle.com>
 <20110615221636.GB9725@liondog.tnic>
 <20110615222608.GA14031@dumpdata.com>
 <20110616142440.GA5576@dumpdata.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308239092; bh=r+7WgCpC/OtxBGV6Tq6SX14L4+fHhHj5rZWJK2RKW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=N1KgPfVWXRzNCtv6k4BuDqnsaeFN8DJuPuVSHq
	tciGKSm1g10hkkKeLBFFK/mb8ab2ceEjTvE6WHj78/EtkqQ1MwlonqRvw8lpMs49/tx
	JsV7/j4iFEpgkiYOLufW1dxdj9HHTdVINVhRpgFqj97Yae2iAMxnm5Vjlw3T2tVbr4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1308239091; bh=r+7WgCpC/OtxBGV6Tq6SX14L4+fHhHj5rZWJK2RKW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=Jbs8+ijecJG7/sjkE6GV3+vmF++Mf4sQ9LcwJG
	q4hZQjbrUJUMcbHFYSTJTAMDn4xMbtNfIkL0Jis2ZCm80LOFqZ9BMpoNuwcgI/A6Vok
	vp5840wFZpK4a+D4hplRinR+yKDq2d8f3ehLbm0UoUdYz3hZ8odYATM+5VQl/WagvA=
Content-Disposition: inline
In-Reply-To: <20110616142440.GA5576@dumpdata.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-kernel@vger.kernel.org, davej@redhat.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, cpufreq@vger.kernel.org, andre.przywara@amd.com, Mark.Langsdorf@amd.com

On Thu, Jun 16, 2011 at 10:24:40AM -0400, Konrad Rzeszutek Wilk wrote:
> On Wed, Jun 15, 2011 at 06:26:08PM -0400, Konrad Rzeszutek Wilk wrote:
> > > > @@ -1112,6 +1114,9 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
> > > >  	}
> > > >  
> > > >  	res = transition_pstate(data, pstate);
> > > > +	if (res)
> > > > +		return res;
> > > 
> > > That's wrong because transition_pstate() returns 0 unconditionally
> > > (at least it does so on 3.0-rc3). But this change accidentally fixes
> > > a different bug because res is used uninitialized, containing stack
> > > garbage otherwise.
> > > 
> > > A proper fix should be to check against data->max_hw_pstate and
> > > check whether the entry is not CPUFREQ_ENTRY_INVALID (look at
> > > fill_powernow_table_pstate() for example).
> > 
> > Aha! I can respin a patch for that tomorrow.
> 
> I divided it in two patches - so that the Reported/Tested-by tag is on
> the translate_vid patch with its full glory of explanation. The
> pstate checking is removed.
> 
> Will post the other patch under a different subject.
> 
> From 3ae9a2094d893ab1a500833a48cb29e0f1c81ed8 Mon Sep 17 00:00:00 2001
> From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Date: Thu, 16 Jun 2011 09:02:57 -0400
> Subject: [PATCH 1/2] [CPUFREQ] powernow-k8: Don't notify of successful
>  transition if we failed (vid case).
> 
> Before this patch if we failed the vid transition would still try to
> submit the "new" frequencies to cpufreq.
> That is incorrect - also we could submit a non-existing frequency value
> which would cause cpufreq to crash. The ultimate fix is in cpufreq
> to deal with incorrect values, but this patch improves the error
> recovery in the AMD powernowk8 driver.
> 
> The failure that was reported was as follow:

					follows:
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
> cpufreq gracefully handle bogus data (another patch).
> 
> CC: Borislav Petkov <bp@alien8.de>
> CC: andre.przywara@amd.com
> CC: Mark.Langsdorf@amd.com
> Reported-by: Tobias Diedrich <ranma+xen@tdiedrich.de>
> Tested-by: Tobias Diedrich <ranma+xen@tdiedrich.de>
> [v1: Rebased on v3.0-rc2, reduced patch to deal with vid case]
> Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> ---
>  drivers/cpufreq/powernow-k8.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
> index 83479b6..fe53572 100644
> --- a/drivers/cpufreq/powernow-k8.c
> +++ b/drivers/cpufreq/powernow-k8.c
> @@ -1079,6 +1079,8 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
>  	}
>  
>  	res = transition_fid_vid(data, fid, vid);
> +	if (res)
> +		return res;

a newline here please.

>  	freqs.new = find_khz_freq_from_fid(data->currfid);
>  
>  	for_each_cpu(i, data->available_cores) {


Other than that:

Acked-by: Borislav Petkov <bp@alien8.de>

-- 
Regards/Gruss,
Boris.
