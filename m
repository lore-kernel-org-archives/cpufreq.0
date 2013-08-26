From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: imx6q: Fix clock enable balance
Date: Mon, 26 Aug 2013 19:35:24 +0530
Message-ID: <CAKohponSYhBBBjxUme2bmVNW3HZfWuU=_OeL5HuA6nnVCit3tA@mail.gmail.com>
References: <1377517716-27470-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1377517716-27470-1-git-send-email-s.hauer@pengutronix.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>

On 26 August 2013 17:18, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> For changing the cpu frequency the i.MX6q has to be switched to some
> intermediate clock during the PLL reprogramming. The driver tries
> to be clever to keep the enable count correct but gets it wrong. If
> the cpufreq is increased it calls clk_disable_unprepare twice
> on pll2_pfd2_396m. This puts all other devices which get their clock
> from pll2_pfd2_396m into a nonworking state.
>
> Fix this by removing the clk enabling/disabling altogether since the
> clk core will do this automatically during a reparent.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 17 -----------------
>  1 file changed, 17 deletions(-)

Applied.
