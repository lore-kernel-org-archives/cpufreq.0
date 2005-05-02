From: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Mon, 02 May 2005 10:30:44 -0400
Message-ID: <42763994.5080504@alumni.clemson.edu>
References: <88056F38E9E48644A0F562A38C64FB60049EEBC2@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60049EEBC2@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

Thank you very much for your reply.  Barring a thermal emergency, 
wouldn't CPU demand automatically be high if temperature was also high?  
The basic intent of my code was to specifically target prcesses which 
were non-interactive for performance degradation rather that the whole 
system.  The intent being to improve interactive performace while 
reducing temperature.  I'm not clear on how scripting ondemand achieves 
this goal?

Mark Bidewell

Pallipadi, Venkatesh wrote:

> 
>
>  
>
>>-----Original Message-----
>>From: cpufreq-bounces@lists.linux.org.uk 
>>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Mark Bidewell
>>Sent: Monday, May 02, 2005 5:51 AM
>>To: Bruno Ducrot
>>Cc: cpufreq@lists.linux.org.uk
>>Subject: Re: Possible CPUFreq governor
>>
>>I have been examining the structure and design of the ondemand govenor 
>>further.  Would it be accurate to characterize your concern as 
>>basically 
>>that under heavy process load, the p-state switching latency becomes 
>>longer than the timeslices and thus could dominate the CPU?  
>>Or is there 
>>an issue with processor damage?
>>
>>    
>>
>
>P-state switching latency will be same at all times, irrespective
>of processor load. IIUC, the issue here is adding the knowledge of CPU 
>temperature to the CPU frequency governor.
>
>For that, As Bruno potins out, one can have a shell script/program on 
>top of ondemand governor, that monitors the temperature in /proc/...
>And changes ondemand governor's /sys/..../cpufreq/scaling_max_freq
>
>Thanks,
>Venki
>
>  
>
