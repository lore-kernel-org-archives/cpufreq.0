From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] cpufreq: Catch double invocations of cpufreq_freq_transition_begin/end
Date: Wed, 21 May 2014 18:18:14 +0530
Message-ID: <537CA08E.4050608@linux.vnet.ibm.com>
References: <20140505072129.14454.25747.stgit@srivatsabhat.in.ibm.com> <5367553C.1040701@linux.vnet.ibm.com> <537C9CF3.60503@linux.vnet.ibm.com> <6424313.K1VhKnAUr2@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <6424313.K1VhKnAUr2@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Meelis Roos <mroos@linux.ee>, viresh.kumar@linaro.org, ego@linux.vnet.ibm.com, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/21/2014 06:31 PM, Rafael J. Wysocki wrote:
> On Wednesday, May 21, 2014 06:02:51 PM Srivatsa S. Bhat wrote:
>> On 05/05/2014 02:39 PM, Srivatsa S. Bhat wrote:
>>> On 05/05/2014 02:23 PM, Meelis Roos wrote:
>>>>>
>>>>> Changes in v3:
>>>>> Expanded the comment in the code to briefly mention why ASYNC_NOTIFICATION
>>>>> drivers are left out from the check, as suggested by Gautham R. Shenoy.
>>>>> No code changes in this version.
>>>>>
>>>>> v2: https://lkml.org/lkml/2014/4/29/283
>>>>> v1: https://lkml.org/lkml/2014/4/28/469
>>>>
>>>> Seems to work on VIA EPIA with 3.15-rc2 (no other cpufreq fixes):
>>>>
>>>
>>> Great! Thanks a lot for testing this!
>>>
>>> Rafael/Viresh, can you please add Meelis' Tested-by while taking
>>> this patch?
>>
>> Rafael, any thoughts on this patch?
>>
>> It has been Acked by Viresh and tested by Meelis. Hope you'll consider
>> picking up this patch for 3.16.
> 
> It should be in linux-next today AFAICS.
> 

Oops, I did check your tree before asking, but I'm not sure how I missed
this. Now I'm able to see the patch in your bleeding-edge branch. Sorry
for the noise!

Regards,
Srivatsa S. Bhat

