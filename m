From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] Cpufreq: Change sysfs interface cpuinfo_cur_freq access privilege
Date: Mon, 25 Nov 2013 10:00:42 +0530
Message-ID: <CAKohponvz8CjDpMbx=BXpBv5q8d4x94No90sJWjVsTRS_Uj1jw@mail.gmail.com>
References: <1385348018-30525-1-git-send-email-tianyu.lan@intel.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1385348018-30525-1-git-send-email-tianyu.lan@intel.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lan Tianyu <tianyu.lan@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, hg197@gmx.de, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 25 November 2013 08:23, Lan Tianyu <tianyu.lan@intel.com> wrote:
> Currently, cpuinfo_cur_freq is only accessible for root user while
> other cpufreq sysfs interfaces(E,G scaling_cur_freq) are available
> to ordinary user. This seems make no sense. This patch is to change
> it.

There is nothing wrong with the code and so this is more of a design
change..

Probably Rafael can help us here as cpufreq_cur_freq will read stuff
directly from hardware instead of using cached value in software.

--
viresh
