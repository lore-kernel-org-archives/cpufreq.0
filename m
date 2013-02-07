From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/5] cpufreq: Do not track governor name for scaling
 drivers with internal governors.
Date: Thu, 7 Feb 2013 16:13:38 +0530
Message-ID: <CAOh2x=m4dXaVJxLYnz_Kxc91VZwiwFyB9ounXK69Qd_Hn7LNDQ@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
	<1360170133-5066-5-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=AyfggG5OewT062/RE7tTadP8iUnCTjy4xczvgK5j5i4=;
        b=OQI5tmDwJZrtmdHCKwjZCuqDf73DfDgx1l5XUngMmrNefy+uR2UFSV2Zj/M98NucEQ
         DtICiLRwJOzIl8rM+otZsdePeukruteCBkCeM/aJU/oNza3uaWPM99xps3zpfJ1PLqRs
         etlH+ofrXSgsY6l+gw/59i6tCR/wirqCRPihuUR0gWv6wZImHKTuj1rUp/P4L6I/vzQj
         tRSWD/CWHwIC/vgsd8e0ZToI2E6CcyJdvDToGUZbnzX1nntmHtLTfj4hSfaG2I1CCC1l
         VyH8ddaT2zbyJijN/F7v11+U+PtVFb+YDN6G3nVnYwYfRsZBoVjwsMft8mHUa/AUf2Vk
         hg8Q==
In-Reply-To: <1360170133-5066-5-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wed, Feb 6, 2013 at 10:32 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement internal governors do not have governor
> structures assocaited with them.  Only track the name of the governor
> associated with the CPU if the driver does not implement
> cpufreq_driver.setpolicy()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/cpufreq.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0ba0344..e772053 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1049,7 +1049,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
>                 __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>
>  #ifdef CONFIG_HOTPLUG_CPU
> -       strncpy(per_cpu(cpufreq_cpu_governor, cpu), data->governor->name,
> +       if (!cpufreq_driver->setpolicy)
> +               strncpy(per_cpu(cpufreq_cpu_governor, cpu),
> +                       data->governor->name,
>                         CPUFREQ_NAME_LEN);

While applying this patch in my repo, i have merged above two lines into a
single line.
