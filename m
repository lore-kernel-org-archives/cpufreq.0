From: Scott Lampert <scott@lampert.org>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change
 pstate at same time
Date: Fri, 07 Jul 2006 11:14:57 -0700
Message-ID: <44AEA4A1.3050601@lampert.org>
References: <Pine.LNX.4.64.0607061519040.9066@solonow.amd.com>
	<p73fyhdpqe1.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <p73fyhdpqe1.fsf@verdi.suse.de>
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
Cc: discuss@x86-64.org, cpufreq@lists.linux.org.uk

As an aside, is this what the "AMD Dual-Core Optimizer" driver located at:

http://www.amd.com/us-en/Processors/TechnicalResources/0,,30_182_871_13118,00.html

does for that other OS?  Does this solution work there?
	-Scott

Andi Kleen wrote:
> "Mark Langsdorf" <mark.langsdorf@amd.com> writes:
> 
> [cc'ing back to discuss and cpufreq]
> 
>> The current generation of Opteron processors do not provide a frequency 
>> independent TSC.  This causes wild gettimeofday skew on systems that 
>> enable cpufreq while using TSC as a gtod source.
>>
>> This patch provides a workaround by changing all processors to the same 
>> frequency at the same time, so that the TSC on each processor never 
>> increments at a different rate than the TSC on another processor.
>>
>> the "powernow-k8.tscsync=1" options enables simeltameous transitions.  
>> Other options are necessary to force the use of TSC as a gtod source.
>>
>> This patch should apply cleanly to the 2.6.18-rc1 kernel.
> 
> Your patch seems to be ^M damaged.
> 
> I'm still dubious if the result is really correct if the hardware
> wasn't designed to guarantee synchronous TSC operation.
> 
> Can you do the following test please? 
> 
> - Set this option
> - Let the system run for let's say a day or two with some freq transitions
> and varying loads
> [Better would be to let two systems run in this way to compare]
> - Then hotunplug all the CPUs >0 with
> for i in /sys/devices/system/cpu/cpu*/online ; do echo 0 > $i ; done
> - Wait a bit 
> - Restart them again with 
> for i in /sys/devices/system/cpu/cpu*/online ; do echo 1 > $i ; done
> 
> The kernel should now print the results of the TSC resync for the
> replugged CPUs with output like this
> 
> CPU N: Syncing TSC to CPU 0.
> CPU N: synchronized TSC with CPU 0 (last diff XXX cycles, maxerr YYY cycles)
> 
> How do these numbers look like, also compared to the original boot
> output?
> 
> If the cycles diverge more between the different CPUs it would be a bad sign. 
> It would mean that the error would add up over longer runtime
> and timing would get more and more unstable.
> 
> -Andi
> 
