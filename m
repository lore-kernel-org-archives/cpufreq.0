From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq_conservative: initialize the cpu_dbs_info_s cpu field
Date: Tue, 23 Apr 2013 20:49:13 +0530
Message-ID: <CAOh2x=nZir=RohrbVJa1iWR47nmLKfG3it1UnWdt49oAKrBhWw@mail.gmail.com>
References: <51769DB3.7030404@ccur.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=vBB2McTFNvpafG3qj18kQxUk+U6tg4n2oztM5i7Hd3Y=;
        b=0aDuDwSGQL+YQY4PjRjJOPE1Fj7vd5mNV34gejwjB/DNJyayrni/ew8qrxsMGtW2EZ
         MYLSv43ts3xzlHqlfTtnPPltJcvSdPWkNlJYxRF/0STCfEG4kJT+1wBuqkfg0esboMWF
         yJRsOi12LyieRj+w2voSzVSvXPT4ykHjr+gCrQkwrYKvmxAsP0Lgv0OKFdEeQRByuaTv
         rAhjl+iSV1/Va+K29EIO9JAcDz+ALu3eobvzq6YTEfZStBauym8QmofoSdWhL8OMcQzV
         16ApF51Ixuvbhq1Q+pDYbRZz8N8p6t9Ho2Qknyt55CJAeqa75uPeqjAq9E8+OGwjrY5Q
         R0Zw==
In-Reply-To: <51769DB3.7030404@ccur.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Blackwood <john.blackwood@ccur.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On Tue, Apr 23, 2013 at 8:11 PM, John Blackwood <john.blackwood@ccur.com> wrote:
> In the cpufreq conservative module, the cpu field in the cpu_dbs_info_s
> structure was not being initialized, and thus all cpus were scheduling
> their do_dbs_timer() delayed work processing on cpu 0.
>
> Signed-off-by: John Blackwood <john.blackwood@ccur.com>
> Index: b/drivers/cpufreq/cpufreq_conservative.c
> ===================================================================
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -506,6 +506,7 @@ static int cpufreq_governor_dbs(struct c
>                 }
>                 this_dbs_info->down_skip = 0;
>                 this_dbs_info->requested_freq = policy->cur;
> +               this_dbs_info->cpu = cpu;
>
>                 mutex_init(&this_dbs_info->timer_mutex);
>                 dbs_enable++;

What have you rebased this on? I don't think its the latest code and is probably
a bit old.
