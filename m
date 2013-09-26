From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/1] cpufreq: SPEAr: Fix incorrect variable type
Date: Thu, 26 Sep 2013 11:08:51 +0530
Message-ID: <CAKohponXRVe3+RAgSSV0jrmck-_aGtv11LoSLiZ8dTL3mooXAA@mail.gmail.com>
References: <1380173202-12624-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1380173202-12624-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On 26 September 2013 10:56, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> 'clk_round_rate' returns a negative error code upon failure. This
> will never get detected by unsigned 'newfreq'. Make it signed.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/cpufreq/spear-cpufreq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
