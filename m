From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: don't call cpufreq_update_policy() on CPU addition
Date: Mon, 17 Feb 2014 10:45:41 +0530
Message-ID: <CAKohpo=57bYHsx+m5wevuB0_4fhTK813T5TXnUYZh64gQ1YdWA@mail.gmail.com>
References: <15ccc0609cb9ee3db0ad3a95b29bf69d11ea197c.1392375504.git.viresh.kumar@linaro.org>
	<8f2fc4d6240b567fdb69a0b47f073d174b7ef9b2.1392375504.git.viresh.kumar@linaro.org>
	<1725957.nHPERWcMfN@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1725957.nHPERWcMfN@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pierre Ossman <pierre-list@ossman.eu>

On 17 February 2014 05:51, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> On Friday, February 14, 2014 04:30:41 PM Viresh Kumar wrote:
>> cpufreq_update_policy() is called from two places currently. From a workqueue
>> handled queued from cpufreq_bp_resume() for boot CPU and from
>> cpufreq_cpu_callback() whenever a CPU is added.
>>
>> The first one makes sure that boot CPU is running on the frequency present in
>> policy->cpu. But we don't really need a call from cpufreq_cpu_callback(),
>> because we always call cpufreq_driver->init() (which will set policy->cur
>> correctly) whenever first CPU of any policy is added back. And so every policy
>> structure is guaranteed to have the right frequency in policy->cur.
>
> That sounds good, but doing the extra cpufreq_update_policy() shouldn't actually
> hurt, should it?

Yeah, it shouldn't hurt badly..

> So, that would be a cleanup rather than a fix, right?

Hmm, yeah..
