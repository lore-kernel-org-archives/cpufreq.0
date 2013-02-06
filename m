From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 5/7] cpufreq: balance out cpufreq_cpu_{get,put} for scaling
 drivers using setpolicy
Date: Wed, 06 Feb 2013 08:11:03 -0800
Message-ID: <51128097.9000801@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com> <1360088646-19104-6-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=kJPFyhkG3y_q=a5ciG1HRAn-JkoVYy9OZ9POA+-isbCQ@mail.gmail.com> <5111BB2E.2090505@gmail.com> <CAKohpokoG16S8uft0nSFSoejipS8X=zhhg6goJs4mBSt3tAwxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=LfAhOy/+roX6ZiDHH/mvhjMbWEvyYAMlR+IuZVrGwlo=;
        b=L6Snpt179tnjIGC6yD7+idWp8Rpxvft887oCw0PIwTzR5CAlUmCLEP0AhXJhWHPAn4
         O+/aHnPut8q43dWa1XnRnrQS9cqeBikF8w83dWMW10q+T5cZfYTyKQSyhKihRzLjErsv
         oEdkC/M1+tXc0QxckQer8/R7eTNAjG2tH3CcBFQ/PzbM3MSsGN5hXR9cgSQ74/LzxaWH
         SlSrD2332lj/hg6bJWOZiyFZhJHX510YF5xpAp2Wk7VaSqzkZjIaA3Dr/icPG+vf3C3z
         LaPyR4XvJcsl9gpmwwZOWVE+4fVkJW0o0oFVBu8OY99M0tSAVfNX+bwV7wlLF5itL+me
         BGMg==
In-Reply-To: <CAKohpokoG16S8uft0nSFSoejipS8X=zhhg6goJs4mBSt3tAwxw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/05/2013 06:45 PM, Viresh Kumar wrote:
> On 6 February 2013 07:38, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
>> On 02/05/2013 05:58 PM, Viresh Kumar wrote:
>>>
>>> On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
>>>>
>>>> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>>>>
>>>> There is an additional reference added to the driver in
>>>> cpufreq_add_dev()  that is removed in__cpufreq_governor() if the
>>>>
>>>> driver implements target().  Remove the last reference when the
>>>> driver implements setpolicy()
>>>>
>>>> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
>>>>
>>>> ---
>>>>    drivers/cpufreq/cpufreq.c |    3 +++
>>>>    1 files changed, 3 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>>>> index 622e282..d17477b 100644
>>>> --- a/drivers/cpufreq/cpufreq.c
>>>> +++ b/drivers/cpufreq/cpufreq.c
>>>> @@ -1049,6 +1049,9 @@ static int __cpufreq_remove_dev(struct device *dev,
>>>> struct subsys_interface *sif
>>>>
>>>>           if (cpufreq_driver->target)
>>>>                   __cpufreq_governor(data, CPUFREQ_GOV_STOP);
>>>>
>>>> +       if (cpufreq_driver->setpolicy)
>>>> +               cpufreq_cpu_put(data);
>>>
>>>
>>> I don't understand this patch at all.. I grepped both cpufreq_cpu_get() &
>>> put()
>>> in bleeding-edge and found everything to be correct.
>>>
>>> Can you please point me to the exact line numbers ?
>>>
>>
>> Line 878 in cpufreq_add_dev()
>
> Following is line 878:
>
> 	for_each_online_cpu(sibling) {
> 		struct cpufreq_policy *cp = per_cpu(cpufreq_cpu_data, sibling);
> 		if (cp && cpumask_test_cpu(cpu, cp->related_cpus))
> 			return cpufreq_add_policy_cpu(cpu, sibling, dev);
> 	}
>
> How is this related to your patch?
>
our files are clearly out of sync :-)  The code in cpufreq_add_dev() is
#ifdef CONFIG_SMP
	/* check whether a different CPU already registered this
	 * CPU because it is in the same boat. */
	policy = cpufreq_cpu_get(cpu);
	if (unlikely(policy)) {
		cpufreq_cpu_put(policy);
		return 0;
	}

The reference added by this cpufreq_cpu_get() is finally dropped in 
__cpufreq_remove_dev() with the call to __cpufreq_governor()

	if (driver->target)
		__cpufreq_governor(data, CPUFREQ_GOV_STOP);

Without this change I hang at:
		pr_debug("waiting for dropping of refcount\n");
		wait_for_completion(cmp);

--Dirk
