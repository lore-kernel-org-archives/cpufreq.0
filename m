From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 1/3] powernow-k6: disable cache when changing frequency
Date: Mon, 6 Jan 2014 15:17:13 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401061514450.25034@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1312111937570.23022@file01.intranet.prod.int.rdu2.redhat.com> <CAKohpo=_0i43EDSoOAm2ROwEmu9__p+MyoObcLPoZWxUB5XmDA@mail.gmail.com>
 <alpine.LRH.2.02.1401021233280.16351@file01.intranet.prod.int.rdu2.redhat.com> <CAKohpok=exdOO-T+SFxsyqCBZ1N8ZFBMcVNn-AYsxxMw74DeJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpok=exdOO-T+SFxsyqCBZ1N8ZFBMcVNn-AYsxxMw74DeJQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On Fri, 3 Jan 2014, Viresh Kumar wrote:

> On 2 January 2014 23:08, Mikulas Patocka <mpatocka@redhat.com> wrote:
> > Flushing the cache and changing frequency takes approximatelly 500us. The
> > patch increases policy->cpuinfo.transition_latency to that value.
> 
> Its not about how fast caches get cleaned but how much time would
> be wasted to get them filled again as same data could be required again
> which is just flushed out. That would impact performance more than
> flushing caches.

I didn't see any performance degradation when I tried changing the 
frequency manually with or without the cache flush patch - the overhead of 
running cpufreq (8ms) is far worse than the frequency transition itself.

Mikulas
