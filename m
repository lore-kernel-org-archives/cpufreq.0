From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: arm-big-little: use clk_get instead of clk_get_sys
Date: Thu, 3 Oct 2013 14:30:03 +0530
Message-ID: <CAKohpo=90LQawdZGmm2-CU3U-kHL6uUkmFKGRGZFCwY5YckLEg@mail.gmail.com>
References: <1380619803-2760-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
	<CAKohpom0iYB=HF+YaG9VzHu7LxVQsJww3oEVABRmeHTmwSnxTA@mail.gmail.com>
	<524D3170.7080406@arm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <524D3170.7080406@arm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On 3 October 2013 14:27, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> Agreed, but there's no cluster node in DT. So platforms using DT would have
> these clocks in cpu@n node as it's used for CPU frequency scaling. One example I
> can see is highbank(it uses cpufreq-cpu0 meaning its single cluster clock). So
> AFAICT if any big-little systems wants to pass cluster clocks through DT, it has
> to be cpu@n nodes. Let me know if you have any alternate thoughts ?

I understand your point, but shouldn't we name it then: cpu clock? Probably
cluster clock was wrong from the beginning.. As there is no cluster clock,
or there is ? :)
