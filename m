From: Thomas Renninger <mail@renninger.de>
Subject: Re: Mobile Celeron with Speedstep ? - speedstep-centrino freezes
 machine
Date: Tue, 21 Sep 2004 17:55:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <41504EE9.6000403@renninger.de>
References: <414EDDF1.90506@renninger.de>
	<20040920170957.GC7952@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040920170957.GC7952@dominikbrodowski.de>
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

Dominik Brodowski wrote:
> On Mon, Sep 20, 2004 at 03:41:05PM +0200, Thomas Renninger wrote:
> 
>>I thought Celeron CPUs are not speedstep capable, seems as if I was 
>>wrong (ss flag indicates speedstep, right?)...
> 
> 
> no, ss flag indicates something else, enhanced speedstep is indicated by
> "est".
> 
> 
>>On this machine speedstep-centrino freezes machine (shouldn't it already 
>>go out at the model name check, or has this been changed?):
> 
> 
> It should reaturn -ENODEV in centrino_init().
> 
>         if (!cpu_has(cpu, X86_FEATURE_EST))
>                 return -ENODEV;
> 

Freezes before or inside this function.

This machine seems totally broken:

modprobe cpufreq_acpi_pdump
FATAL: Error inserting cpufreq_acpi_pdump 
(/lib/modules/2.6.8-7-default/kernel/drivers/acpi/cpufreq-acpi_pdump.ko): 
Input/output error
ibm9:/usr/src/linux/arch/i386/kernel/cpu/cpufreq #

-> Freeze.
Anyone an idea what exactly could cause the freeze, or how to analyse it?

If someone is interested, email me and you can have remote access on the 
machine.

The guys who own this machine have about ten of those (IBM R40e - Mobile 
Celeron). Tested on three machines and it was the same problem on each.


     Thomas
