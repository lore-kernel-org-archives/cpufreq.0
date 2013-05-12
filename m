From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq, ondemand: Remove leftover debug line
Date: Sun, 12 May 2013 20:46:34 +0530
Message-ID: <CAOh2x=kLJ3NVN177KTWjZikkZb8Q8RQjye4qrUT=PCdCj2jSgg@mail.gmail.com>
References: <1368041688-29986-1-git-send-email-bp@alien8.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=2YTzX9aeN9yhp4TW7ebvHqZjfkkBH0aA8lm7N3BQP9k=;
        b=bvl9OGEFy+b957VjIm055UPYilD4tKRBE7CXQT4+uwA5YaCfgmITocVfdDThViZmtf
         LHu6xMpsHaz6ifCasc93cTwvSYdeo82nhfmK8v1tVELH9clqVNy9s4Wgg0q5ojeo1NkH
         yOu9JiiqfqsA90BzgOZT/dx8HLqsAvavyIirXyON5NsyUDlbkJIEf49ItjfdGIdkhvWf
         7+1I6T6EH3Fq3SaZKqNPD6ox34aYB193cXtNf/wmRa0CEFYF5Jex+Vk/hcXX0L0dtI3m
         4ivOvH4omtp9e1Vbd1gEu197jzpO+JQ/P27bwfJ+gWCXUdjenE5YeGC/pnWNpAJf0+mn
         nwIg==
In-Reply-To: <1368041688-29986-1-git-send-email-bp@alien8.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

On Thu, May 9, 2013 at 1:04 AM, Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> I don't see how the virtual address of the tuners pointer would be of
> any help to anyone so remove it.
>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  drivers/cpufreq/cpufreq_ondemand.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index b0ffef96bf77..4b9bb5def6f1 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -547,7 +547,6 @@ static int od_init(struct dbs_data *dbs_data)
>         tuners->io_is_busy = should_io_be_busy();
>
>         dbs_data->tuners = tuners;
> -       pr_info("%s: tuners %p\n", __func__, tuners);
>         mutex_init(&dbs_data->mutex);
>         return 0;
>  }

Sorry for this message :(

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
