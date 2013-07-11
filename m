From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [REGRESSION] Commit a66b2e50 "Preserve sysfs files across suspend/resume"
 causes a regression in intel_pstate
Date: Thu, 11 Jul 2013 12:52:24 +0530
Message-ID: <51DE5D30.4080905@linux.vnet.ibm.com>
References: <51DD8890.8040008@gmail.com>	<51DDDDBB.6070105@linux.vnet.ibm.com> <CAOh2x=mK3q339Mnc26VgANTUF1M2zL9pjCsLFbMGbyMWkUmrAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=mK3q339Mnc26VgANTUF1M2zL9pjCsLFbMGbyMWkUmrAQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, cpufreq <cpufreq@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, durgadoss.r@intel.com, "Jarzmik, Robert" <robert.jarzmik@intel.com>, tianyu.lan@intel.com

On 07/11/2013 12:39 PM, Viresh Kumar wrote:
> On Thu, Jul 11, 2013 at 3:48 AM, Srivatsa S. Bhat
> <srivatsa.bhat@linux.vnet.ibm.com> wrote:
> 
> I haven't followed the minute details of this patch and will
> do that once you post it after testing it a bit.
> 
> BTW, I found a funny bug in there :)
> 
>>                 kfree(data);
>> +
>> +               if (remove_sysfs) {
>> +                       lock_policy_rwsem_read(cpu);
>> +                       kobj = &data->kobj;
>> +                       cmp = &data->kobj_unregister;
>> +                       unlock_policy_rwsem_read(cpu);
>> +                       kobject_put(kobj);
> 
> You just freed data and still want to use it later :)
> 

Yeah, Tianyu pointed that out to me in the other thread :)

http://marc.info/?l=linux-pm&m=137352402807997&w=2

... and I almost gave up trying to fix this mess, as I mentioned
there :-(

If you have any smart solutions in mind to get this right, do
share your thoughts! :)

Regards,
Srivatsa S. Bhat

