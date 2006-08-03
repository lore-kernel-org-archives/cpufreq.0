From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: [PATCH 6/8] acpi-cpufreq: use cpu_core_map on multicore
	processors
Date: Fri, 04 Aug 2006 01:08:12 +0400
Message-ID: <44D265BC.3070009@linux.intel.com>
References: <EB12A50964762B4D8111D55B764A8454566EB7@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454566EB7@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

Pallipadi, Venkatesh wrote:
>  
> 
>> -----Original Message-----
>> From: cpufreq-bounces@lists.linux.org.uk 
>> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of 
>> Alexey Starikovskiy
>> Sent: Monday, July 31, 2006 11:54 AM
>> To: Brown, Len; Dave Jones
>> Cc: cpufreq@lists.linux.org.uk
>> Subject: [PATCH 6/8] acpi-cpufreq: use cpu_core_map on 
>> multicore processors
>>
>> acpi-cpufreq.c |   11 ++++++++++-
>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> on some new systems "shared_cpu_map" from ACPI is wrong, so   
>> "cpu_core_map" structure is used to define right "policy->cpus" group.
>>
>> Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
>> Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
>> Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>
>>
>> Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>> ===================================================================
>> --- 
>> linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	
>> 2006-07-17 17:09:27.000000000 +0000
>> +++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	
>> 2006-07-17 17:11:07.000000000 +0000
>> @@ -542,7 +542,16 @@
>> 		}
>> 	}
>>
>> -	policy->cpus = data->acpi_data->shared_cpu_map;
>> +/*	policy->cpus = data->acpi_data->shared_cpu_map; */
>> +/* NOTE TODO:
>> +	Actually we must use "shared_cpu_map" from acpi data to 
>> define policy->cpus,
>> +	but on some new systems "shared_cpu_map" is wrong. So 
>> we use "cpu_core_map"
>> +	sructure temporarily. Should be return back. */
>> +#ifdef CONFIG_SMP
>> +	policy->cpus = cpu_core_map[cpu];
>> +#else
>> +	policy->cpus = cpumask_of_cpu(cpu);
>> +#endif /* CONFIG_SMP */
>> 	for_each_cpu_mask(i, policy->cpus) {
>> 		drv_data[i] = data;
>> 	}
>>
> 
> I don't think this should be done universally. We should try to limit it
> to only for the platforms that has this issue, using OEMID or some such
> thing. In any case, this patch should not be part of this patch set.
> Should be a standalone bugfix-workaround patch with more details about
> the bug.
> 
> Thanks,
> Venki
May be it belongs to processor_perflib, place there we check for _PSD?
