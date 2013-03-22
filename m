From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] cpufreq: stats: do cpufreq_cpu_put() corresponding to cpufreq_cpu_get
Date: Fri, 22 Mar 2013 17:29:13 +0530
Message-ID: <CAP245DXfFKpr2Aq5VWKJHdybU8np=_OpYX7pNEeii34bJQGpnA@mail.gmail.com>
References: <234906745c34fb72b0c450d897f261a22ed18d40.1363947023.git.viresh.kumar@linaro.org>
	<CAP245DWx_C0wcW-9SCfR0ViqyyqNbAeZnWfeMiXSgRGupo9jWQ@mail.gmail.com>
	<38998218.UX7TkEXzYs@vostro.rjw.lan>
	<CAKohpo=TFO5CEtO_tDxTthC3K01yh08v9h7hXr2Oq4zffgb2OQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=TFO5CEtO_tDxTthC3K01yh08v9h7hXr2Oq4zffgb2OQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Robin Randhawa <robin.randhawa@arm.com>, linux-pm@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Steve Bannister <Steve.Bannister@arm.com>, Arvind Chauhan <arvind.chauhan@arm.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Charles Garcia-Tobin <charles.garcia-tobin@arm.com>

On Fri, Mar 22, 2013 at 5:25 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 22 March 2013 17:29, Rafael J. Wysocki <rjw@sisk.pl> wrote:
>> Sure.  Can you please remind me what hardware is that, though?
>
> Not yet upstreamed: big LITTLE :)

Yes, the b.L cpufreq driver is being reviewed currently. And board
support is being merged in.

> But, this is broken for all other platforms too.. You just need to compile
> your driver as module and insmod/remove it to call
> cpufreq_driver_unregister().
