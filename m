From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] MIPS/loongson2_cpufreq: fix CPU clock rate setting
Date: Thu, 3 Apr 2014 09:51:41 +0530
Message-ID: <CAKohpokxg=UsiXyq1kJAqgVyj6qYoiQfryfpXGebPtB4f253FQ@mail.gmail.com>
References: <1396465624-21661-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1396465624-21661-1-git-send-email-aaro.koskinen@iki.fi>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: <cpufreq.vger.kernel.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-mips@linux-mips.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, stable@vger.kernel.org

On 3 April 2014 00:37, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> Loongson2 has been using (incorrectly) kHz for cpu_clk rate. This has
> been unnoticed, as loongson2_cpufreq was the only place where the rate
> was set/get. After commit 652ed95d5fa6074b3c4ea245deb0691f1acb6656
> (cpufreq: introduce cpufreq_generic_get() routine) things however broke,
> and now loops_per_jiffy adjustments are incorrect (1000 times too long).
> The patch fixes this by changing cpu_clk rate to Hz.
>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/loongson/lemote-2f/clock.c | 7 +++++--
>  drivers/cpufreq/loongson2_cpufreq.c  | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/loongson/lemote-2f/clock.c b/arch/mips/loongson/lemote-2f/clock.c
> index aed32b8..699f388 100644
> --- a/arch/mips/loongson/lemote-2f/clock.c
> +++ b/arch/mips/loongson/lemote-2f/clock.c
> @@ -91,6 +91,7 @@ EXPORT_SYMBOL(clk_put);
>
>  int clk_set_rate(struct clk *clk, unsigned long rate)
>  {
> +       unsigned int rate_khz;

Initialize rate_khz here only instead of doing it separately..

>         int ret = 0;
>         int regval;
>         int i;
> @@ -106,15 +107,17 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
>         if (unlikely(clk->flags & CLK_RATE_PROPAGATES))
>                 propagate_rate(clk);
>
> +       rate_khz = rate / 1000;
> +

From here:

>         for (i = 0; loongson2_clockmod_table[i].frequency != CPUFREQ_TABLE_END;
>              i++) {
>                 if (loongson2_clockmod_table[i].frequency ==
>                     CPUFREQ_ENTRY_INVALID)
>                         continue;
> -               if (rate == loongson2_clockmod_table[i].frequency)
> +               if (rate_khz == loongson2_clockmod_table[i].frequency)
>                         break;
>         }
> -       if (rate != loongson2_clockmod_table[i].frequency)
> +       if (rate_khz != loongson2_clockmod_table[i].frequency)
>                 return -ENOTSUPP;

To here:

All this code is junk and not required anymore as rate is guaranteed
to be in loongson2_clockmod_table[].. Probably you need value of
'i' here and you can pass that directly from loongson2_cpufreq_target().

