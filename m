From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: [PATCH 8/8] acpi-cpufreq: skip duplicate frequencies
Date: Fri, 04 Aug 2006 12:24:31 +0400
Message-ID: <44D3043F.3060504@linux.intel.com>
References: <EB12A50964762B4D8111D55B764A8454566EFF@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454566EFF@scsmsx413.amr.corp.intel.com>
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
>>> I guess we should compact the whole table rather than adding INVALID
>>> entries. With INVALID entries, we may end up running some redundant
>>> loops table_verify table_target functions later.
>>>
>>> Thanks,
>>> Venki
>>>  
>> there can be inconsistency then BIOS issues notifies, if we 
>> change number of P-states.
>> Keeping them INVALID is safer.
>>
> 
> But, BIOS notification only checks the perf->states structure and does
> not depend on frequency table. Right?
> Also, if notification depends on freq table, we will still have a issue
> with this patch and number_of_P-states_change notification.
> Say we have - 3 GHz, 3 GHz, 3 GHz, 2 GHz as P0, P1, P2, and P3 reported
> by BIOS. And it says P2 as the highest frequency through notify. This
> patch would have made P1 and P2 frequency as INVALID. 
BIOS knows that there are 4 P-states, 3 of them being equal (it populated these values after all).
So if it says we need to set limit to upper 2 equal states -- it is BIOS bug (feature).
