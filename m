From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 09:41:12 -0800
Message-ID: <50C0D8B8.1060301@linux.intel.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com> <50BFC28C.9060004@linux.intel.com> <50C0B34D.5020406@verisign.com> <50C0C761.8000501@linux.intel.com> <50C0D64E.8050005@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C0D64E.8050005@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David C Niemi <dniemi@verisign.com>
Cc: dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/6/2012 9:30 AM, David C Niemi wrote:
> On 12/06/12 11:27, Arjan van de Ven wrote:
>> ...
>>> The exposed configuration interface might be as simple as choosing one of several discrete settings:
>>> - max single-threaded performance
>>> - max multi-threaded performance
>>
>>
>> these are identical on todays silicon btw; or rather, this is not a P state choice item, but a task scheduler policy item.
>
> Here's where there is a difference in power management:
 > if you want to maximize single-thread performance, you're willing to enable power-expensive boost
 > modes on behalf of a thread.

sure

> You don't want to do that for multithreaded performance because your thermal envelope may not let
 > you boost them all at once.  Or at least that is what I was thinking.

this part I don't buy, at least on current hw... the boost code will deal with this quite well;
there's no knob that can do better than that.

>
> Also some people will be all about I/O throughput, and others will care more about latency than anything else, and percentages for those people may be wildly different than for general computation.  So we can't guarantee any particular percentage outside some well-defined benchmarks.  But we could try to lump them all together as best we can and have a couple of knobs on the side like the current "io_is_busy", perhaps.
>>> - "server" setting -- save power but only in ways that do not affect performance
>>
>> this is a fiction btw... if there was a way to reduce power and not affect performance, that's your "max performance" setting.
>> anything else will sacrifice SOME performance from max...

> I know people who don't pay for electricity or cooling and think max performance == run every thread at maximum possible speed all the time, even if it is idle.
 > But boost modes mean "maximum possible speed" is a fluid concept.

my point was that this is no different than "max single/multi performance" above.. unless you can make tradeoffs
(which means performance impact).

>> and defining a common policy interface I'm quite fine with (not quite in the way you defined it, but ok...)
>> But that's not going to lead to a common implementation as a "governor" ;-(
>>
>> My idea for a policy "dial" is mostly
>>
>> * Uncompromised performance
>> * Balanced - biased towards performance     (say, defined to be lowest power at most a 2 1/2% perf hit)
>> * Balanced                                  (say, at most a 5% perf hit)
>> * Balanced - biased towards lower power     (sat, at most a 10% perf hit)
>> * Uncompromised lowest power
>>
>> we can argue about the exact %ages, but the idea is to give at least some reasonably definition that people can understand,
>> but that also can be measured

> I am quite happy with your definitions above.  It is the same in spirit as what I was trying for, just better stated.
>
> I expect the performance degradation percentages are going to vary a lot depending on what
 >  techniques are available in the hardware. If we want to generalize this to encompass older
 > hardware too (which I think is a good idea), I could see percentages being, say, <3% <10% <20% to
 >  give more room to work with, and nicer newer hardware being able to do better as your percentages indicate.

I'm quite ok to add other steps... my point was to get an explicit/clear expectation of what a setting means
in a way that you can measure (and thus validate/etc)

>
> On reporting frequency: would it be practical to report some sort of medium-term average frequency,

so there are counters in the cpus about what we ran it, and you do a delta over a time that you pick to get
an average. (if you pick too short a time, say, 100 cycles, obviously the division gives you a mostly noise number due
to quantization and then dividing a small number by a small noisy number)
so reporting in hindsight over a reasonable time (say a few dozen milliseconds) is not too hard as
long as you could define a time in the past where you did a measurement
to start the delta point... ideally we don't wake up the cpu to do this.. because then we're wasting power for it -(



> or if that is not available, to just report the max freq that the hardware thread is currently eligible to use?

this part is not available at all..... so no we cannot do this.
(well, we do have the maximum the chip can do... but that's a constant number.. might as well report "42")

