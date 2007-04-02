From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH 1/3] Introduce cpuid_on_cpu() and cpuid_eax_on_cpu()
Date: Mon, 2 Apr 2007 14:10:29 +0200
Message-ID: <200704021410.29623.ak@suse.de>
References: <20070402113831.GA6785@localhost.sw.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933984AbXDBMKo@vger.kernel.org>
In-Reply-To: <20070402113831.GA6785@localhost.sw.ru>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexey Dobriyan <adobriyan@sw.ru>
Cc: akpm@osdl.org, linux-kernel@vger.kernel.org, devel@openvz.org, cpufreq@lists.linux.org.uk, hpa@zytor.com, davej@codemonkey.org.uk

On Monday 02 April 2007 13:38, Alexey Dobriyan wrote:
> They will be used by cpuid driver and powernow-k8 cpufreq driver.
> 
> With these changes powernow-k8 driver could run correctly on OpenVZ kernels
> with virtual cpus enabled (SCHED_VCPU).

This means openvz has multiple virtual CPU levels? One for cpuid/rdmsr and one
for the rest of the kernel? Both powernow-k8 and cpuid attempt to schedule
to the target CPU so they should already run there. But it is some other CPU,
but when they ask your _on_cpu() functions they suddenly get a "real" CPU?
Where is the difference between these levels of virtualness? 

That sounds quite fragile and will likely break often.  I just rejected a similar 
concept -- virtual nodes and "physical nodes" for similar reasons.

Also it has weird semantics. For example if you have multiple
virtual CPUs mapping to a single CPU then would the powernow-k8 driver
try to set the frequency multiple times on the same physical CPU? That might
go wrong actually because the CPU might not be happy to be poked again
while it is already in a frequency change. Also there is no locking
so in theory two vcpus might try to change frequency in parallel with
probably quite bad effects. 

I'm sure there are other scenarios with similar problems. e.g. what
happens with microcode updates etc.? 

Before adding any hacks like this I think your vcpu concept
needs to be discussed properly on l-k. For me it doesn't look like it is 
something good right now though.

-Andi
