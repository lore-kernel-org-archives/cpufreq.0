From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 0/3] powernow-k6: fixes for the frequency driver
Date: Wed, 11 Dec 2013 19:37:48 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

Hi

Here I'm sending three patches for k6 frequency governor.

1. the processor doesn't respond to cache snoops when changing the 
frequency, so we need to disable cache while doing the change.

2. it is impossible to read the default multiplier. After reset, the 
register always reports zero regardless of the current multiplier. So we 
set the multiplier based on current frequency and allow the user to 
override it with module parameter.

3. reorder frequencies from the highest to the lowest.

Mikulas
