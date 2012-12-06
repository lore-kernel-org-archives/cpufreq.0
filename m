From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 22:26:48 +0100
Message-ID: <1912941.ZSxpVlGcnU@vostro.rjw.lan>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <1881660.ZpA1SQTrgA@vostro.rjw.lan> <50C10AE1.4060608@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C10AE1.4060608@linux.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: David C Niemi <dniemi@verisign.com>, dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, deneen.t.dock@intel.com

On Thursday, December 06, 2012 01:15:13 PM Arjan van de Ven wrote:
> On 12/6/2012 12:45 PM, Rafael J. Wysocki wrote:
> 
> >> My idea for a policy "dial" is mostly
> >>
> >> * Uncompromised performance
> >> * Balanced - biased towards performance     (say, defined to be lowest power at most a 2 1/2% perf hit)
> >> * Balanced                                  (say, at most a 5% perf hit)
> >> * Balanced - biased towards lower power     (sat, at most a 10% perf hit)
> >> * Uncompromised lowest power
> >>
> >> we can argue about the exact %ages, but the idea is to give at least some reasonably definition that people can understand,
> >> but that also can be measured
> >
> > It looks like you'd like a tunable setting the maximum allowed performance hit
> > due to power management.  Is that correct?
> 
> basically yes, but not as a continuous dial (that's not practical), but as a
> certain number of sensible steps.... I'm not sure it makes sense to have more than 5 steps.

Then you need to get the people to agree on what the "sensible steps" are. :-)

I agree that continuous is not practical, however.

> My key interest is to have something that is both understandable by the sysadmin as to what it means,
> but also something that you can actually measure (and thus test)...
> while still describing a desire/preference, not a specific implementation of an algorithm.
> 
> A sysadmin understands "willing to give up at most 5% of max performance to save power"... and he can reason about it,
> and think about it, take his own situation into account and then make a decision on it as a result.
> 
> The policy side can then measure algorithms and tunables to make sure they stay within that 5%
> (of course on "reasonable" or "realistic" workloads.. not theoretical foofoo stuff).
> 
> You must put something like this in place, because if you just call it "balanced", that means 101 different things
> to 100 people.... and as a result neither the algorithm side can ever do anything (SOMEONE somewhere will regress),
> nor can the sysadmin side make a reasonable decision, since it means something else on each machine as well.

Yes, I know that.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
