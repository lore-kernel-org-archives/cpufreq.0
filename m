From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Intel Core2 Duo E6600 reports max-frequency of just 900 MHz
 instead of 2.4 GHz
Date: Sun, 31 Mar 2013 19:16:54 +0530
Message-ID: <CAKohpomKuPXhRayR61v6JU_rV4-if+mtW+kze49ibPMfZ9Oy+Q@mail.gmail.com>
References: <20130331012053.220de31f@intellistation.kalteis>
	<CAOh2x==5_UXqSjMT9bjrKNLC4xrFCw7jeahkAoo6UHSdz3KE7w@mail.gmail.com>
	<20130331141055.2e9cc773@intellistation.kalteis>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130331141055.2e9cc773@intellistation.kalteis>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kalteis <skalteis@kernelspace.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Borislav Petkov <bp@alien8.de>, Thomas Renninger <trenn@suse.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 31 March 2013 17:40, Simon Kalteis <skalteis@kernelspace.de> wrote:
> cpufreq-info:
>
> cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0
>   CPUs which need to have their frequency coordinated by software: 0
>   maximum transition latency: 10.0 us.
>   hardware limits: 600 MHz - 900 MHz
>   available frequency steps: 900 MHz, 600 MHz
>   available cpufreq governors: userspace, conservative, powersave,
> ondemand, performance current policy: frequency should be within 600
> MHz and 900 MHz. The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 900 MHz (asserted by call to hardware).
>   cpufreq stats: 900 MHz:49.48%, 600 MHz:50.52%  (204)
> analyzing CPU 1:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 1
>   CPUs which need to have their frequency coordinated by software: 1
>   maximum transition latency: 10.0 us.
>   hardware limits: 600 MHz - 900 MHz
>   available frequency steps: 900 MHz, 600 MHz
>   available cpufreq governors: userspace, conservative, powersave,
> ondemand, performance current policy: frequency should be within 600
> MHz and 900 MHz. The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 900 MHz (asserted by call to hardware).
>   cpufreq stats: 900 MHz:22.56%, 600 MHz:77.44%  (377)

So your hardware has communicated only two frequencies to cpufreq-core:
600 and 900 MHz.. Don't know what that could be on a x86..

Lets see if others added in Cc can help you.
