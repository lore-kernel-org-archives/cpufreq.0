From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 0/3] powernow-k6: fixes for the frequency driver
Date: Mon, 06 Jan 2014 21:51:05 +0100
Message-ID: <2372881.ND9u0a4YHW@vostro.rjw.lan>
References: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday, December 11, 2013 07:37:48 PM Mikulas Patocka wrote:
> Hi
> 
> Here I'm sending three patches for k6 frequency governor.
> 
> 1. the processor doesn't respond to cache snoops when changing the 
> frequency, so we need to disable cache while doing the change.
> 
> 2. it is impossible to read the default multiplier. After reset, the 
> register always reports zero regardless of the current multiplier. So we 
> set the multiplier based on current frequency and allow the user to 
> override it with module parameter.
> 
> 3. reorder frequencies from the highest to the lowest.

I've queued up this series (and the speedstep-smi patch) for 3.14, but I don't
want it to go to stable upfront, so I removed the "Cc: stable" tags.  Please
send a stable inclusion request to Greg & Co after it spends a few weeks in
the Linus' tree.

Thanks!

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
