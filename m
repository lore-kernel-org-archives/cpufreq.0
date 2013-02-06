From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 4/7] cpufreq: Do not track governor name for scaling
 drivers with internal governors.
Date: Wed, 6 Feb 2013 07:20:32 +0530
Message-ID: <CAOh2x==4Zi=-bLh3SBxjp0xpc6P3WV3wcctLnV3kQUhjuGhPqw@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-5-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=6JA9P0g4j4Zn7PRfQXBnHQ+JFcdOgruK1U4qPFF8F8k=;
        b=a6B6EN2FSDp1Zregc/Bw+uwfrmiONzLB1/FANJHacuQF0a1XVPvBKE4Viv4Qj3QBV+
         abiUQWnq7yvn7ekCfi5VmTfer+T+TsYuufh6Y5cm/Rsa65aNkJ1j2L/+KTXpx64kBvbE
         MoVvIigSw8Sx3P2OQEs9zQQaoz6JMvSAFTppumUGcjjvnzGGCeLl4OLy4gXea4PbN0b3
         Hsadz52EKNddJ0mk7pZAjxHCYC1mKckftMfzk+L8tkOy2ECagYuB8qkbQnrJHlcjeipF
         XGct8qh/x3ZgDJVO5mEYikc0fPOzmk6IBiPQeUtX+7qxE/iw5Shhawmu+bbUZKHzSsnD
         VHPg==
In-Reply-To: <1360088646-19104-5-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement internal governors do not have governor
> structures assocaited with them.  Only track the name of the governor
> associated with the CPU if the driver does not implement
> cpufreq_driver.setpolicy()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index d8daa4b..622e282 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1050,7 +1050,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
>                 __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>
>  #ifdef CONFIG_HOTPLUG_CPU
> -       strncpy(per_cpu(cpufreq_cpu_governor, cpu), data->governor->name,
> +       if (!cpufreq_driver->setpolicy)
> +               strncpy(per_cpu(cpufreq_cpu_governor, cpu),
> +                       data->governor->name,
>                         CPUFREQ_NAME_LEN);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
