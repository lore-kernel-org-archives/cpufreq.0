From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: Fix unsigned variable being checked for negative value
Date: Mon, 18 Mar 2013 13:59:12 +0530
Message-ID: <CAKohponm1s9GkBML3+O1tjoiB=ZUUvj_X1yi5j3X0qk8_p8vxA@mail.gmail.com>
References: <000001ce23af$f51b0240$df5106c0$%choi@samsung.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <000001ce23af$f51b0240$df5106c0$%choi@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonghwan Choi <jhbird.choi@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Shawn Guo <shawn.guo@linaro.org>

On 18 March 2013 13:39, Jonghwan Choi <jhbird.choi@samsung.com> wrote:
> clk_round_rate() returns singed value which was assigned to an unsigned
> variable.
> So it can't be checked for negative.
>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/cpufreq/cpufreq-cpu0.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
