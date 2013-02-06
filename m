From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/7] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Wed, 6 Feb 2013 07:17:16 +0530
Message-ID: <CAOh2x=nXQrgwm2Jw88GjQe-fjpJrK+cjTWd-vK377UEBeXGu3w@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-4-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=tPHOo2RSmCgg6qrGL3MdQZ+/RLv3ow6rQ7Uf9MB27UM=;
        b=nG9dgAgoNTdDypLM9xxbTXD02PXwFj+vYMb//xAczS9hTysch8F6VGQCb59+ri0XRV
         I+FzwxRBKEpuLGtk3kfzLI4S5yyu1qONzCYcWevrOrASJ9DisFtptQbMLBpgk5tbX03C
         N1EkEA6U63oM7K5uBsgIZ2BPKO/3gOW1yKkFOyVqT1St9jSV0ByJO/eb8pYhWadFwTKZ
         O94U7qJEdXxjmfmjRsW+OojrjxOuKEdfCVC6CChsSGUVoGoh9EI/lLtWThdSnv14RU0j
         BxZuhjG1J35It1gBACqCcSdv0bkA9KOtOaYrGKT+cEb7gYHuZXid2A34yRmb3o9oSs3d
         3C+g==
In-Reply-To: <1360088646-19104-4-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement cpufreq_driver.setpolicy() have
> internal governors and may/will change the current operating frequency
> very frequently this will cause cpufreq_out_of_sync() to be called
> every time. Only call cpufreq_driver.get() for drivers that implement
> cpufreq_driver.target()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 96bc302..d8daa4b 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1787,7 +1787,7 @@ int cpufreq_update_policy(unsigned int cpu)
>
>         /* BIOS might change freq behind our back
>           -> ask driver for current freq and notify governors about a change */
> -       if (cpufreq_driver->get) {
> +       if (cpufreq_driver->get && cpufreq_driver->target) {
>                 policy.cur = cpufreq_driver->get(cpu);
>                 if (!data->cur) {
>                         pr_debug("Driver did not initialize current freq");

I am really not liking copy-pasting my older comments here :(

"This would mean policy->cur has a garbage value. I don't really know
how would other routine behave on this. Would it make sense to make
policy->cur zero atleast?
"
