From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Wed, 05 Dec 2012 16:40:04 -0500
Message-ID: <50BFBF34.3090608@verisign.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50BFB627.5080106@linux.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/05/12 16:01, Arjan van de Ven wrote:
> the idea that you can have separate policy and hardware is a big fallacy though.
> A good policy ends up very hardware specific, and policies of the past work poorly on todays hardware
> ("ondemand" is one of the worst case behaviors you can have on modern Intel cpus for example).
>
> While I appreciate the desire for some level of "preference" control, the split of policy and hardware in the
> way cpufreq did that really isn't the way to go forward...
>
I don't think separating policy from implementation is a fallacy at all, it is good design practice.  Policy is a distillation of the "prorities and intent of the end user".  It can be very high level, saying whether to prioritize single-thread performance, multi-thread performance, power savings, responsiveness coming out of idle, performance per watt on mid-level loads, etc.  Maybe you can have one governor try to cater to all those things, or you have separate governors each targeting a subset of the use cases.

The problem with the existing governor configuration interfaces is that they are too detailed and too implementation-specific, as they grew out of an environment and mindset in which changing frequency was the only thing you could really control.  The nice thing about the P-state driver is that it breaks new ground and can save power in new ways.  But it should not repeat the mistake of just exposing implementation-specific knobs to tweak.  That might be good for experimentation but it won't be good for widespread use.  We should have a generalized interface between drivers and governors, for backwards and forwards compatibility reason, and obviously that interface needs work to support more modern power saving approaches like this one.  What is exposed to the end user is then up to each g
 overnor.

I would also say that the ondemand and performance governors are very widely used, and people will expect them to still work with any new driver.  But maybe their attempts at changing frequency could be reinterpreted in new ways.  All "performance" ever says is "run at frequency XXXX", and ondemand just wants to  "run hardware thread x at max performance until further notice" and "now run hardware thread x at minimum power consumption".  The latter would probably be easy to interpret.  The former, depends on being able to set an explicit frequency any time you feel like it and have the hardware thread stay there, not sure how realistic that is.

DCN
