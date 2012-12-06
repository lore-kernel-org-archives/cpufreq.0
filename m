From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 21:45:30 +0100
Message-ID: <1881660.ZpA1SQTrgA@vostro.rjw.lan>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50C0B34D.5020406@verisign.com> <50C0C761.8000501@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C0C761.8000501@linux.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: David C Niemi <dniemi@verisign.com>, dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, deneen.t.dock@intel.com

On Thursday, December 06, 2012 08:27:13 AM Arjan van de Ven wrote:
> On 12/6/2012 7:01 AM, David C Niemi wrote:
> >
> > My point is that performance vs. power is not just a linear continuum of preferences.  How idle and full speed are handled are of particular importance in many applications.
> >
> > I think we both agree the existing governors are obsolete and do things the wrong way.  But we attach different meanings to "policy" and may have different ideas of what should be.
> >
> > I think of policy as very high level and totally compatible with a variety of very different hardware implementations.  The minimum a true high-level policy "governor" would need to do is this:
> > a) determine what the hardware's capabilities are (init)
> > b) provide a configuration interface analogous to what we have now but much higher-level and less frequency-centric
> > c) assess system load on an ongoing basis.
> > d) control the power management driver based on the user preferences and the system load pattern.
> >
> > The lines between governor and driver could be drawn in various places, but the point of having some sort of governor is to not have to reimplement the whole stack for every driver.
> 
> the sad part is that this is where reality has caught up with the nice theory.
> hardware keeps innovating/changing around power behavior... very very fundamentally.
> When we started CPUFREQ (yes I was there ;-) ) we had the assumption that a clean split between hardware and governor
> was possible. Even back then, Linus balked at that and made us change it at least somewhat.... the Transmeta
> CPUs at the time showed enough differences already to break. We made, at the time, the minimal changes possible.
> But really the whole idea does not work out.
> 
> >
> > The exposed configuration interface might be as simple as choosing one of several discrete settings:
> > - max single-threaded performance
> > - max multi-threaded performance
> 
> these are identical on todays silicon btw; or rather, this is not a P state choice item, but a task scheduler policy item.
> 
> > - "server" setting -- save power but only in ways that do not affect performance
> 
> this is a fiction btw... if there was a way to reduce power and not affect performance, that's your "max performance" setting.
> anything else will sacrifice SOME performance from max...
> 
> > - "default" -- a good general-purpose middle of the road setting that performs pretty well and also saves power
> 
> ... so you end up at this one.
> 
> > - "on battery" setting -- provide good interactive responsiveness but aggressively save power, potentially making long-running tasks take longer
> 
> battery has nothing to do with power preference. Just ask any data center operator.
> 
> > The above is what I think of as policy.  There is nothing hardware-specific about these.
>  > These say nothing directly about what frequency to run or whether to use P-States.
> 
> and defining a common policy interface I'm quite fine with (not quite in the way you defined it, but ok...)
> But that's not going to lead to a common implementation as a "governor" ;-(
> 
> My idea for a policy "dial" is mostly
> 
> * Uncompromised performance
> * Balanced - biased towards performance     (say, defined to be lowest power at most a 2 1/2% perf hit)
> * Balanced                                  (say, at most a 5% perf hit)
> * Balanced - biased towards lower power     (sat, at most a 10% perf hit)
> * Uncompromised lowest power
> 
> we can argue about the exact %ages, but the idea is to give at least some reasonably definition that people can understand,
> but that also can be measured

It looks like you'd like a tunable setting the maximum allowed performance hit
due to power management.  Is that correct?

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
