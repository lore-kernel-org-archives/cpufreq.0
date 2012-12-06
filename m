From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 13:16:10 -0500
Message-ID: <50C0E0EA.6040403@verisign.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50C0C950.2070007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C0C950.2070007@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com, arjan@linux.intel.com

On 12/06/12 11:35, Dirk Brandewie wrote:
> ...
>
> I disagree the server/data center user cares deeply about performance
> per watt.  The are selling performance and watts are a cost.  Power
> consumption and required cooling are big issues for the data center.
>
> The data center does not want to leave a lot of performance on the
> table so they do not need to under provision a servers to satisfy
> their SLAs.

So the way many data centers work is that each rack is provisioned for a maximum amount of peak power, and both the people running the data center and those putting equipment in them (who are often different entities) want to be very sure the maximum peak power is never exceeded, as that would cause downtime for the whole rack.  But beyond that, many data centers do not charge for actual power consumption, just for provisioned peak power, giving the equipment operators no incentive to conserve power when idle.  It is for this sort of situation that having a setting like "< 3% degradation" is useful, if the equipment owners perceive they can use it with a performance loss that is small enough to ignore.

There are other issues in this situation too -- the driver/governor should not spend much effort reevaluating load when already running as fast as possible, for two reasons: (1) if you are busy you cannot afford to waste much CPU frequently reevaluating load; and (2) if you are generally busy it is counterproductive to frequently blip down to a lower-performance state even if you think you could based on instantaneous load data.   But when in a more idle state, load must be reevaluated very often to see if a load spike has occurred.  With frequency shifting, this would mean you ramp up fast and ramp down slowly.  I'm not sure how applicable this issue is to your driver, but the same general issue probably applies unless load evaluation and power state switching are very nearly completely f
 ree and instantaneous.

> I believe that server spend most of their time somewhere between idle
> and max performance where selecting an appropriate intermediate
> operating frequency will have significant benefit.
There certainly is a lot of time spent with small loads, but for many network applications average loads are so light as to leave most hardware threads idle nearly all the time.  But on the rare occasions when they get busy, they get REALLY busy and performance is critical.  Nobody really cares whether you have a 20% CPU performance degradation under light to medium loads, because the network stack is going to perform great and give you such low latency in those circumstances nobody will notice.  It's when you exceed 50% of your max throughput (which means you really are very, very busy) that latency goes through the roof and performance matters.
...
> I agree that reporting the current frequency is important to some
> utilities.  To make this work with the current cpufreq subsystem will
> take some amount of refactoring of cpufreq.  I did not take on this
> work yet and was hoping to to get some advice from the list on the
> correct way to do this.
Per the other thread reporting the average speed over the last, say, 100msec would be plenty fast.  The gauges and such people have on their desktops cannot respond faster than that.  And if it has too much cost at 100msec make it slower.

> > So outside of a research kernel, I don't think having a "cpufreq/snb"
> > directory is a good place to expose tuning parameters,
>
> I agree most of the tunables should NOT be exposed to the user. The
> place for the tunables was chosen to make obvious to people that
> snb had replaced ondemand.
I think cpufreq itself is a bad name and should turn into something else.  It is reasonable to expose snb-specific tunables under the driver, but I don't think it should be under cpufreq.

> > In the long run both integrators and
> > maintainers of Linux distributions are going to insist on a generic
> > interface that can work across the vast majority of modern hardware,
> > rather than cater to a special case that only works on one or CPU
> > families, even if those families are particularly important ones.
>
> How this driver gets integrated in to a system is still an open
> question. I can think of more than a few "reasonable" ways to
> integrate this into a system.  Before I launched into creating a
> solution I wanted feedback/guidance from the list.
Good, and unfortunately the short-term and long-term answers are rather different.

I like the idea of exposing a very high-level interface for users like that Arjan and I have been talking about.  It is probably possible to have a "thin" governor maybe called "pstate", perhaps, that just handles this with the /sys interface and sits parallel to "ondemand", that would be the quickest thing to do in the short term, while fitting within the cpufreq ecosystem, which expects drivers and governors to be separate entities.  The pstate governor <-> snb driver interface would be the main additional work over what you've already done, I expect.  Not sure if it would make any sense to try to make the snb driver work with any of the existing governors.

In the longer term, cpufreq/ should be ditched and the whole thing rethought, probably, and maybe the governor/driver distinction would go away, and instead you'd have drivers for specific hardware and some shared services they can use to handle /sys.  Or you could keep using a "thin governor" to handle the non-driver-specific /sys interface.  But this requires distributions to change all their config files that are all oriented around switching frequency based on kernel-assessed load.

DCN

