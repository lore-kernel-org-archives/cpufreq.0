From: Thomas Renninger <mail@renninger.de>
Subject: Re: Mobile Celeron with Speedstep ? - speedstep-centrino
	freezesmachine
Date: Tue, 21 Sep 2004 21:44:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <415084A5.7060104@renninger.de>
References: <88056F38E9E48644A0F562A38C64FB6002EDBFA5@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002EDBFA5@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

Pallipadi, Venkatesh wrote:
> This may be due to C-states and probably unrelated to frequency changes.
> Check out - http://bugme.osdl.org/show_bug.cgi?id=3219 
> 
> Modprobe of cpufreq driver is probably adding acpi/processor.ko.

Yes, thanks. Patch (disabling C2) works:
    *C1:                  promotion[--] demotion[--] latency[000] 
usage[00183115]
     C2:                  <not supported>
     C3:                  promotion[--] demotion[--] latency[250] 
usage[00000000]


> 
> Thanks,
> Venki
> 
> 
>>-----Original Message-----
>>From: cpufreq-bounces@www.linux.org.uk 
>>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Dominik 
>>Brodowski
>>Sent: Tuesday, September 21, 2004 9:34 AM
>>To: Thomas Renninger
>>Cc: cpufreq@www.linux.org.uk
>>Subject: Re: Mobile Celeron with Speedstep ? - 
>>speedstep-centrino freezesmachine
>>
>>On Tue, Sep 21, 2004 at 05:55:21PM +0200, Thomas Renninger wrote:
>>
>>>modprobe cpufreq_acpi_pdump
>>>FATAL: Error inserting cpufreq_acpi_pdump 
>>>
>>
>>(/lib/modules/2.6.8-7-default/kernel/drivers/acpi/cpufreq-acpi_
>>pdump.ko): 
>>
>>>Input/output error
>>>ibm9:/usr/src/linux/arch/i386/kernel/cpu/cpufreq #
>>>
>>>-> Freeze.
>>>Anyone an idea what exactly could cause the freeze, or how 
>>
>>to analyse it?
>>
>>Do I understand it correctly that the system freezes _after_ modprobing
>>cpufreq_acpi_pdump fails??? The -EIO result itself isn't 
>>strange, it means
>>the call to acpi_processor_register_performance() failed which 
>>happens on
>>several systems.

I made cpufreq_acpi_pdump depending on processor module by mistake :'( , 
sorry.

    Thomas
