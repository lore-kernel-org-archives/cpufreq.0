From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 10:01:33 -0500
Message-ID: <50C0B34D.5020406@verisign.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com> <50BFC28C.9060004@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50BFC28C.9060004@linux.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com


My point is that performance vs. power is not just a linear continuum of preferences.  How idle and full speed are handled are of particular importance in many applications.

I think we both agree the existing governors are obsolete and do things the wrong way.  But we attach different meanings to "policy" and may have different ideas of what should be.

I think of policy as very high level and totally compatible with a variety of very different hardware implementations.  The minimum a true high-level policy "governor" would need to do is this:
a) determine what the hardware's capabilities are (init)
b) provide a configuration interface analogous to what we have now but much higher-level and less frequency-centric
c) assess system load on an ongoing basis.
d) control the power management driver based on the user preferences and the system load pattern.

The lines between governor and driver could be drawn in various places, but the point of having some sort of governor is to not have to reimplement the whole stack for every driver.

The exposed configuration interface might be as simple as choosing one of several discrete settings:
- max single-threaded performance
- max multi-threaded performance
- "server" setting -- save power but only in ways that do not affect performance
- "default" -- a good general-purpose middle of the road setting that performs pretty well and also saves power
- "on battery" setting -- provide good interactive responsiveness but aggressively save power, potentially making long-running tasks take longer
- "min power"

The above is what I think of as policy.  There is nothing hardware-specific about these.  These say nothing directly about what frequency to run or whether to use P-States.  On some hardware some of these settings might be equivalent to each other, but then again there is some hardware that can only run one way.  The driver could expose lower-level implementation-specific controls in its own area, but there should be a higher level interface that separates that from what users normally have to deal with.

The interface between the governor and the driver needs to include some combination of current load conditions and user preferences.  It does not have to talk about frequency or anything hardware-specific, but it needs to encompass both dynamic information (based on load) and fairly static information (user preferences).

If the CPU and chipset can assess load well enough by themself and carry out governor-like decisions in hardware, we can regard the need to have the governor assess load and communicate it to the driver as optional.  In that case user priorities are the only thing left above the driver level.

DCN

On 12/05/12 16:54, Arjan van de Ven wrote:
> ...
> thinking that policy is independent of the hardware is a fallacy.
> Preference is what the user wants, sure. But a policy agent (governor) that implements that preference is very hardware
> dependent.
...
> here's where things go wrong. "ondemand" does not indicate a power-versus-performance preference.
> It indicates a certain very specific behavior of frequency selection.
> A behavior that is really bad on current Intel hardware, and hurting generally in BOTH power AND performance... at the same time.
>
> I am by no means suggesting to take away a users ability to decide where he wants to live in the
> performance-versus-power scale.... but what I am suggesting is that implementing that preference is
> cpu dependent; it seems to be that, at least on the past Intel roadmap, there are very fundamental changes
> every 2 years that mean throwing away the actual algorithm and starting over... and I don't see that changing;
> if anything it might be yearly instead of every 2 years.
>
> something like "ondemand" got designed 10 years ago, for hardware from back then... and SandyBridge ^W"2nd generation core"
> is at least 2 if not 3 fundamental technology steps ahead of that, and the assumptions behind "ondemand" are
> outright not true anymore.
> (ondemand design still assumes for example that frequency selection matters for when the CPU is idle.. something that's not been
> true for quite some time now.. in idle the frequency and voltage are both 0.)
>
>


