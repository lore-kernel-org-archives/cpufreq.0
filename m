From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] cpufreq: SPEAr: Instantiate as platform_driver
Date: Tue, 11 Mar 2014 13:44:19 +0100
Message-ID: <4163075.Inno6QAHAN@vostro.rjw.lan>
References: <92837e0c0ed734bb82d3c7d78f58beb31b4e0c1f.1394446335.git.viresh.kumar@linaro.org> <3114708.oz7nbHtIzQ@vostro.rjw.lan> <CAKohpokSTM9tUYEK2ggSOwrgK=RfLmmKRdtzaRQ1q=d2jrUzWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohpokSTM9tUYEK2ggSOwrgK=RfLmmKRdtzaRQ1q=d2jrUzWQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Cartwright <joshc@codeaurora.org>, Rob Herring <robherring2@gmail.com>

On Tuesday, March 11, 2014 11:46:22 AM Viresh Kumar wrote:
> On 11 March 2014 09:04, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > On Monday, March 10, 2014 03:43:18 PM Viresh Kumar wrote:
> >> As multiplatform build is being adopted by more and more ARM platforms, initcall
> >> function should be used very carefully. For example, when SPEAr cpufreq driver
> >> is enabled on a kernel booted on a non-SPEAr board, we will get following boot
> >> time error:
> >>
> >>       spear_cpufreq: Invalid cpufreq_tbl
> >>
> >> To eliminate this undesired the effect, the patch changes SPEAr driver to have
> >> it instantiated as a platform_driver. Then it will only run on platforms that
> >> create the platform_device "spear-cpufreq".
> >>
> >> This patch also creates platform node for SPEAr13xx boards.
> >>
> >> Reported-by: Josh Cartwright <joshc@codeaurora.org>
> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Whoever maintains the SPEAr platform, I need an ACK from that person in order
> > to take this patch.
> 
> Okay, here you go:
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> :)

I see.  OK

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
