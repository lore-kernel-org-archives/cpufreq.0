From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 5 Dec 2005 19:36:54 +0100
Message-ID: <20051205183654.GG11190@wotan.suse.de>
References: <20051202181927.GD9766@wotan.suse.de> <20051202104320.A5234@unix-os.sc.intel.com> <20051204164335.GB32492@isilmar.linta.de> <20051204183239.GE14247@wotan.suse.de> <1133725767.19768.12.camel@mindpipe> <20051205011611.GA12664@redhat.com> <1133796748.21641.8.camel@mindpipe>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932504AbVLEShA@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1133796748.21641.8.camel@mindpipe>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Dave Jones <davej@redhat.com>, Andi Kleen <ak@suse.de>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andrew Morton <akpm@osdl.org>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

> JACK needs to know the CPU speed in order to be able to use RDTSC for
> timing.  Yes that might be "broken" but gettimeofday() is simply not

It is broken then.  Was always broken, will be broken etc.

> fast enough for our use, we can't afford the overhead of thousands of
> system calls per second.  And until recently 99.999% of desktop machines
> had a monotonic TSC so this worked very well.

You're wrong. First if you say "monotonic" you don't understand the problem.
Monotonicity is only a small part of it.  The bigger one is just 
getting the current frequency and figuring out of if the information
is safe to use.

Chips where it doesn't work:

- Intel Prescott and derivatives (newer Pentium 4, newer Xeon, on
Celeron you are still lucky because they normally don't have speedstep): 
TSC runs at a different frequency than the current P state and P state often 
varies with speedstep [These are the most common desktop chips in the world, 
although not all have speedstep enabled. Many newer ones have though.]
- Intel P-M and earlier P4,P3 mobile chips, Athlon 64, Athlon XP-M,
Opteron etc: 
TSC varies with P state and user space has no way to get timely 
updates on P-state changes.
- VIA C3: I believe TSC stops in idle (at least it used to on
older versions, don't know if they fixed it)

-Andi
