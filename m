From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Cpufreq governor start/stop race condition
Date: Mon, 13 May 2013 09:56:24 +0530
Message-ID: <CAOh2x=nrMRxkpwF6aXS4VjQR7u+KvnUnPyzsHe4BDa1vBiHCUw@mail.gmail.com>
References: <CAFgnuDeuhhLa1dnia1hpj+OuwKcmNVdNTVMw99=8QAXf8tqM7w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=2v2Dugzw9ntgAnx7ErK3aNCxQjoJVgovgB/3pGip9Jw=;
        b=uBWugI1HKd/VQUXJObC00Ucju0rUVFarzv3oF+x1HKW15LVBtfqSU8moAQ43GpE7d+
         zoGVaTJaBRdTWW59Rd5YafNF0FEdgYf+oZWr7GZOygv9dg19hhKPSBTckN/LWCwYJsnG
         tXf88zgdasgvu/tw+g/ovLcpQEEvB6gu0kWX4XXOiVMiSKpvywwiCsqY5QnYa8f1NH1y
         wFG+CMPUYTIBe0XQvuPxs7wrmca9L28bD+1nQOsOlCNfzmg1YiEsgTWnipGmT0Cll0tW
         suBJLkNfFngv3nmZn8cIhdTzeaanUtomB3T6IXwG+05Qa6JSCm2WTnoGIcEZJQnud6BX
         ywRQ==
In-Reply-To: <CAFgnuDeuhhLa1dnia1hpj+OuwKcmNVdNTVMw99=8QAXf8tqM7w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiaoguang Chen <chenxg.marvell@gmail.com>
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On Mon, May 13, 2013 at 8:19 AM, Xiaoguang Chen
<chenxg.marvell@gmail.com> wrote:
> Hi, Cpufreq Guys
>
> We meet one race condition for cpufreq governor start/stop during
> hotplug and manually governor change.
>
> we have 4 cpus and policy->cpu=cpu0, cpu1/2/3 are linked to cpu0.
> the normal sequence is as below:
>
> 1) Current governor is userspace, one application tries to set
> governor to ondemand. it will call __cpufreq_set_policy in which it
> will stop userspace governor and then start ondemand governor.
>
> 2) Current governor is userspace, now cpu0 hotplugs in cpu3, it will
> call cpufreq_add_policy_cpu. on which it first stop governor
> userspace, and then start governor userspace.
>
>
> Now if the sequence of abover two cases interleaves, it becames below sequence:
>
> 1) application stops userspace governor
>                                                               2)
> hotplug stops userspace governor
> 3) application starts ondemand governor
>                                                               4)
> hotplug starts a governor
>
> in step 4, hotplug is supposed to start userspace governor, but now
> the governor has been changed by application to ondemand, so hotplug
> starts ondemand governor again !!!!
>
> there are some consequences for this issue:
> ondemand governor will be started for multi-times which causes its
> timer be inialized multitimes, if we use object debug to trace this,
> we get a waring that the timer object is alive but it is initialized
> again.
>
>
> The issue happens because we use one same cpufreq policy for all cpus,
> once the policy is changed, all cpus will be affected. I tried to add
> a mutex lock before governor stop and after governor start. but it
> cannot solve the problem completely as there maybe some other places
> that changes the cpufreq policy, if it doesn't use the same mutex
> lock, policy may still be changed during stop/start sequence. the
> final governor may still not the expected one.
>
> Do we have some discussion for this issue before ? any suggestions for this?

We never had a discussion on this earlier and on the face of it, it looks like
a locking issue which must be fixed. I am not sure if i would be able to devote
some time on it right now as i just came back from 15 days leave and have a
lot of stuff to finish.

If you can provide a patch, i can surely review it quickly. :)
