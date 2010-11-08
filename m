From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH] cpufreq: Fix ondemand governor powersave_bias	execution
 time misuse
Date: Sun, 07 Nov 2010 20:32:42 -0800
Message-ID: <4CD77D6A.9070901@linux.intel.com>
References: <20101105151951.GA10743@linux-youquan.bj.intel.com> <4CD3EF31.9060909@linux.intel.com> <20101108144527.GA13617@linux-youquan.bj.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101108144527.GA13617@linux-youquan.bj.intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Youquan Song <youquan.song@linux.intel.com>
Cc: davej@redhat.com, venki@google.com, youquan.song@intel.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/8/2010 6:45 AM, Youquan Song wrote:
>> On 11/5/2010 11:19 AM, Youquan Song wrote:
>>> Ondemand governor use powersave_bias tunable to do aggressive power save by
>>> decrease CPU average frequency. The average frequency achieve by adjust low and
>>> high frequency's execution time proportion during one sample time interval.
>>>
>>> Current kernel, only the high frequency executes in time proportion, but the low
>>> frequency wrongly execute in one whole sample time interval when powersave_bias
>>> is set.
>>>
>>> The patch fix it by set low frequency execution time to it deserved.
>>>
>>> Signed-off-by: Youquan Song<youquan.song@intel.com>
>>> ---
>>
>> while your patch looks correct, I think the whole feature is wonky and
>> likely ought to be removed...........
> powersave_bias should be a useful feature, which give user an
> opportunity to set the CPU to work at wider average frequency accord to real
>   workload requirement, not just CPU frequency specific at P0,P1,...Pn.
> At the same time, it meets end user power comsumpation requirement in
> some degree.
> Unfortunately, it does not work for a long time.

in all measurements I've done... the intermediate states (between P1 and 
Pn) seem to not be power efficient.....

