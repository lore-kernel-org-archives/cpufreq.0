From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/1] Skip the driver if ACPI has power mgmt option
Date: Fri, 20 Sep 2013 13:05:08 +0530
Message-ID: <CAKohpokoOHop8AjffafzeAyrgndpPbCXO8c=gCK1tXa6-_Uftg@mail.gmail.com>
References: <1379662368-6580-1-git-send-email-adrian.huang@hp.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1379662368-6580-1-git-send-email-adrian.huang@hp.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Huang <adrian.huang@hp.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linda.knippers@hp.com

On 20 September 2013 13:02, Adrian Huang <adrian.huang@hp.com> wrote:
> I re-sent this email becuase my system time was incorrect for my first submission (The sent time of the first submission showed "2012/8/16  08:12PM"). Sorry for any inconvenience.

You should have added this after the "---" available below, so
that it doesn't get commited in the logs..

> Do not load the Intel pstate driver if the platform firmware
> (ACPI BIOS) supports the power management alternatives.
> The ACPI BIOS indicates that the OS control mode can be used
> if the _PSS (Performance Supported States) is defined in ACPI
> table. For the OS control mode, the Intel pstate driver will be
> loaded.
>
> Signed-off-by: Adrian Huang <adrian.huang@hp.com>
> ---

<Here..>

>  drivers/cpufreq/intel_pstate.c | 84 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
