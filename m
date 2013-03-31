From: Simon Kalteis <skalteis@kernelspace.de>
Subject: Re: Intel Core2 Duo E6600 reports max-frequency of just 900 MHz
 instead of 2.4 GHz
Date: Sun, 31 Mar 2013 14:10:55 +0200
Message-ID: <20130331141055.2e9cc773@intellistation.kalteis>
References: <20130331012053.220de31f@intellistation.kalteis>
	<CAOh2x==5_UXqSjMT9bjrKNLC4xrFCw7jeahkAoo6UHSdz3KE7w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x==5_UXqSjMT9bjrKNLC4xrFCw7jeahkAoo6UHSdz3KE7w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Sun, 31 Mar 2013 09:37:16 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> Can we have output of cpufreq-info util?
> 

Sure:

cpufreq-info:

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 600 MHz - 900 MHz
  available frequency steps: 900 MHz, 600 MHz
  available cpufreq governors: userspace, conservative, powersave,
ondemand, performance current policy: frequency should be within 600
MHz and 900 MHz. The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 900 MHz (asserted by call to hardware).
  cpufreq stats: 900 MHz:49.48%, 600 MHz:50.52%  (204)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 10.0 us.
  hardware limits: 600 MHz - 900 MHz
  available frequency steps: 900 MHz, 600 MHz
  available cpufreq governors: userspace, conservative, powersave,
ondemand, performance current policy: frequency should be within 600
MHz and 900 MHz. The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 900 MHz (asserted by call to hardware).
  cpufreq stats: 900 MHz:22.56%, 600 MHz:77.44%  (377)


Regards,

Simon
