From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v2 0/2] cpufreq: exynos: Fixes for v3.12
Date: Fri, 11 Oct 2013 11:36:40 +0530
Message-ID: <CAKew6eVxk7nGKkiPz2HsfF-+V1fOVvZmd-zrU3qY_VZWD-grLQ@mail.gmail.com>
References: <1380108138-30402-1-git-send-email-l.majewski@samsung.com>
	<1381320523-28183-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=+nodzl65z860F2tRgUtPLdu38Xq8lQ1Ze5NYpUFAdu4=;
        b=FhQJ90/wOdRcJqa4a+3cYgcCXXx1k24RlPVezoajNYXmLwrfXNsgTuW95T2oNDyPIX
         tt0e2Ic7JaUkTkfNJDkzo53gbaGNBzwfsNNqm/3huJmWY3/ZL+wq6qsQ5j/0i739f/0p
         uO9GBd7U5Ua5NWahHCWXf6u0h7BgPVU1kUSkMh1O/1LGkKmMN3TLzAG8QLyCPnrb4bv9
         ply0jzVhEqPS5KxFxc4Ih6Zl/tAxr5L/P3EOuuycqzyljbbfslBTWfnJmEQg/LZHk8KD
         t0J8XHGxm5c+6S3p+kG2zkc+44nL4KGB5QaQ+zcHWqHVTi0i5GLtZVsaRdD95AwbqF1a
         zs3Q==
In-Reply-To: <1381320523-28183-1-git-send-email-l.majewski@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, linux-kernel <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On Wed, Oct 9, 2013 at 5:38 PM, Lukasz Majewski <l.majewski@samsung.com> wrote:
> Attached commits provide cpufreq regression fixes for Trats and Trats2
> Exynos4 boards.
> Since v3.12 Exynos4 uses common clock framework for clock manipulation.
> Those patches restore correct output for cpuinfo_cur_freq [1] sysfs
> attribute.
> Without them, the [1] provides default frequency (800 MHz) set at driver
> initialization.
>
>
> Lukasz Majewski (2):
>   cpufreq: exynos4x12: Use the common clock framework to set APLL clock
>     rate
>   cpufreq: exynos4210: Use the common clock framework to set APLL clock
>     rate
>

Just as a fix for 3.12, these patches looks OK to me.

Reviewed-by: Yadwinder Singh Brar <yadi.brar@samsung.com>


Regards,
Yadwinder

>  drivers/cpufreq/exynos4210-cpufreq.c |   67 ++++-----------------------------
>  drivers/cpufreq/exynos4x12-cpufreq.c |   69 ++++------------------------------
>  2 files changed, 16 insertions(+), 120 deletions(-)
>
> --
> 1.7.10.4
>
