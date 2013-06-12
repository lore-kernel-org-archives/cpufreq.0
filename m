From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: stats: Remove CONFIG_CPU_FREQ_STAT_DETAILS
Date: Wed, 12 Jun 2013 09:29:39 +0530
Message-ID: <CAKohpok0JrLv_i6=Gm5oM8PDP_i5pVyD-EphVPd0hT1THwfgbg@mail.gmail.com>
References: <1683304a60f5188dc7f94e1a7797f12a4d1b47ab.1370581794.git.viresh.kumar@linaro.org>
	<65302617.R4ibdJPShF@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <65302617.R4ibdJPShF@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, arvind.chauhan@arm.com, cw00.choi@samsung.com

On 12 June 2013 03:52, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Friday, June 07, 2013 10:42:57 AM Viresh Kumar wrote:
>> Current cpufreq stats has got three parts: time_in_state, total_trans and
>> trans_table.
>>
>> trans_table was present under a separate macro's from others:
>> CONFIG_CPU_FREQ_STAT_DETAILS
>
> And the reason why is exactly what is given in the documentation - it violates
> the sysfs interface rules.  So the option is "Do you want to have a sysfs file
> violating the rules and containing some more fine grained cpufreq stats?"
>
> I don't think we can just pretend that it doesn't violate the rules from now
> on, so I'm not going to apply this.

Ok.. thanks.
