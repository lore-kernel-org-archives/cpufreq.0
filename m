From: Xiaoguang Chen <chenxg.marvell@gmail.com>
Subject: Re: [PATCH v9] Cpufreq: Fix governor start/stop race condition
Date: Mon, 24 Jun 2013 14:04:50 +0800
Message-ID: <CAFgnuDdzjyUQnXZGMCnwP2mXr7eQ9n-ZxOxxG4KWdgPMKOjEfw@mail.gmail.com>
References: <1371625207-26702-1-git-send-email-chenxg@marvell.com>
	<CAKohponDRcfHyRA-JCW01SC8R-dDiOx1dzBcOU6ag2DUa5_DyA@mail.gmail.com>
	<51C16B97.3040304@marvell.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=f5L0ZrUml6wRfG/ClsQm0c+Hlt5kH/lgoAfJSh4tQZs=;
        b=QSGYN+L2F98EIL0FKn/mdYv30Q/c+iReGa301pDPfWCL7rnemTa65uvuiTorr2XLhR
         w/40ZFaKm4xJloPSlneQfYW1nkqKvmdwVfZhgixjBhcw9ubOgemeOoCi5812Cjx7nzkz
         JEC6u+UOgB64bqQZ1p50B/DIf9lRcw4odhBcnHrk+YCf91dIwk7w7ophZlA2j5tZGARi
         6oyq6wXveHUg8Oqf74JLZBJaSAi7qdPI+XMLfa1SR4gp5xYAR738NMzob79ymWj0v8Qm
         E3rrtEWg79tnRgn7lIMvdmSk6abu8KI3nqJUQEqCWF/VtF+a/TWDKa3OUAimcxwP2L2P
         EJbA==
In-Reply-To: <51C16B97.3040304@marvell.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiaoguang Chen <chenxg@marvell.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ning Jiang <njiang1@marvell.com>, Zhoujie Wu <zjwu@marvell.com>, Yilu Mao <ylmao@marvell.com>

Hi, Rafael
When can this patch be merged?

2013/6/19 Xiaoguang Chen <chenxg@marvell.com>:
> On 06/19/2013 03:55 PM, Viresh Kumar wrote:
>>
>> On 19 June 2013 12:30, Xiaoguang Chen <chenxg@marvell.com> wrote:
>>>
>>> Cpufreq governor's stop and start operation should be kept in sequence.
>>> If not, there will be unexpected behavior, for example:
>>>
>>> There are 4 CPUs and policy->cpu=CPU0, CPU1/2/3 are linked to CPU0.
>>> The normal sequence is as below:
>>>
>>> 1) Current governor is userspace, One application tries to set
>>> governor to ondemand. It will call __cpufreq_set_policy in which it
>>> will stop userspace governor and then start ondemand governor.
>>>
>>> 2) Current governor is userspace, Now CPU0 hotplugs in CPU3 (put CPU3
>>> online),
>>> It will call cpufreq_add_policy_cpu in which it first stops userspace
>>> governor, and then starts userspace governor.
>>>
>>> Now if the sequence of above two cases interleaves, It becomes like
>>> below:
>>>
>>> 1) Application stops userspace governor
>>> 2)                                      Hotplug stops userspace governor
>>> 3) Application starts ondemand governor
>>> 4)                                      Hotplug starts a governor
>>>
>>> In step 4, Hotplug is supposed to start userspace governor, But now
>>> the governor has been changed by application to ondemand, So hotplug
>>> starts ondemand governor again !!!!
>>>
>>> The solution is: Do not allow stop policy's governor multi-times.
>>> Governor should only be stopped once for one policy, After it is stopped,
>>> No other governor stop operation should be executed. also add one mutex
>>> to
>>> protect __cpufreq_governor so governor operation can be kept in sequence.
>>>
>>> Signed-off-by: Xiaoguang Chen <chenxg@marvell.com>
>>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>>> ---
>>>   drivers/cpufreq/cpufreq.c | 24 ++++++++++++++++++++++++
>>>   include/linux/cpufreq.h   |  1 +
>>>   2 files changed, 25 insertions(+)
>>
>> All good now. Sorry for the noise :)
>
> Thank you for the professional instructions. It makes the code more
> beautiful. :)
>
> --
> Thanks
> Xiaoguang
>
