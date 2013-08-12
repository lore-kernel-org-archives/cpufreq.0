From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: NULL is a valid regulator
Date: Mon, 12 Aug 2013 10:49:46 +0530
Message-ID: <CAKohpoktDH_t0_eYigHMn8ZYm4ZT61yRymC00i1YGhWChE3ArQ@mail.gmail.com>
References: <1376071592-18930-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1376071592-18930-1-git-send-email-broonie@kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 9 August 2013 23:36, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> Since NULL could in theory be a valid regulator we ought to check for
> IS_ERR() rather than for NULL. In practice this is unlikely to be an
> issue but it's better for neatness.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  drivers/cpufreq/cpufreq-cpu0.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Makes sense.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
