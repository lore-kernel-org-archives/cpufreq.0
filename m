From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos: simplify .init() for setting policy->cpus
Date: Thu, 31 Jan 2013 10:23:37 +0530
Message-ID: <CAKohpo=eEnK8oJ1KEff=sBvyjZzdqmFKUgXe2+bhWAvyVVmzqg@mail.gmail.com>
References: <f216e85846c302756d55cb6753863a66697f79a6.1359599087.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <f216e85846c302756d55cb6753863a66697f79a6.1359599087.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Viresh Kumar <viresh.kumar@linaro.org>

On 31 January 2013 10:22, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> With the recent changes in cpufreq core, we just need to set mask of all
> possible cpus into policy->cpus. Rest would be done by core.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Oops! Sent the wrong patch again. Ignore this mail :)
