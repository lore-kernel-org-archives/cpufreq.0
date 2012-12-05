From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Wed, 05 Dec 2012 13:54:20 -0800
Message-ID: <50BFC28C.9060004@linux.intel.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50BFBF34.3090608@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David C Niemi <dniemi@verisign.com>
Cc: dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/5/2012 1:40 PM, David C Niemi wrote:
> On 12/05/12 16:01, Arjan van de Ven wrote:
>> the idea that you can have separate policy and hardware is a big fallacy though.
>> A good policy ends up very hardware specific, and policies of the past work poorly on todays hardware
>> ("ondemand" is one of the worst case behaviors you can have on modern Intel cpus for example).
>>
>> While I appreciate the desire for some level of "preference" control, the split of policy and hardware in the
>> way cpufreq did that really isn't the way to go forward...
>>
> I don't think separating policy from implementation is a fallacy at all, it is good design practice.

thinking that policy is independent of the hardware is a fallacy.
Preference is what the user wants, sure. But a policy agent (governor) that implements that preference is very hardware
dependent.

>
> I would also say that the ondemand and performance governors are very widely used,

here's where things go wrong. "ondemand" does not indicate a power-versus-performance preference.
It indicates a certain very specific behavior of frequency selection.
A behavior that is really bad on current Intel hardware, and hurting generally in BOTH power AND performance... at the same time.

I am by no means suggesting to take away a users ability to decide where he wants to live in the
performance-versus-power scale.... but what I am suggesting is that implementing that preference is
cpu dependent; it seems to be that, at least on the past Intel roadmap, there are very fundamental changes
every 2 years that mean throwing away the actual algorithm and starting over... and I don't see that changing;
if anything it might be yearly instead of every 2 years.

something like "ondemand" got designed 10 years ago, for hardware from back then... and SandyBridge ^W"2nd generation core"
is at least 2 if not 3 fundamental technology steps ahead of that, and the assumptions behind "ondemand" are
outright not true anymore.
(ondemand design still assumes for example that frequency selection matters for when the CPU is idle.. something that's not been
true for quite some time now.. in idle the frequency and voltage are both 0.)


