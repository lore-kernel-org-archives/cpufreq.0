From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 10:25:16 +0100
Message-ID: <507E797C.1010204@arm.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, PDSW-power-team <PDSW-power-team@arm.com>, Sudeep.KarkadaNagesha@arm.com

On 17/10/12 06:20, Viresh Kumar wrote:
> With debug options on, it is difficult to locate cpufreq core's debug prints.
> Fix this by prefixing debug prints with:
>
> "cpufreq:"

With CONFIG_DYNAMIC_DEBUG, you can control(enable/disable) debug
prints at different levels (file, module, line, function)

Regards,
Sudeep


