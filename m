From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: intel_pstate_timer_func divide by zero oops
Date: Wed, 27 Mar 2013 19:51:42 -0700
Message-ID: <5153B03E.2050201@gmail.com>
References: <alpine.LFD.2.03.1303272103380.8412@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=EfNbXf9+EzAFvBIhdP/nCyE8EcIuujVS6BBNmhf/3x8=;
        b=UDMKuyQHMZYFsS7cNAdQomHpsPj7/9aNo8wC3YnskBkjYEyZhizB13d5qA4+JYjNry
         Mwb+FRmENkYv8imsY/mnND3n/k1HBsghzAZWYjM7QHyZdkuVjXkDEWkNb4ExdpzC3B7Y
         NrQeiouSgKrApRIg3EspEXetdLzjd3OGfkPBk+9153nJYEz+/dN2HGcbjjfPM4Aovvrk
         L6KpJTUn6oLMElP9vVwMFgujrfZqP5vLQKC0DIYgUDjmxmtLvnSM3TQFVZUrubXauhBo
         i0fdHUHrrgK6uX3nXut2lgMrPedXWW6K4vqct9aQqE0Od/IiEYx2XnRfNrAwJX4QrJcn
         2sbw==
In-Reply-To: <alpine.LFD.2.03.1303272103380.8412@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Parag Warudkar <parag.lkml@gmail.com>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, dirk.brandewie@gmail.com


Is there any way to capture the beginning of this trace?

pid_param_set() is on the stack which means that something is changing
the debugfs parameters or the stack is FUBAR.

On 03/27/2013 06:49 PM, Parag Warudkar wrote:
> I get this same oops occassionally - the machine freezes and there doesn't
> seem to be any record of the oops on disk.
>

>
> That  is -
> 	sample->pstate_pct_busy = 100 - div64_u64(
> 					sample->idletime_us * 100,
> 					sample->duration_us);
>

I don't see how duration_us can be zero unless somehow I am getting back-to-back
timer callbacks which seems unlikely since the timer is not re-armed until
the timer function is about to return and the driver has done all its work
for the sample period

--Dirk

> So looks like sample->duration_us is 0? If so, that implies that
> ktime_us_delta(now, cpu->prev_sample) is zero. I am not entirely sure how
> to handle this case - return if sampling too early, or if there is some
> other bug making the delta calculation go poof.
>
>
> Thanks,
>
> Parag
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

