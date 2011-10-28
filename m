From: "Steven Finney (Palm GBU)" <Steven.Finney@palm.com>
Subject: RE: Request for DIscussion: Cpufreq logging, and frequency floors
Date: Fri, 28 Oct 2011 09:45:05 -0700
Message-ID: <5A766795FA0C7A4989A71981F0A3D7EC2B89B6A565@ushqwmb01>
References: <465E946FB313F242A955E3365C8D13A510491297@ushqwmb10>
 <20111023114802.GA15272@sirena.org.uk>,<20111024000158.GA19078@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20111024000158.GA19078@redhat.com>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dave Jones <davej@redhat.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "Dmitry Fink (Palm GBU)" <Dmitry.Fink@palm.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

> From: Dave Jones [davej@redhat.com]
> Sent: Sunday, October 23, 2011 5:01 PM
> Subject: Re: Request for DIscussion: Cpufreq logging, and frequency floors
> 
> On Sun, Oct 23, 2011 at 12:48:03PM +0100, Mark Brown wrote:
>  > On Fri, Oct 21, 2011 at 02:31:57PM -0700, Steven Finney (Palm GBU) wrote:
>  >
>  > >  2) The ability to keep a diagnostic log of all the frequency changes so,
>  > > e.g., it's possible to determine if bad behavior (e.g. dropouts) is
>  > > correlated with a low frequency.
>  >
>  > This is a really good and useful idea but it seems to me like it would
>  > be better done with the standard trace subsystem - that provides good
>  > facilities for enabling and disabling the trace as needed and would make
>  > it easy to tie in with the other subsystems that are in play.
> 
> Indeed. This sounds like the direction to go towards. Having played a little
> with Steven Rostedt's kernelshark tool, I could see interesting things coming
> from being able to correlate transitions with other system events graphically.

Actually, it turns out there's at least some trace-system based cpufreq
tracing that was added sometime after our 2.6.35 kernel; 2.6.38 cpufreq.c 
contains a trace_cpu_frequency() added by Thomas Renninger (so: generic,
and not restricted to Intel architectures). Perhaps this
is adequate; I haven't had a chance to try it yet. Do you know of problems
with that implementation? (One thing that might be nice to add is the option
of logging the decision made at each sample, with the load value,rather
than just the actual cpufreq changes).

sf
