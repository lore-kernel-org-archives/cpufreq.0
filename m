From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: exynos: restore mach/regs-clock.h for exynos5
Date: Fri, 19 Apr 2013 14:17:53 -0700
Message-ID: <CAOesGMg=ywanoJTeTZwcS-AxUYq00hD9NZCKeN=3_iksSm8QVA@mail.gmail.com>
References: <201304191554.29679.arnd@arndb.de>
	<201304192059.38606.arnd@arndb.de>
	<5171AB10.5070702@gmail.com>
	<201304192310.26041.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <201304192310.26041.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, cpufreq@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Fri, Apr 19, 2013 at 2:10 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> Commit 6e6aac75 "ARM: EXYNOS: Migrate clock support to common
> clock framework" from Thomas Abraham removed the Exynos5 specific
> register definitions as they were unused at the time, but the
> cpufreq driver actually still uses them.
>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 8<----
>
> I'd apply this one on next/drivers to fix the build error, unless
> someone has concerns.

Acked-by: Olof Johansson <olof@lixom.net>
