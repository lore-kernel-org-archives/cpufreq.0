From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: cpu0: drop wrong devm usage
Date: Fri, 16 May 2014 16:54:27 +0530
Message-ID: <CAKohpo=nKkCnY2Kd0QGEWjgaiaSd=dxamwDnm-VFd27HC5i8MQ@mail.gmail.com>
References: <1400235642-4124-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1400235642-4124-1-git-send-email-l.stach@pengutronix.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <l.stach@pengutronix.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sascha Hauer <kernel@pengutronix.de>

On 16 May 2014 15:50, Lucas Stach <l.stach@pengutronix.de> wrote:
> This driver is using devres managed calls incorrectly, giving the cpu0
> device as first parameter instead of the cpufreq platform device.
> This results in resources not being freed if the cpufreq platform device
> is unbound, for example if probing has to be deferred for a missing
> regulator.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/cpufreq/cpufreq-cpu0.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
