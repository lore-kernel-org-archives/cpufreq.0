From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: Re: [PATCH 2/2] cpufreq: Debugging options for the cpufreq subsystem
Date: Wed, 17 Oct 2012 10:20:58 +0100
Message-ID: <507E787A.3020206@arm.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org> <bf2567a3c3b6f35c606ea8d71722048eefb0c45a.1350451100.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bf2567a3c3b6f35c606ea8d71722048eefb0c45a.1350451100.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, PDSW-power-team <PDSW-power-team@arm.com>, Sudeep.KarkadaNagesha@arm.com

On 17/10/12 06:20, Viresh Kumar wrote:
> This adds Kconfig options for DEBUG and VERBOSE_DEBUG to the cpufreq subsystem,
> This is pretty useful for developers who want to debug cpufreq subsystem and
> don't want to editing the Makefile manually each time they want to debug.
>
You can easily overcome this issue using dynamic debugging.
You need not recompile the code enabling debug if CONFIG_DYNAMIC_DEBUG 
is enabled.

Regards,
Sudeep

