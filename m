From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 10:58:04 +0100
Message-ID: <507E812C.2030507@arm.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org> <507E797C.1010204@arm.com> <CAKohpom0Jk+DqAKXz_KWJhpdVAmmXWA2Tr97OpK6=Ke8+KrW8g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpom0Jk+DqAKXz_KWJhpdVAmmXWA2Tr97OpK6=Ke8+KrW8g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, PDSW-power-team <PDSW-power-team@arm.com>

On 17/10/12 10:39, Viresh Kumar wrote:
> On 17 October 2012 14:55, Sudeep KarkadaNagesha
> <Sudeep.KarkadaNagesha@arm.com> wrote:
>> With CONFIG_DYNAMIC_DEBUG, you can control(enable/disable) debug
>> prints at different levels (file, module, line, function)
>
> Quickly went through this :)
> http://www.kernel.org/doc/ols/2009/ols2009-pages-39-46.pdf
>
May be kernel/Documentation/dynamic-debug-howto.txt is more up-to-date.

> My usecase is a bit different. I want to see all bootprints with
> cpufreq pr_debug
> prints. So, this prefixing will help there.
>
> Also, i am not sure if dynamic debug will help in boot prints too?
The document covers "Debug messages during Boot Process" even though I 
have never tried :)

Regards,
Sudeep

