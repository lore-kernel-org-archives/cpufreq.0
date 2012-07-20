From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] cpufreq: Fix sysfs deadlock with concurrent hotplug/frequency
 switch
Date: Fri, 20 Jul 2012 10:34:04 -0700
Message-ID: <5009968C.8030303@codeaurora.org>
References: <1342749433-17676-1-git-send-email-sboyd@codeaurora.org> <201207201205.36635.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201207201205.36635.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On 07/20/12 03:05, Rafael J. Wysocki wrote:
>
> The following part of your changelog has confused Patchwork.  I guess it
> will also confuse other tools, so care to describe what to do instead?

Sure. I thought that might happen but I put a space in front in hopes it
wouldn't cause troubles.

>
>>  diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>>  index a290771..62af12d 100644
>>  --- a/drivers/cpufreq/cpufreq.c
>>  +++ b/drivers/cpufreq/cpufreq.c
>>  @@ -675,6 +675,7 @@ static ssize_t store(struct kobject *kobj
>>
>>          unlock_policy_rwsem_write(policy->cpu);
>>   fail:
>>  +       msleep(10000);
>>          cpufreq_cpu_put_sysfs(policy);
>>   no_policy:
>>          return ret;
>>
>> and then write scaling_setspeed in one task and offline the cpu
>> in another. The first task will hang and be detected by the hung
>> task detector.
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
>>
>> Before you ask, I've seen the comment above cpufreq_add_dev() about
>> concurrent hotplug/cpufreq.
>>
>>  drivers/cpufreq/cpufreq.c | 35 +++++++++++++++++++++++++++--------
>>  1 file changed, 27 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 7f2f149..a290771 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -138,7 +138,7 @@ void disable_cpufreq(void)
>>  static LIST_HEAD(cpufreq_governor_list);
>>  static DEFINE_MUTEX(cpufreq_governor_mutex);
>>  
>> -struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu)
>> +static struct cpufreq_policy *__cpufreq_cpu_get(unsigned int cpu, int sysfs)
> I'd prefer the sysfs arg to be a bool.

Sure. V2 coming right up.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

