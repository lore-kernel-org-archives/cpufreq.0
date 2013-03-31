From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/9] cris: cpufreq: move cpufreq driver to drivers/cpufreq
Date: Sun, 31 Mar 2013 09:30:04 +0530
Message-ID: <CAKohpo=R4r5BGcXUosVj-LGD6iQ_fqXoqLPWO1FdfB9Rnh7j=w@mail.gmail.com>
References: <cover.1364229828.git.viresh.kumar@linaro.org>
	<ba21f31410c122d160698a6d18266e3f695f6011.1364229828.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <ba21f31410c122d160698a6d18266e3f695f6011.1364229828.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Nilsson <jesper.nilsson@axis.com>, Mikael Starvik <starvik@axis.com>, linux-cris-kernel@axis.com
Cc: arvind.chauhan@arm.com, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, arnd.bergmann@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On 25 March 2013 22:24, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> This patch moves cpufreq drivers of CRIS architecture to drivers/cpufreq.
>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Mikael Starvik <starvik@axis.com>
> Cc: linux-cris-kernel@axis.com
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/cris/arch-v32/mach-a3/Makefile                                     | 1 -
>  arch/cris/arch-v32/mach-fs/Makefile                                     | 1 -
>  drivers/cpufreq/Makefile                                                | 2 ++
>  .../mach-a3/cpufreq.c => drivers/cpufreq/cris-artpec3-cpufreq.c         | 0
>  .../mach-fs/cpufreq.c => drivers/cpufreq/cris-etraxfs-cpufreq.c         | 0
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/cris/arch-v32/mach-a3/cpufreq.c => drivers/cpufreq/cris-artpec3-cpufreq.c (100%)
>  rename arch/cris/arch-v32/mach-fs/cpufreq.c => drivers/cpufreq/cris-etraxfs-cpufreq.c (100%)

Jesper/Mikael,

Can i have your views or Ack for this?
