From: Jonas Aaberg <jonas.aberg@stericsson.com>
Subject: Re: [PATCH 0/4] cpufreq: db8500: Use platform data to provide cpufreq
 table
Date: Tue, 2 Oct 2012 13:21:05 +0200
Message-ID: <506ACE21.6040203@stericsson.com>
References: <1348841814-13645-1-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1348841814-13645-1-git-send-email-ulf.hansson@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulf HANSSON <ulf.hansson@stericsson.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rickard ANDERSSON <rickard.andersson@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Philippe BEGNIC <philippe.begnic@st.com>, Ulf Hansson <ulf.hansson@linaro.org>


All patches look good.

Acked-by: Jonas Aaberg <jonas.aberg@stericsson.com>

On 09/28/2012 04:16 PM, Ulf HANSSON wrote:
> From: Ulf Hansson <ulf.hansson@linaro.org>
> 
> Since the cpufreq table is dependant on the prmcu fw, it make sense to
> keep the table there. Moreover since the cpufreq is already a mfd child
> device added by the prcmu this make even more logic.
> 
> The next step after these patches will be to implement an "arm_clk" to be
> used from cpufreq to update the opp instead of using the prcmu opp API directly.
> This will then remove the last hard dependency to the prcmu API from cpufreq.
> 
> Ulf Hansson (4):
>   ARM: ux500: Remove cpufreq platform device
>   mfd: db8500: Provide cpufreq table as platform data
>   cpufreq: db8500: Register as a platform driver
>   cpufreq: db8500: Fetch cpufreq table from platform data
> 
>  arch/arm/mach-ux500/cpu-db8500.c |    6 ---
>  drivers/cpufreq/db8500-cpufreq.c |   87 +++++++++++++++++++-------------------
>  drivers/mfd/db8500-prcmu.c       |   22 ++++++++++
>  3 files changed, 66 insertions(+), 49 deletions(-)
> 

