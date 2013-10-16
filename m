From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] Remove unnecessary braces
Date: Wed, 16 Oct 2013 10:02:45 +0530
Message-ID: <CAKohpo=4AyyVkiwQikPDMXQzSFLhhOeVsGjFBcUqYDMvkFkruw@mail.gmail.com>
References: <20131015174251.GA4366@eee-laptop>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20131015174251.GA4366@eee-laptop>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeny Kapaev <orener300@gmail.com>
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

On 15/10/2013, Evgeny Kapaev <orener300@gmail.com> wrote:
> As per coding style, braces {} are not necessary for single statement block
>
> Signed-off-by: Evgeny Kapaev <orener300@gmail.com>
> ---
>  drivers/cpufreq/speedstep-centrino.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/speedstep-centrino.c
> b/drivers/cpufreq/speedstep-centrino.c
> index f897d51..98797a6 100644
> --- a/drivers/cpufreq/speedstep-centrino.c
> +++ b/drivers/cpufreq/speedstep-centrino.c
> @@ -373,9 +373,8 @@ static int centrino_cpu_init(struct cpufreq_policy
> *policy)
>  		return -ENODEV;
>  	}
>
> -	if (centrino_cpu_init_table(policy)) {
> +	if (centrino_cpu_init_table(policy))
>  		return -ENODEV;
> -	}
>
>  	/* Check to see if Enhanced SpeedStep is enabled, and try to
>  	   enable it if not. */

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
