From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq turbo regression
Date: Thu, 30 May 2013 21:11:12 +0530
Message-ID: <CAKohponjio66Okm+jWk_w0jN8RJdQyUEk3Y9sbZ7MWzOpamBmQ@mail.gmail.com>
References: <20130530135246.GA2177@hobo.wolfson.cam.ac.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130530135246.GA2177@hobo.wolfson.cam.ac.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.j.brandewie@intel.com>
Cc: Ross Lagerwall <rosslagerwall@gmail.com>, cpufreq@vger.kernel.org

On 30 May 2013 19:22, Ross Lagerwall <rosslagerwall@gmail.com> wrote:
> I have an Intel 3570K and would like to run it in performance mode from
> startup so I set the default governor to performance.
>
> I noticed that when I do this, turbo mode does not seem to be activated
> on the processor (turbostat shows frequencies of about 3.4GHz rather
> than 3.7GHz).  If I then while it is running switch to ondemand and then back
> to performance, turbo is activated properly and the cpu frequency hits 3.7GHz.
>
> I did a git bisect and traced it to the following commit:
> 5a1c022850ea5d64c2997bf9b89f5ae112d5ee4d is the first bad commit
> commit 5a1c022850ea5d64c2997bf9b89f5ae112d5ee4d
> Author: Viresh Kumar <viresh.kumar@linaro.org>
> Date:   Wed Oct 31 01:28:15 2012 +0100
>
>     cpufreq: Avoid calling cpufreq driver's target() routine if target_freq == policy->cur
>
>     Avoid calling cpufreq driver's target() routine if new frequency is same as
>     policies current frequency.
>
>     Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>     Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> :040000 040000 4e0d340c501120d61e5bb9553420c142037a0beb f4ed149e8563bebd6e2d1e4c56523ff9aed4314b M  drivers
>
> Reverting this commit from v3.10-rc3 fixed the problem.
>
> This is using the acpi-cpufreq driver -- there doesn't seem to be any way to
> set the Intel P-state driver to performance by default.

This patch was pretty much sensible and all drivers now depend on it
now.

@Dirk: Can you please help us in understanding why this might be
happening. I believe it has to do with some bad design of acpi-cpufreq
driver (I tried to look into target routine but couldn't understand why
this might be happening).

--
viresh
