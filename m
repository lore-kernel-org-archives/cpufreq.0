From: Thomas Renninger <trenn@suse.de>
Subject: Re: Issues with ondemand governor
Date: Thu, 25 Nov 2010 15:31:57 +0100
Message-ID: <201011251531.57920.trenn@suse.de>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com> <4CED1D43.6080900@verisign.com> <AANLkTintd_5LMEPS5OGK0Zh0ydQp-X4D9=kFEpbRFTsg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTintd_5LMEPS5OGK0Zh0ydQp-X4D9=kFEpbRFTsg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Vishwanath Sripathy <vishwanath.sripathy@linaro.org>
Cc: David C Niemi <dniemi@verisign.com>, Amit Kucheria <amit.kucheria@linaro.org>, linaro-dev@lists.linaro.org, cpufreq@vger.kernel.org

On Thursday 25 November 2010 13:05:49 Vishwanath Sripathy wrote:
> Thanks David.
> If I would like to fine tune up_threshold and sampling_down_factor for
> say OMAP platform, is there any way to do it in kernel itself?
> I know these are configurable via sysfs entries. But if I want to
> optimize them in kernel itself, is there anyway? I see that default
> values are set in cpufreq-ondemand.c which is common kernel file. I
> would like to know if these can be set in platform specific code?
Ugly to do...
This should be done global and not per cpu?
If per_cpu it could be added to policy, simlar to latency:
set in driver's init func, evaluated in governor later.

Possibly if in cpufreq.h a struct:
 {
    unsigned int sampling_down_factor;
    ...
} cpufreq_governor_hints;
is added which gets filled by the platform driver in the .init func
and then gets evaluated in the governor, but only once also at init
time. Doing this when the governor is already active involves
locking which must get avoided.

    Thomas
