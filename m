From: Carl Thompson <cet@carlthompson.net>
Subject: RE: DBS enabling on EM64T machine with cpufreqd
Date: Sat,  4 Jun 2005 18:43:58 -0700
Message-ID: <20050604184358.6gurcg7h8kkgowog@carlthompson.net>
References: <88056F38E9E48644A0F562A38C64FB6004D356D0@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6004D356D0@scsmsx403.amr.corp.intel.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk


If you're having trouble with cpufreqd on SMP systems, try CPUSpeed. It 
works perfectly.

     http://carlthompson.net/software/cpuspeed

Carl Thompson


----- Message from venkatesh.pallipadi@intel.com ---------
    Date: Thu, 26 May 2005 06:15:07 -0700
    From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Reply-To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: DBS enabling on EM64T machine with cpufreqd
      To: "Lin, Zihui" <zihui.lin@intel.com>, cpufreq@lists.linux.org.uk


>
> For Nocona I would suggest using the in kernel ondemand governor. More
> details here
> http://www.intel.com/cd/ids/developer/asmo-na/eng/dc/xeon/reference/1959
> 10.htm
>
> And newer versions of the userspace governors should be able to handle
> SMP processsors. Earlier versions didn't. Not sure which version of
> cpufreqd you are using.
>
> Thanks,
> Venki
>
>> -----Original Message-----
>> From: cpufreq-bounces@lists.linux.org.uk
>> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Lin, Zihui
>> Sent: Thursday, May 26, 2005 3:04 AM
>> To: cpufreq@lists.linux.org.uk
>> Subject: DBS enabling on EM64T machine with cpufreqd
>>
>> Hi there,
>>
>>
>>
>> I'm new to cpufreqd. Sorry for my wooden English.
>>
>> I found that cpufreqd can be used in desktop.
>>
>> Has anybody ever tried cpufreqd in Nocona System?
>>
>>
>>
>> My Nocona Server has the speedstep functionality,
>>
>> and can be throttled by acpi-cpufreq.
>>
>> But it doesn't have the battery like laptops.
>>
>> I've tried to set the CPU frequency manually, and it works.
>>
>> Is it possible to use cpufreqd in it?
>>
>> Any help is appreciated! Thanks in advance!
>>
>>
>>
>> Best regards,
>>
>> Zihui
>>
>>
>>
>> P.S. Here is some output:
>>
>>
>>
>> [root@ae64 cpufreq]# cat scaling_governor
>>
>> performance
>>
>> [root@ae64 cpufreq]# cat scaling_available_frequencies
>>
>> 3400000 3400000 3400000 3400000 3400000 3400000 3400000 3400000 3400000
>> 2800000
>>
>> [root@ae64 cpufreq]# cat scaling_available_governors
>>
>> powersave userspace performance
>>
>> [root@ae64 cpufreq]# cat /etc/cpufreqd.conf
>>
>> [General]
>>
>> pidfile=/var/run/cpufreqd.pid
>>
>> poll_interval=2
>>
>> pm_type=acpi #(acpi, apm or pmu)
>>
>> verbosity=7 #(if you want a minimal logging set to 5)
>>
>> [Profile]
>>
>> name=hi_boost
>>
>> minfreq=95%
>>
>> maxfreq=100%
>>
>> policy=performance
>>
>> [Profile]
>>
>> name=lo_power
>>
>> minfreq=0%
>>
>> maxfreq=95%
>>
>> policy=powersave
>>
>> [Rule]
>>
>> name=AC_on
>>
>> ac=on                   # (on/off)
>>
>> cpu_interval=0-40
>>
>> profile=lo_power
>>
>> [Rule]
>>
>> name=compiling
>>
>> ac=on                   # (on/off)
>>
>> programs=gcc,make
>>
>> cpu_interval=80-100
>>
>>
>>
>> profile=lo_power [root@ae64 cpufreq]# cpufreqd -D
>>
>> libsys_init() - no batteries found, not a laptop?
>>
>>
>>
>> _______________________________________________
>> Cpufreq mailing list
>> Cpufreq@lists.linux.org.uk
>> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>>
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
>


----- End message from venkatesh.pallipadi@intel.com -----
