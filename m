From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 6/7] cpufreq_stats: do not remove sysfs files if frequency
 table is not present
Date: Wed, 6 Feb 2013 07:48:32 +0530
Message-ID: <CAOh2x=nzZAgU4MXKVGSbLTT53yfZkMxsLSxA_nihMiBMkBABgQ@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-7-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=UAKBCe1wr5dktn+/Nm6Gxv/awA1QjjgKRP4BoYIQ1F8=;
        b=riaLkS6Mtb2XjG41p8ZvUnH1mRZyBCq0IqDii5vRmsUGGIcjfl3MqddS70t8hM6SSK
         GxH/UfS1nilKN+IwiQphMbinLk1DbGsAhrN9jm7V5g8/a2uqyrAu3ftIe8YlW0QjFIKQ
         oMkKYPd6TP6shqPTIubfra99g67hvOgjZ0we7XL/9Ipa2Oz2LysDceQULC7re2iF/ZHa
         2VHe6ilLIVh+yo0USpyb2BrvfRqRL/70HexOSftnTd6EymV0fylotfIrjGtYq+Q1sWFg
         pGDSan6TGpKZ3oruT0vS8M/uPzR8oXNI+YVOL+WkHUVscZOFFDNIGRTttAcmUHnDThdz
         FwDg==
In-Reply-To: <1360088646-19104-7-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> The sysfs files for cpufreq_stats are created in cpufreq_stats_create_table()
> called from cpufreq_stat_notifier_policy() when a policy is added to
> the cpu. cpufreq_stats_create_table() will not be called if the
> scaling driver does not export a frequency table to cpufreq.  Use the
> same fence on tear down.
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/cpufreq_stats.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
> index 572124c..fb001e2 100644
> --- a/drivers/cpufreq/cpufreq_stats.c
> +++ b/drivers/cpufreq/cpufreq_stats.c
> @@ -185,6 +185,11 @@ static void cpufreq_stats_free_table(unsigned int cpu)
>  static void cpufreq_stats_free_sysfs(unsigned int cpu)
>  {
>         struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +       struct cpufreq_frequency_table *table;
> +
> +       table = cpufreq_frequency_get_table(cpu);
> +       if (!table)
> +               return;

Because we aren't using table later on, i would write it as:

> +       if (!cpufreq_frequency_get_table(cpu))
> +               return;
