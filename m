From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 5/7] cpufreq: balance out cpufreq_cpu_{get,put} for
 scaling drivers using setpolicy
Date: Wed, 6 Feb 2013 07:28:26 +0530
Message-ID: <CAOh2x=kJPFyhkG3y_q=a5ciG1HRAn-JkoVYy9OZ9POA+-isbCQ@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-6-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=kXfsJtth57/3EsCRDfEguOBJso+lnGRg9w7iG9B1XPc=;
        b=JlBYvCSMqrJ68NgWpLe1tbbV2kcZAICPnmi85z3LHEpuybimcPlNpbzA/c5kWJxHHg
         Ggx8Bjuvov8qsDE1NGo6B9jr1EhUAcQ4Kgfk4Qsd0lWGNBmOargyuMiRyaAoS6wDryNJ
         aowNJ1VIoR/5f7pU/MCTaWuwZ0OoHrJt9smo8jvrBBvvQXPwpp09yC2jg/qjCrsWqS15
         twO7ql6IarsoQ8ZUnkIoUxlIVuGvgDfoDW3a5YE+F1+HMvz/ao75wuKx/0Uq3dzbpGj6
         03qQiWjZW/gndN6lh3JrPz+akU6dJdSDQlCOo9BbKQ2p6PhyWV2VB1brWE3LhTSfLsKX
         ZMkg==
In-Reply-To: <1360088646-19104-6-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> There is an additional reference added to the driver in
> cpufreq_add_dev()  that is removed in__cpufreq_governor() if the
> driver implements target().  Remove the last reference when the
> driver implements setpolicy()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 622e282..d17477b 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1049,6 +1049,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
>         if (cpufreq_driver->target)
>                 __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>
> +       if (cpufreq_driver->setpolicy)
> +               cpufreq_cpu_put(data);

I don't understand this patch at all.. I grepped both cpufreq_cpu_get() & put()
in bleeding-edge and found everything to be correct.

Can you please point me to the exact line numbers ?
