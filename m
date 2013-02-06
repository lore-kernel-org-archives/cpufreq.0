From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/7] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Wed, 6 Feb 2013 08:13:11 +0530
Message-ID: <CAKohpo=TWxDgzwNy9+rJHBD7iHQ7DNCGy1j3ZyvCTZ6Xqwa1hg@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-4-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x=nXQrgwm2Jw88GjQe-fjpJrK+cjTWd-vK377UEBeXGu3w@mail.gmail.com>
	<5111BAA8.5050101@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <5111BAA8.5050101@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 6 February 2013 07:36, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> On 02/05/2013 05:47 PM, Viresh Kumar wrote:
>>
>> On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
>>>
>>> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>>>
>>> Scaling drivers that implement cpufreq_driver.setpolicy() have
>>> internal governors and may/will change the current operating frequency
>>> very frequently this will cause cpufreq_out_of_sync() to be called
>>> every time. Only call cpufreq_driver.get() for drivers that implement
>>> cpufreq_driver.target()
>>>
>>> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
>>> ---
>>>   drivers/cpufreq/cpufreq.c |    2 +-
>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>>> index 96bc302..d8daa4b 100644
>>> --- a/drivers/cpufreq/cpufreq.c
>>> +++ b/drivers/cpufreq/cpufreq.c
>>> @@ -1787,7 +1787,7 @@ int cpufreq_update_policy(unsigned int cpu)
>>>
>>>          /* BIOS might change freq behind our back
>>>            -> ask driver for current freq and notify governors about a
>>> change */
>>> -       if (cpufreq_driver->get) {
>>> +       if (cpufreq_driver->get && cpufreq_driver->target) {
>>>                  policy.cur = cpufreq_driver->get(cpu);
>>>                  if (!data->cur) {
>>>                          pr_debug("Driver did not initialize current
>>> freq");
>>
>>
>> I am really not liking copy-pasting my older comments here :(
>>
>> "This would mean policy->cur has a garbage value. I don't really know
>> how would other routine behave on this. Would it make sense to make
>> policy->cur zero atleast?
>> "
>>
> The driver implements get() and will return a valid value but the other
> components that track the current frequency will not have been notified
> about any change so there is nothing to be out of sync with.  There is no
> reason to call cpufreq_out_of_sync() where the driver being used implements
> an internal
> governor.

Not sure if we are discussing the same issue. What i am saying is, with your
patch we aren't calling following line:

>>>                  policy.cur = cpufreq_driver->get(cpu);

and policy was a local variable. Hence policy->cur is having a garbage value.
policy->cur is used at multiple places in cpufreq.c . Please check everywhere
if this garbage value doesn't break set_policy() type systems.
