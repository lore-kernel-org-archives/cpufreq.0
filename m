From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/2] cpufreq: cpufreq_driver_lock is hot on large systems
Date: Tue, 05 Feb 2013 02:07:18 +0100
Message-ID: <2765418.Ft0GYkgNgL@vostro.rjw.lan>
References: <1360017913-25667-1-git-send-email-nzimmer@sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1360017913-25667-1-git-send-email-nzimmer@sgi.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Zimmer <nzimmer@sgi.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>

On Monday, February 04, 2013 04:45:11 PM Nathan Zimmer wrote:
> I am noticing the cpufreq_driver_lock is quite hot.
> On an idle 512 system perf shows me most of the system time is spent on this
> lock.  This is quite signifigant as top shows 5% of time in system time.
> My solution was to first convert the lock to a rwlock and then to the rcu.
> 
> 
> Nathan Zimmer (2):
>   cpufreq: Convert the cpufreq_driver_lock to a rwlock
>   cpufreq: Convert the cpufreq_driver_lock to use the rcu
> 
>  drivers/cpufreq/cpufreq.c | 139 ++++++++++++++++++++++++++--------------------
>  1 file changed, 79 insertions(+), 60 deletions(-)

I like these changes.

Viresh, anyone, any comments?

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
