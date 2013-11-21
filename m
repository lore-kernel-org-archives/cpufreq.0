From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH V2] Cpufreq: Make governor data on nonboot cpus across system suspend/resume
Date: Thu, 21 Nov 2013 22:43:45 +0100
Message-ID: <1599716.5y7kNnD1dc@vostro.rjw.lan>
References: <9847309.KdKOG5y1Zx@vostro.rjw.lan> <2383693.rhJDd9X40m@vostro.rjw.lan> <CAKohponphVhZ3T1HD2AfhPBUn9SfQyrqdbvW3bEJFzRdKF2i0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohponphVhZ3T1HD2AfhPBUn9SfQyrqdbvW3bEJFzRdKF2i0Q@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Lan Tianyu <tianyu.lan@intel.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thursday, November 21, 2013 09:24:02 PM Viresh Kumar wrote:
> On 21 November 2013 20:13, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> >> -     if (((event == CPUFREQ_GOV_POLICY_INIT) && ret) ||
> >
> > The inner parens are not necessary.
> >
> >> -                     ((event == CPUFREQ_GOV_POLICY_EXIT) && !ret))
> >> +     if ((event == CPUFREQ_GOV_POLICY_INIT) && ret) {
> >
> > Same here.
> >
> >> +             module_put(policy->governor->owner);
> >> +             if (ret == -EALREADY)
> >> +                     return 0;
> >> +     } else if ((event == CPUFREQ_GOV_POLICY_EXIT) && !ret) {
> >
> > Same here.
> 
> Logically, yes you are correct. But probably its better for readability to
> get these even if you know precedence is going to take care of our
> expression..

Are you serious?

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
