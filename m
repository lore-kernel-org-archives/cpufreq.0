From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: fix jiffies/cputime mixup in conservative/ondemand
 governors
Date: Sat, 24 Nov 2012 09:58:43 +0530
Message-ID: <CAKohponML1j04v3H4WXQ-gH3jT4JDcR4WdeVNcBOci_FnVQW6g@mail.gmail.com>
References: <m21ugq1vfi.fsf@igel.home>
	<m2625x5shx.fsf@igel.home>
	<6739224.35DjQmzyyR@vostro.rjw.lan>
	<4686564.n70P6BrGFi@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <4686564.n70P6BrGFi@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andreas Schwab <schwab@linux-m68k.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Fabio Baltieri <fabio.baltieri@linaro.org>

On 24 November 2012 03:18, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Subject: cpufreq: governors: Fix jiffies/cputime mixup (revisited)
>
> This change was made by commit 8636fd2 (cpufreq: fix jiffies/cputime
> mixup in conservative/ondemand governors) before, but then it has
> been reverted inadvertently by commit 4471a34 (cpufreq: governors:
> remove redundant code).
>
> The changelog of commit 8636fd2 says:
>
>   The function get_cpu_idle_time_jiffy in both the conservative and
>   ondemand governors use jiffies_to_usecs to convert a cputime value
>   to usecs which gives the wrong value on architectures where cputime
>   and jiffies use different units.  Only matters if NO_HZ is
>   disabled, since otherwise get_cpu_idle_time_us should already
>   return a valid value, and get_cpu_idle_time_jiffy isn't actually
>   called.
>
> Since now we have only one common get_cpu_idle_time_jiffy() used by
> both governors in question, modify it along the lines of commit
> 8636fd2 to restore the correct behavior.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
