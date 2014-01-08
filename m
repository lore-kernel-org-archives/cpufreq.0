From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH V3 Resend] cpufreq: create cpufreq_generic_get() routine
Date: Wed, 08 Jan 2014 01:13:33 +0100
Message-ID: <2696764.XiYMgf5S93@vostro.rjw.lan>
References: <d9239e0a5df99392647ff8343673342f89d09476.1389059568.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <d9239e0a5df99392647ff8343673342f89d09476.1389059568.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday, January 07, 2014 07:24:32 AM Viresh Kumar wrote:
> CPUFreq drivers that use clock frameworks interface,i.e. clk_get_rate(), to get
> CPUs clk rate, has similar sort of code used for most of them.
> 
> This patch adds a generic ->get() which will do the same thing for them. All
> those drivers are required to now is to set .get to cpufreq_generic_get() and
> set their clk pointer in policy->clk during ->init().
> 
> Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> Acked-by: Stephen Warren <swarren@nvidia.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Rafael,
> 
> V2->V3: As asked by you earlier, I have merged all 23 patches here as they had
> common log and were touching separate drivers. This is already acked by many
> people.  Please see if looks okay for 3.14.

Applied to bleeding-edge, thanks!

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
