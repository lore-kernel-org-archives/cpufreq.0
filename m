From: Bhavana Nagendra <bnagendr@redhat.com>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to
 changepstate at same time
Date: Thu, 13 Jul 2006 10:58:19 -0400
Message-ID: <44B65F8B.2020309@redhat.com>
References: <B3870AD84389624BAF87A3C7B831499302935A88@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <B3870AD84389624BAF87A3C7B831499302935A88@SAUSEXMB2.amd.com>
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
To: "shin, jacob" <jacob.shin@amd.com>, linux-kernel@vger.kernel.org
Cc: discuss@x86-64.org, cpufreq@lists.linux.org.uk, Andi Kleen <ak@suse.de>, Pavel Machek <pavel@suse.cz>

Here are some results without changing frequencies on a system whose 
BIOS does not support Power Now! on MP systems:

Basically the system booted up with "nohpet, nopmtimer"i.e. using TSC as 
the GTOD time source and system stayed idle for 13 hours.   There 
appears to be drift of 20 secs in the CPU 2 readings.    This TSC drift 
could worsen when
the system is active and doing GTOD operations and/or when system is up 
a lot longer. 

CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -108 cycles, maxerr 826 
cycles)
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -119 cycles, maxerr 845 
cycles)

*** CPUs go offline ***

*** back online ***

CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -117 cycles, maxerr 846 
cycles)
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -117 cycles, maxerr 845 
cycles)

shin, jacob wrote:

>On Thursday, July 13, 2006 9:32 AM Deguara, Joachim wrote:
>
>  
>
>>parallel sounds fun, but I don't get it.  Two machine or trying to go
>>online and offline at the same time?  Firestorming two busy parallel
>>while loops, one turning the core offline and the other online, did
>>not bring an oops so I guess this kernel is in the clear in that
>>regard. 
>>
>>I can't get it to crash again and I am afraid that it crashed under an
>>old devel kernel.  After another ~20 hour test with heavy freq changes
>>with the tscsync patch
>>    
>>
>
>There were several different issues w/ powernow + cpu hotplug in the
>past.  Good to hear that the latest kernel doesn't oops.. I believe 
>cpu hotplug is needed for suspend to work..
>
>
>  
>
