From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 linux-next 1/2] cpufreq: Convert the
 cpufreq_driver_lock to a rwlock
Date: Wed, 6 Feb 2013 08:17:45 +0530
Message-ID: <CAKohpokQwpRqy2h5EwMjP3qxXgS9pqLL1=445J-pkMXgtA6vUA@mail.gmail.com>
References: <74F10842A85F514CA8D8C487E74474BB2D2F925E@P-EXMB1-DC21.corp.sgi.com>
	<1360116290-23849-1-git-send-email-nzimmer@sgi.com>
	<1360116290-23849-2-git-send-email-nzimmer@sgi.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1360116290-23849-2-git-send-email-nzimmer@sgi.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Zimmer <nzimmer@sgi.com>
Cc: rjw@sisk.pl, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org

On 6 February 2013 07:34, Nathan Zimmer <nzimmer@sgi.com> wrote:
> This eliminates the contention I am seeing in __cpufreq_cpu_get.
> It also nicely stages the lock to be replaced by the rcu.
>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
> Signed-off-by: Nathan Zimmer <nzimmer@sgi.com>
> ---
>  drivers/cpufreq/cpufreq.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
