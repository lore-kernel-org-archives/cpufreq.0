From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: Use devm_regulator_get_optional()
Date: Mon, 12 Aug 2013 10:52:00 +0530
Message-ID: <CAKohpomtoEFD0V-GHUxC+LrbVicpjF2Sep-97ED=gXiiHWMoXQ@mail.gmail.com>
References: <1376071683-19013-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1376071683-19013-1-git-send-email-broonie@kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 9 August 2013 23:38, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> Since the cpufreq-cpu0 driver is capable of coping without a software
> controllable regulator and would be confused by a dummy one it should
> use devm_regulator_get_optional() to ensure no dummy is provided.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>
> devm_regulator_get_optional() is a new API in my tree for -next, is it
> OK to merge this patch via that branch?

I don't see a issue with it, by Rafael has the authority :)

Over that it would have been useful if we could have this patch as part
of the series you posted for defining devm_regulator_get_optional(),
and so we could have seen what's that patch is doing..
