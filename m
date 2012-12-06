From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 22:34:55 +0100
Message-ID: <1848925.yZaqRNHFOk@vostro.rjw.lan>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50C10AE1.4060608@linux.intel.com> <1912941.ZSxpVlGcnU@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1912941.ZSxpVlGcnU@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: David C Niemi <dniemi@verisign.com>, dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, deneen.t.dock@intel.com

On Thursday, December 06, 2012 10:26:48 PM Rafael J. Wysocki wrote:
> On Thursday, December 06, 2012 01:15:13 PM Arjan van de Ven wrote:
> > On 12/6/2012 12:45 PM, Rafael J. Wysocki wrote:
> > 
> > >> My idea for a policy "dial" is mostly
> > >>
> > >> * Uncompromised performance
> > >> * Balanced - biased towards performance     (say, defined to be lowest power at most a 2 1/2% perf hit)
> > >> * Balanced                                  (say, at most a 5% perf hit)
> > >> * Balanced - biased towards lower power     (sat, at most a 10% perf hit)
> > >> * Uncompromised lowest power
> > >>
> > >> we can argue about the exact %ages, but the idea is to give at least some reasonably definition that people can understand,
> > >> but that also can be measured
> > >
> > > It looks like you'd like a tunable setting the maximum allowed performance hit
> > > due to power management.  Is that correct?
> > 
> > basically yes, but not as a continuous dial (that's not practical), but as a
> > certain number of sensible steps.... I'm not sure it makes sense to have more than 5 steps.
> 
> Then you need to get the people to agree on what the "sensible steps" are. :-)

That said starting with a small value and going up exponentially, like
(1->)2->4->8->16->32->64, sounds like a good idea.

But the sysadmin will also need to know how much power s/he is going to save
by sacrificing that much performance, ie. if the result is worth the effort.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
