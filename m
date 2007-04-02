From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/3] Introduce cpuid_on_cpu() and cpuid_eax_on_cpu()
Date: Mon, 02 Apr 2007 09:20:16 -0700
Message-ID: <46112D40.20508@zytor.com>
References: <20070402113831.GA6785@localhost.sw.ru>
	<200704021410.29623.ak@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200704021410.29623.ak@suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <ak@suse.de>
Cc: akpm@osdl.org, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@sw.ru>, devel@openvz.org

Andi Kleen wrote:
> On Monday 02 April 2007 13:38, Alexey Dobriyan wrote:
>> They will be used by cpuid driver and powernow-k8 cpufreq driver.
>>
>> With these changes powernow-k8 driver could run correctly on OpenVZ kernels
>> with virtual cpus enabled (SCHED_VCPU).
> 
> This means openvz has multiple virtual CPU levels? One for cpuid/rdmsr and one
> for the rest of the kernel? Both powernow-k8 and cpuid attempt to schedule
> to the target CPU so they should already run there. But it is some other CPU,
> but when they ask your _on_cpu() functions they suddenly get a "real" CPU?
> Where is the difference between these levels of virtualness? 
> 

The CPUID and MSR drivers do not schedule to the target CPU; instead, on 
hardware, they rely on IPI'ing the target processor if it is not the one 
that's currently running.

There were a lot of discussion back when about which was the better 
solution.  Alan Cox, in particular, really preferred the interrupt 
solution as being less likely to cause implicit deadlock.

I do want to add that it's been on my list for some time -- in fact, I 
keep implementing it half-way and then having other things to do -- to 
add MSR and CPUID ioctls() that allow the full register file to be set 
and read back, in order to support architecturally broken MSR and CPUID 
levels.

	-hpa
