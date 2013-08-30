From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [Query] CPUFreq: Does these machines have separate clock domains
 for CPUs?
Date: Fri, 30 Aug 2013 15:48:28 +0900
Message-ID: <CANqRtoTSO2yyP35naDe4y6a7rL99=cSs4-bJAWOxR5HL2gbpuw@mail.gmail.com>
References: <CAKohponWn-RN7-6sdhghd6RGCOd357G+TKLsxHfqnSCuMD7xxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=IrMZ2ufc/aPd3mWlPSkOOI5q1t8aoZjSXx84sMHSraI=;
        b=EAruUOTOra9UdqGZn5ek3CxuSsrVXSI21gukXJdwDrlOFaLfI95vhx0n14777WUdqC
         0wDg74oF3pvA2TYYa9gZ+tImPHDwtNqXzkcEw/VpBf1Eigpi659HwgmUaR+8T21Gg+PA
         4Z4I5Q1y95a8e0+cqj88utBfxWG9yH5iAuHHty17zt2Amrkcf5pREiQZSWGYZ/0/TUaX
         rVUhe2R6hwh6t/B8vmsmksmG+vfmWNw8igJCzl1PsA/PTZHRm8Q77loxRtK+lX/6M6MV
         ZPTry9IcwfvR+RkRBog5QBKrjOKxVrTqqG6hhzPCyEOoWaLnk1Yk3UueWN7x7MVQa1Uo
         dSGw==
In-Reply-To: <CAKohponWn-RN7-6sdhghd6RGCOd357G+TKLsxHfqnSCuMD7xxw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Eric Miao <eric.y.miao@gmail.com>, linux-cris-kernel@axis.com, SH-Linux <linux-sh@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Miao Steven <realmz6@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Mikael Starvik <starvik@axis.com>, Paul Mundt <lethal@linux-sh.org>, sparclinux@vger.kernel.org, Dave Jones <davej@redhat.com>, David Miller <davem@davemloft.net>, John Crispin <blogic@openwrt.org>

Hi Viresh,

On Thu, Aug 29, 2013 at 7:15 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Hi,
>
> I have been doing some CPUFreq cleanup work and
> wanted to know if the below mentioned machines have separate
> clock domains for their CPUs or all share the same domain?
>
> So, that we can use some generic routines for these drivers which
> would eventually do:
>
> cpumask_setall(policy->cpus);
>
> And I wanted to make sure that this doesn't break them.. :)
>
> ......
>
> The drivers are:
...
> drivers/cpufreq/sh-cpufreq.c
...

The above SH cpufreq driver seems to be written with SMP in mind, but
I would say SMP is a very rare case for SH. So I believe it can be
considered as UP-only at this point. If Paul disagrees I'm quite sure
he will tell us.

Cheers,

/ magnus
