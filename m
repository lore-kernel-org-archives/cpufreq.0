From: Ilari Stenroth <ilari.stenroth@gmail.com>
Subject: Re: [PATCH] intel_pstate: Add Haswell CPU models
Date: Sat, 17 Aug 2013 22:43:24 +0300
Message-ID: <520FD25C.3050502@gmail.com>
References: <51CD8087.7030303@spicious.com> <51DC240C.3090404@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51DC240C.3090404@intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

On 9.7.2013 17.54, Dirk Brandewie wrote:
> On 06/28/2013 05:24 AM, Nell Hardcastle wrote:
>> Enable the intel_pstate driver for Haswell CPUs and one Ivy Bridge
>> model not already included (0x3E). I've been testing this change on
>> the Core i5-4200u (model 0x45) and I referenced the list of models in
>> tools/power/x86/turbostat/turbostat.c:has_nehalem_turbo_ratio_limit to
>> determine the others.
>>
>> Fixes https://bugzilla.kernel.org/show_bug.cgi?id=60211
>>
>> Signed-off-by: Nell Hardcastle <nell@spicious.com>
>> ---
>>   drivers/cpufreq/intel_pstate.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/cpufreq/intel_pstate.c
>> b/drivers/cpufreq/intel_pstate.c
>> index 07f2840..dbd1032 100644
>> --- a/drivers/cpufreq/intel_pstate.c
>> +++ b/drivers/cpufreq/intel_pstate.c
>> @@ -522,6 +522,11 @@ static const struct x86_cpu_id
>> intel_pstate_cpu_ids[] = {
>>       ICPU(0x2a, default_policy),
>>       ICPU(0x2d, default_policy),
>>       ICPU(0x3a, default_policy),
>> +    ICPU(0x3c, default_policy),
>> +    ICPU(0x3e, default_policy),
>> +    ICPU(0x3f, default_policy),
>> +    ICPU(0x45, default_policy),
>> +    ICPU(0x46, default_policy),
> 
> Nak for now.
> 
> We have not completed our testing on these CPUs. I would like to
> get my testing done before I start seeing issues from the field come
> in.
> 
> If this patch were to hangout in testing for a while it would not
> hurt my feelings there it could only hurt those that knew what
> they were getting into :-)
> 

Hi,

I want to let you know that I've tested intel_pstate with Xeon
E3-1265Lv3 (model 0x3c) successfully. For this CPU model the patch seems
to be fine.

Turbo mode works as intended. Core frequencies scale according to number
of active cores.

Tested-by: Ilari Stenroth <ilari.stenroth@gmail.com>

Regards,
Ilari Stenroth


