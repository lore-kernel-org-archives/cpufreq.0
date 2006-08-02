From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: [PATCH 4/8] acpi-cpufreq: remove ACPI from speedstep-centrino
 driver
Date: Wed, 02 Aug 2006 22:33:39 +0400
Message-ID: <44D0F003.6030407@linux.intel.com>
References: <44CE5015.2090200@linux.intel.com> <44D0D53D.3010108@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44D0D53D.3010108@goop.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

Jeremy Fitzhardinge wrote:
> Alexey Starikovskiy wrote:
>> speedstep-centrino.c |  270
>> +++++++--------------------------------------------
>> 1 file changed, 40 insertions(+), 230 deletions(-)
>>
>> remove ACPI from speedstep-centrino driver
>>
>> Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
>> Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
>> Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>
>>
>> Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
>> ===================================================================
>> ---
>> linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c   
>> 2006-07-11 20:13:44.000000000 +0000
>> +++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c   
>> 2006-07-13 18:54:07.000000000 +0000
>> @@ -2,36 +2,36 @@
>>  * cpufreq driver for Enhanced SpeedStep, as found in Intel's Pentium
>>  * M (part of the Centrino chipset).
>>  *
>> - * Since the original Pentium M, most new Intel CPUs support Enhanced
>> - * SpeedStep.
>> - *
>>  * Despite the "SpeedStep" in the name, this is almost entirely unlike
>>  * traditional SpeedStep.
>>  *
>>  * Modelled on speedstep.c
>>  *
>>  * Copyright (C) 2003 Jeremy Fitzhardinge <jeremy@goop.org>
>> + *
>> + * WARNING WARNING WARNING
>> + *
>> + * This driver manipulates the PERF_CTL MSR, which is only somewhat
>> + * documented.  While it seems to work on my laptop, it has not been
>> + * tested anywhere else, and it may not work for you, do strange
>> + * things or simply crash.
>>  */
>> [...]
>> #define PFX        "speedstep-centrino: "
>> -#define MAINTAINER    "cpufreq@lists.linux.org.uk"
>> +#define MAINTAINER    "Jeremy Fitzhardinge <jeremy@goop.org>"
> 
> You're reverting a change I made recently.  Did you mean to?
> 
>    J
No. Intention was to remove ACPI only. Will post proper patch shortly.
Alex.
