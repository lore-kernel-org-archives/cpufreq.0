From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] cpufreq: exynos: allow disabling cpufreq drivers
Date: Fri, 19 Apr 2013 16:33:17 +0200
Message-ID: <201304191633.17613.arnd@arndb.de>
References: <201304191554.29679.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201304191554.29679.arnd@arndb.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: cpufreq@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>

On Friday 19 April 2013, Arnd Bergmann wrote:
> Commit 6e6aac7590 "ARM: EXYNOS: Migrate clock support to common
> clock framework" broke support for the exynos cpufreq drivers.
> While we're waiting for a fix for this, let's get back to a state
> where the kernel builds again with the cpufreq subsystem enabled
> but ARM_EXYNOS_CPUFREQ disabled. I assume that this was the intention
> behind this Kconfig symbol anyway.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: cpufreq@vger.kernel.org
> Cc: Rafael J. Wysocki <rjw@sisk.pl>

Hmm, actually this conflicts heavily with the other Kconfig changes
in the cpufreq tree. Any other idea how to resolve this?

	Arnd

> ---
> Rafael, I'm putting this patch into the arm-soc tree now to avoid
> a bug based on a patch that I got from Kukjin. If you have any
> objections, please let me know so I can revert it again.
> 
> Everyone else: Why does 6e6aac7590 have your "Tested-by" and
> "Signed-off-by" tags on it when it's obviously broken? Who is
> fixing this? Having no working exynos cpufreq support in 3.10
> would be a serious regression.
