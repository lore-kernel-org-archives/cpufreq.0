From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: intel_pstate: Remove sample parameter in intel_pstate_calc_busy
Date: Wed, 30 Apr 2014 09:36:55 +0530
Message-ID: <CAKohpo=YHon_WgaM6dm8jU1dw8uasRLekt-YKD63RMrMu9f0Uw@mail.gmail.com>
References: <535FE72D.2020402@semaphore.gr>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <535FE72D.2020402@semaphore.gr>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Dirk Brandewie <dirk.j.brandewie@intel.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 29 April 2014 23:23, Stratos Karafotis <stratosk@semaphore.gr> wrote:
> Since commit d37e2b7644 ("intel_pstate: remove unneeded sample buffers")
> we use only one sample. So, there is no need to pass the sample
> pointer to intel_pstate_calc_busy. Instead, get the pointer from
> cpudata. Also, remove the unused SAMPLE_COUNT macro.
>
> While at it, reformat the first line in this function.
>
> Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
> ---
>  drivers/cpufreq/intel_pstate.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
