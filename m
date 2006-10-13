From: Joan Moreau <joan.moreau@m4x.org>
Subject: Re: Cpufreq on kernel 2.6.18
Date: Fri, 13 Oct 2006 17:53:10 +0300
Message-ID: <452FA856.30306@m4x.org>
References: <EB12A50964762B4D8111D55B764A8454B2E59D@scsmsx413.amr.corp.intel.com>
	<20061008193637.7cf052c7.morpheus@ferrara.linux.it>
	<45295EB7.5070505@m4x.org>
	<Pine.LNX.4.62.0610091709560.26129@cadalboia.ferrara.linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.62.0610091709560.26129@cadalboia.ferrara.linux.it>
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
To: Luca Barion <morpheus@cadalboia.ferrara.linux.it>
Cc: cpufreq@lists.linux.org.uk


yes, the governor process works, but the frequency stays unchanged , 
whatever is the governor :-(

Is anybody having the same problem ?

Thanks

Joan

Luca Barion wrote:
> I can tell you that on my centrino with the module cpufreq_centrino 
> cpufreq works (at least I was able to set powersave governor, the 
> orther I didn't try yet).
> You could try to build any feature regarding cpufreq as module, and 
> loading and unloading each: I found that some modules conflict with 
> other preventing from working correctly (also on a desktop p4 dualcore).
>     Luca.
>
> On Sun, 8 Oct 2006, Joan Moreau wrote:
>
>> Luca,
>>
>> I have exactly the same problem on my pentium M 2Ghz.
>>
>> Only "cpufreq_centrino"  works under linux 2.6.18 (i..e /sys has 
>> relevant info) but cpufredq does not work anymore (frequancy not 
>> changeable)
>>
>> Has anybody found any fixes ?
>>
>> Thanks
>>
>> Joan
>>
>> Luca wrote:
>>> On Fri, 6 Oct 2006 16:08:22 -0700
>>> "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> wrote:
>>>
>>>
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: cpufreq-bounces@lists.linux.org.uk 
>>>>> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Luca
>>>>> Sent: Friday, October 06, 2006 1:01 PM
>>>>> To: cpufreq@lists.linux.org.uk
>>>>> Subject: Cpufreq on kernel 2.6.18
>>>>>
>>>>> Hello,
>>>>> I just updated the kernel from 2.6.15.2 to 2.6.18 and the 
>>>>> frequency scaling of my Centrinlo Laptop stopped working (keeping 
>>>>> the same configuration).
>>>>> The dir /sys/devices/system/cpu/cpu0/ is empty and I don't know 
>>>>> which other tests I could make.
>>>>> I also tried to move CONFIG_X86_ACPI_CPUFREQ from builtin to 
>>>>> module: loading the module does not give any information nor any 
>>>>> error.
>>>>> I need 2.6.18 for other drivers, so it would be really nice if I 
>>>>> could solve this problem that seems to be the only driver that's 
>>>>> not working properly (and my battery would be much happier :) )
>>>>> If you need more informations just tell me.
>>>>>
>>>>>
>>>> Can you enable CPU_FREQ_DEBUG in your config and pass 
>>>> "cpufreq.debug=3"
>>>> in kernel parameter and send in the dmesg log.
>>>>
>>>
>>> I found something, and maybe I have to ask excuse, because now it's 
>>> working..
>>> Anyway something has changed and that's the reason that fooled me: 
>>> on my old logs, with the old kernel I had:
>>>  acpi-cpufreq: CPU0 - ACPI performance management activated.
>>> So I focused my attention on the module acpi-cpufreq. Inserting it, 
>>> even with debug activated (cpufreq.debug=3 forgot to pass it at 
>>> boot, but now seems not so important...) doesn't tell anything at 
>>> all (and doesn't work).
>>> I was playing with other modules, and I found that loading the 
>>> module speedstep-centrino enables cpufreq (even if on kernel log 
>>> doesn't print anything).
>>> So something has changed in the software support for my hardware. 
>>> I'm sorry for not having understood earlyer. Since I'm writing here, 
>>> can I kindly ask you a short explanation on this difference between 
>>> two different kernels, on the same hardware.
>>>
>>> Thanks for the fast answer,
>>>                 Luca.
>>>
>>>
>>> PS: thanks for the work on cpufreq: with the moderm pcs with cpu 
>>> pull to the limit I think it's really useful to be able to force 
>>> lower frequency, when you don't need all the computeing power.
>>>
>>>
>>>> Thanks,
>>>> Venki
>>>>
>>>
>>>
>>>
>
