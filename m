From: Andre Przywara <andre.przywara@amd.com>
Subject: Re: cpufreq --hwfreq / --freq and overclocking
Date: Mon, 3 Sep 2012 13:39:21 +0200
Message-ID: <504496E9.7070109@amd.com>
References: <201208071309.27662@bender.stalag13.ici>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201208071309.27662@bender.stalag13.ici>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mathieu Roy <yeupou@gnu.org>
Cc: cpufreq@vger.kernel.org

On 08/07/2012 01:09 PM, Mathieu Roy wrote:
> Hello,
>
> Is there any way to get the actual real hardware CPU frequency in the case of an overclocked CPU?
>
> Running at max, I get
>    # cpufreq-info --hwfreq
> 3000000
>    # cpufreq-info --freq
> 3000000

Both command lines eventually query the frequency from an ACPI table. 
This table will be filled at boot time by the BIOS.
Now it depends on how you overclock your system. If you use the BIOS, it 
_could_ adapt the ACPI table and enter the actual values here, but 
obviously it does not do this.
If you do this outside of the BIOS, ACPI is usually not altered, so you 
are out of luck then.

> However, dmidecode shows, according to BIOS settings:
> 	Version: AMD Athlon(tm) II X4 640 Processor
> 	External Clock: 230 MHz
> 	Max Speed: 3700 MHz
> 	Current Speed: 3450 MHz

So this gives a hint that the BIOS knows about the overclocked system. I 
guess that it just does not report this into the _PSS object, probably 
because the official recommendation in the AMD manuals is to use 200 MHz 
as the base frequency.

> Which frequency value is the correct one? I assume cpufreq does not
> override the BIOS overclocking settings (external clock at 230 instead
> of 200, hence the CPU at 3450 instead of 3000), so is there any way for
> cpufreq to adjust and report correct values?

cpufreq just reports the _PSS ACPI content and does not alter or 
override any settings. I guess it is out of scope for the rather generic 
cpufreq subsystem to query any actual overclocked system bus frequencies 
and report those values instead.

However you could use more hardware dedicated tools to read the data 
directly from the system and compute the actual frequencies. As I am not 
an overclocker, I don't know of any Linux tools who do this, but maybe 
someone from the list does.

Regards,
Andre.


-- 
Andre Przywara
AMD-Operating System Research Center (OSRC), Dresden, Germany

