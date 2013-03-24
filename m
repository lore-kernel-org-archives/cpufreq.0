From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [REGRESSION] [CPUFREQ] 3.9.0-rcX
Date: Sun, 24 Mar 2013 21:29:13 +0530
Message-ID: <CAKohpomTg9QRo15sA=vbG+zuJvMhzi1=T1H6X=M-TsCtzNsFLw@mail.gmail.com>
References: <CAG9S4UjMeRZECAiigZVLTU4av2ZJNBukyUAoCmiYRjtkdThhFw@mail.gmail.com>
	<CAKohpokBySA5uaTTAwF5tmUr-_+W04Ki_f6cWTLu7n1C3Tcqog@mail.gmail.com>
	<CAG9S4UjFJ2hLD7fXJ7D3Le=GC3xRZaD8vZ+YQOav5q+fnKO+Qw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAG9S4UjFJ2hLD7fXJ7D3Le=GC3xRZaD8vZ+YQOav5q+fnKO+Qw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Rutecki <maciej.rutecki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On 24 March 2013 21:06, Maciej Rutecki <maciej.rutecki@gmail.com> wrote:
> -rc4 + yours path, config based on -rc3:
>
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
>
> (use acpi-cpufreq)
>
> Freq. seems be ok. 'ondemand' governor works as expected.

Thanks for testing it. I have sent this patch upstream now with your Tested-by.

--
viresh
