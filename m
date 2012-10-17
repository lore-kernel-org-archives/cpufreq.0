From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 15:53:38 +0530
Message-ID: <CAKohpo=i+LAFR1JWen0n3c1-3vHOm52G5bt7ty-4q2QKpuQRXA@mail.gmail.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
	<507E797C.1010204@arm.com>
	<CAKohpom0Jk+DqAKXz_KWJhpdVAmmXWA2Tr97OpK6=Ke8+KrW8g@mail.gmail.com>
	<507E812C.2030507@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <507E812C.2030507@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, PDSW-power-team <PDSW-power-team@arm.com>

On 17 October 2012 15:28, Sudeep KarkadaNagesha
<Sudeep.KarkadaNagesha@arm.com> wrote:
> May be kernel/Documentation/dynamic-debug-howto.txt is more up-to-date.

yes.

>> My usecase is a bit different. I want to see all bootprints with
>> cpufreq pr_debug
>> prints. So, this prefixing will help there.

> The document covers "Debug messages during Boot Process" even though I have
> never tried :)

Looks like it does. That's good.
But this patch is anyway required, because of the earlier mentioned reason.

--
viresh
