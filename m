From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/5] cpufreq: Only call cpufreq_out_of_sync() with drivers
 that implement cpufreq_driver.target()
Date: Thu, 7 Feb 2013 16:03:16 +0530
Message-ID: <CAOh2x=mjWxSM+WzReHgbnjHmft7yiP6OOf5p-kwpqh2Ykp_O0A@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
	<1360170133-5066-4-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Z4jqRqwb1o/XCLMInSzsQERfamqA13OGBcwONWv+I58=;
        b=rY9FCHLlC46bP7pt4l4wMFXgabHVJRRKCmvTS2WjFECPbwW8GrIdy9I2mvkAjgvmqz
         Lu+iNy/gUWWIndVMwEB7XFrfmKcK1xCHIuqA2le6TBa5Av5lTaBs/DZ54qkLXearmr7k
         CqR5jOWhOfrZhhZCtJ7uxSk+wjz10M8tW8bvAYbVyQPM4MA1aIqUOf5W5/OkNE9JemPz
         BORUBvYuWysXFdFvyffBjGIrvTmOUaj/FkC3Dw+A/AwKx4igh0nJ6vZCZ451pZfv8mIs
         JvtREN24o4Ku7W4cKWtYTurtDY578pYo3TId/qyDVXLwFvO86Cnx/xjQtCUOWhxPp9Zg
         mZcA==
In-Reply-To: <1360170133-5066-4-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wed, Feb 6, 2013 at 10:32 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement cpufreq_driver.setpolicy() have
> internal governors that do not signal changes via
> cpufreq_notify_transition() so the frequncy in the policy will almost
> certainly be different than the current frequncy.  Only call
> cpufreq_out_of_sync() when the underlying driver implements
> cpufreq_driver.target()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index bb45f93..0ba0344 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1798,7 +1798,7 @@ int cpufreq_update_policy(unsigned int cpu)
>                         pr_debug("Driver did not initialize current freq");
>                         data->cur = policy.cur;
>                 } else {
> -                       if (data->cur != policy.cur)
> +                       if (data->cur != policy.cur && driver->target)
>                                 cpufreq_out_of_sync(cpu, data->cur,
>                                                                 policy.cur);

Looks much better now :)
