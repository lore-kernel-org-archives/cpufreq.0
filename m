From: Diwaker Gupta <dgupta@cs.ucsd.edu>
Subject: Re: cpufreq default governor?
Date: Mon, 19 Jan 2004 03:44:55 -0800
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <400BC337.6050002@cs.ucsd.edu>
References: <400B846B.6000202@cs.ucsd.edu>
	<20040119094405.GA4836@dominikbrodowski.de>
Reply-To: diwaker@ucsd.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040119094405.GA4836@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

Hi,

Sorry, really stupid of me. It seems cpudynd or acpid are changing the 
default governor! I booted with both services off and the governor 
showed up okay.

BTW, do people have any opinion on which frequency daemon is better -- 
cpudynd or cpufreqd?

Diwaker

Dominik Brodowski wrote:
> Hi,
> 
> I'm sorry but I cannot reproduce the behaviour you see. Do you run any
> userspace cpufreq tool like cpufreqd? Can you compile the other governors as
> modules, and see what happens then, please? Thanks,
> 	Dominik
> 
> On Sun, Jan 18, 2004 at 11:16:59PM -0800, Diwaker Gupta wrote:
> 
>>Hi,
>>
>>I'm running 2.6.1 vanilla kernel from kernel.org with no patches. I want 
>>to set the default cpufreq governor to userspace. Here is the relevant 
>>portion of my .config:
>>
>>====
>>CONFIG_CPU_FREQ=y
>>CONFIG_CPU_FREQ_PROC_INTF=y
>># CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>>CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
>>CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
>>CONFIG_CPU_FREQ_GOV_POWERSAVE=y
>>CONFIG_CPU_FREQ_GOV_USERSPACE=y
>>CONFIG_CPU_FREQ_24_API=y
>>CONFIG_CPU_FREQ_TABLE=y
>>CONFIG_X86_ACPI_CPUFREQ=y
>>CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
>>====
>>
>>Everything compiles fine, but when I boot into the new kernel, the 
>>default governor is still set to performance:
>>
>><diwaker@diwaker>$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
>>performance
>>
>>But the userspace governor is indeed available:
>><diwaker@diwaker>$ cat 
>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
>>powersave userspace performance
>>
>>Any suggestions?
>>TIA,
>>Diwaker
>>-- 
>>Diwaker Gupta
>>Graduate Student, Computer Sc. and Engg.
>>University of California, San Diego
>><http://www.cse.ucsd.edu/users/dgupta>
>>
>>_______________________________________________
>>Cpufreq mailing list
>>Cpufreq@www.linux.org.uk
>>http://www.linux.org.uk/mailman/listinfo/cpufre
> 
> q

-- 
Diwaker Gupta
Graduate Student, Computer Sc. and Engg.
University of California, San Diego
<http://www.cse.ucsd.edu/users/dgupta>
