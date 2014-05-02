From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH] PM / OPP: move cpufreq specific OPP functions out of
 generic OPP library
Date: Fri, 2 May 2014 07:15:58 -0500
Message-ID: <CAGo_u6oT6nK0-Sj8yp9C2r8FkQ8SXF8LvhbHxDjAoGs+Pd=szA@mail.gmail.com>
References: <1398992810-14957-1-git-send-email-nm@ti.com>
	<CAKohpokEuZ69HnnKE89maXk=21cgAMjEYjEvEcaoBpg4bLRsGg@mail.gmail.com>
	<CAGo_u6ohKZh+zKWSzGbvT+AKgnhSjzX7v9isqpd2pc-Cpmxocg@mail.gmail.com>
	<CAKohponv-p20=www51rW13RSG6=ACgDrRDfL9Xd26ePgjkpWfA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=hFOapaFy9C69WkfRJXR1x00/IWDX7FS9y1LSC/rm6Vk=;
        b=kuFzMjMvSwHH316xQXKQv4axW4OWlUiuSqwSuWDS7o7YhpRjyGM+cQbVJRd5m0ZE9c
         JF79daoOnarAB3lKEIByWUooCcqApROniEIxV+lrok0tmWR2ZuXtW7CFMR25YoCE/oQu
         4QqiNCsVQt7K41zeedcgGNh99UEeaCaW1NcBu1nSvSK5j15RkRLrK0JYmaK9KnvFeQ7f
         ueseQykvV9Z7wqehSk1jOmS893ze5xXfSt4z/4j7jmk68EcTuVyhmZtVIcCxcOO+g3z4
         U9mNWyVwsqzza2LqWzPp3EQudexylFaDIGt8Y/Go64aXtVPzuiTwjERY+cjsWOjW1qCC
         IagA==
In-Reply-To: <CAKohponv-p20=www51rW13RSG6=ACgDrRDfL9Xd26ePgjkpWfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@deeprootsystems.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 2, 2014 at 12:22 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 2 May 2014 10:48, Nishanth Menon <nm@ti.com> wrote:
>> On Thu, May 1, 2014 at 11:30 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>> diff --git a/drivers/cpufreq/cpufreq_opp.c b/drivers/cpufreq/cpufreq_opp.c
>>>> new file mode 100644
>>>> index 0000000..2602ff8
>>>> --- /dev/null
>>>> +++ b/drivers/cpufreq/cpufreq_opp.c
>>>> @@ -0,0 +1,102 @@
>>>> +/*
>>>> + * Generic OPP Interface for CPUFREQ drivers
>>>> + *
>>>> + * Copyright (C) 2009-2014 Texas Instruments Incorporated.
>>>> + *     Nishanth Menon
>>>> + *     Romit Dasgupta
>>>> + *     Kevin Hilman
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> + */
>>>
>>> I hope you have just copy pasted routines to this file, and haven't done
>>> even the most minor modification in those, as its hard to review it.
>>
>> there is code replacement ofcourse ->
>> * the logic of walking down the list holding a mutex has been replaced
>> with rcu locks,
>> * instead of reading internal data structure and generating the list,
>> use the existing search API that does exactly the same.
>> * Documentation update for the same.
>
> Hmm, actually if I would have written this patch, then probably I would
> have done the same thing, but looking from the reviewers perspective,
> it would be much more easy if we can separate things into patches.
>
> So, maybe do these changes first in opp.c only and then finally a
> patch that just moves things around.
>
>> Both are needed if you have to move the code out. functionally, both
>> are equivalent
>
> That's an assumption and we never know when we might have screwed
> the code :) .. And so more careful review of those parts is required :)

True. Will do the same as suggested for the formal series. Thanks for
your feedback and review.

Regards,
Nishanth Menon
