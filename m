From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: powernv: make local function static
Date: Mon, 12 May 2014 09:54:08 +0530
Message-ID: <CAKohpo=N3Ze1rLo7H+yGJAKp32Vf3BOLan30uervHhMZ4X0sGQ@mail.gmail.com>
References: <1399794680-22210-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1399794680-22210-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

On 11 May 2014 13:21, Brian Norris <computersforpeace@gmail.com> wrote:
> powernv_cpufreq_get() is only referenced in this file.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: cpufreq@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index af4968813e76..bb1d08dc8cc8 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -235,7 +235,7 @@ static void powernv_read_cpu_freq(void *arg)
>   * firmware for CPU 'cpu'. This value is reported through the sysfs
>   * file cpuinfo_cur_freq.
>   */
> -unsigned int powernv_cpufreq_get(unsigned int cpu)
> +static unsigned int powernv_cpufreq_get(unsigned int cpu)

Please make this as static as well: cpufreq_freq_attr_cpuinfo_nominal_freq

and add my

Acked-by: Viresh Kumar <viresh.kumar@linaro.org> on V2.
