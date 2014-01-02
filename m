From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH 1/3] powernow-k6: disable cache when changing frequency
Date: Thu, 2 Jan 2014 12:38:08 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401021233280.16351@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1312111751180.9686@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1312111937570.23022@file01.intranet.prod.int.rdu2.redhat.com> <CAKohpo=_0i43EDSoOAm2ROwEmu9__p+MyoObcLPoZWxUB5XmDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=_0i43EDSoOAm2ROwEmu9__p+MyoObcLPoZWxUB5XmDA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On Tue, 17 Dec 2013, Viresh Kumar wrote:

> On 12 December 2013 06:08, Mikulas Patocka <mpatocka@redhat.com> wrote:
> > During frequency transition the processor is in "EPM Stop Grant" state.
> > The documentation says that the processor doesn't respond to inquiry
> > requests in this state. Consequently, coherency of processor caches and
> > bus master devices is not maintained, causing the system instability.
> >
> > This patch flushes the cache during frequency transition. It fixes the
> > instability.
> 
> I don't have much idea of these systems but wouldn't this affect performance
> badly?

Flushing the cache and changing frequency takes approximatelly 500us. The 
patch increases policy->cpuinfo.transition_latency to that value.

I suppose that the governors should be smart enough to not do frequency 
transitions so often so that majority of time is spent doing the 
transition.

Mikulas
