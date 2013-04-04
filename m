From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 5/9] cpufreq: integrator: move cpufreq driver to drivers/cpufreq
Date: Thu, 4 Apr 2013 14:02:05 +0530
Message-ID: <CAKohpo=yppB4o+_31dEfoo3Sd=7KnqK1ZfDoMBDTT1ONxkFyOA@mail.gmail.com>
References: <cover.1364205812.git.viresh.kumar@linaro.org>
	<fae1030e861c5dfd00df8f03526b0bdc5156de4d.1364205812.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <fae1030e861c5dfd00df8f03526b0bdc5156de4d.1364205812.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arvind.chauhan@arm.com, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, arnd.bergmann@linaro.org, linux@arm.linux.org.uk, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Linus,

On 25 March 2013 15:41, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> This patch moves cpufreq driver of ARM based integrator platform to
> drivers/cpufreq.
>
> Cc: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/Kconfig                                              | 11 -----------
>  arch/arm/mach-integrator/Makefile                             |  1 -
>  drivers/cpufreq/Kconfig.arm                                   |  8 ++++++++
>  drivers/cpufreq/Makefile                                      |  1 +
>  .../cpu.c => drivers/cpufreq/integrator-cpufreq.c             |  2 --
>  5 files changed, 9 insertions(+), 14 deletions(-)
>  rename arch/arm/mach-integrator/cpu.c => drivers/cpufreq/integrator-cpufreq.c (99%)

I didn't knew that you are maintaining integrator now a days.
Can i have your comments/Ack for this patch?
