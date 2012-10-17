From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 11:25:18 +0530
Message-ID: <CAKohpo=LL+wPcb97KNQvHbX0fzhnRBZjPsHXTj1PdYObuVVTgw@mail.gmail.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
	<1350452374.3072.19.camel@joe-AO722>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1350452374.3072.19.camel@joe-AO722>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com

On 17 October 2012 11:09, Joe Perches <joe@perches.com> wrote:
> On Wed, 2012-10-17 at 10:50 +0530, Viresh Kumar wrote:
>> With debug options on, it is difficult to locate cpufreq core's debug prints.
> []
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> []
>> @@ -15,6 +15,8 @@
>> +#define pr_fmt(fmt) "cpufreq: " fmt
>
> I'd prefer that
>
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> be used for all of these.

Hi Joe,

Sorry, i am not sure how KBUILD_MODNAME is compiled by kernel.

If i am not wrong KBUILD_MODNAME would work only for drivers that can
be added as module? If so, then it may not apply here, as most of the stuff
i have updated doesn't call module_init().

So, if i try KBUILD_MODNAME with my patch i get prints as:

KBUILD_MODNAME: <print - text>

--
viresh
