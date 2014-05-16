From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] cpufreq: cpu0: drop wrong devm usage
Date: Sat, 17 May 2014 01:03:44 +0200
Message-ID: <1736692.jETsUORUsl@vostro.rjw.lan>
References: <1400235642-4124-1-git-send-email-l.stach@pengutronix.de> <CAKohpo=nKkCnY2Kd0QGEWjgaiaSd=dxamwDnm-VFd27HC5i8MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=nKkCnY2Kd0QGEWjgaiaSd=dxamwDnm-VFd27HC5i8MQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Friday, May 16, 2014 04:54:27 PM Viresh Kumar wrote:
> On 16 May 2014 15:50, Lucas Stach <l.stach@pengutronix.de> wrote:
> > This driver is using devres managed calls incorrectly, giving the cpu0
> > device as first parameter instead of the cpufreq platform device.
> > This results in resources not being freed if the cpufreq platform device
> > is unbound, for example if probing has to be deferred for a missing
> > regulator.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/cpufreq/cpufreq-cpu0.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Is this -stable material?  If so, which -stable?

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
