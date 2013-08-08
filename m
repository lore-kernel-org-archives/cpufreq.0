From: Richard Zhao <linuxzsc@gmail.com>
Subject: Re: [PATCH 0/6] Tegra: Use cpufreq-cpu0 driver
Date: Thu, 8 Aug 2013 16:31:22 +0800
Message-ID: <CANg6MZgqxF1GBOhtebZLuHBh_F6CxWT=YRsQunPR+wdCQRunPw@mail.gmail.com>
References: <cover.1375886595.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=DhpgyZzg8+5XpolB2q9TWswGgRsuwBaZZO+98cMVBTo=;
        b=jaOnyEp+JJ+oJZ8tKQWKfW6HnWb9oasRsqDdxC4+mzWVySJJ4rtV/uTM5yI11756gl
         TQV5TTlSNoT+v+B9opmeX+VHBmF28QLMJdpQswJ+ZdGqrUmAhNTmcz1aAuuNEqYAjlkP
         bKPHQG/NBd8h7B4PlSOkMW4u27hYs7gElz9gyynupeNE/bKc8FOG3KCVzv2WvCkQm+Ai
         NA8yVk8XrWvYTNlEwPa7OgbMkW9q2XSMK0WIpOXZXG89lN27M6KXEDP59AJzBSOF0Uwf
         4Lvur1VI7dZr0MDVelCbb9TQRip/JKviQRL0zFbjC0DwU0qniVw7DkZc4jzIbV8cAYKU
         D+Qw==
In-Reply-To: <cover.1375886595.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, Stephen Warren <swarren@nvidia.com>, linaro-kernel@lists.linaro.org, Mike Turquette <mturquette@linaro.org>, linux-pm@vger.kernel.org, patches@linaro.org, linux-kernel <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, Aug 7, 2013 at 10:46 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Hi Stephen,
>
> This is the first attempt to get rid of tegra-cpufreq driver. This patchset
> tries to add supporting infrastructure for tegra to use cpufreq-cpu0 driver.

If tegra has only 4-core fast cpu, I would agree with the patch set. But now
I'm not so sure. Tegra cpuquiet driver and cluster switch may need special
settings of cpufreq driver.

Thanks
Richard
