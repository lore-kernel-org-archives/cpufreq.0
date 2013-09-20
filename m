From: karthik vm <meetvm@gmail.com>
Subject: Re: Few clarifications on DVFS
Date: Thu, 19 Sep 2013 20:45:30 -0400
Message-ID: <CAOuKo4=Ju3JHmgQMasmPB31mKPeHYKv3+hWmacjZ+Fw1qPpYBg@mail.gmail.com>
References: <CAOuKo4nZ5Yij3cnM=PuMR3awJ2QAbY4O+-mKi110xfc66xyWUg@mail.gmail.com>
 <CAOh2x=n3PVMJhbrJE33Qe73=6ZUhh8yR1rs+ziWTD5tFNjW6RA@mail.gmail.com>
 <CAOuKo4kZNv70OyEt6tRynfFmRex8DW+nJCg2pZGPoydnHn+LaA@mail.gmail.com> <CAKohpokp4QknDECgv2ecVbu-7L3jhcLtHy=TZh-3m5=ib_xDyg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=6VQGvv7oJs71j12Ic0RBDPdx17VMJi+PRYzH0ZHJ6aU=;
        b=KSr204VzOPGPmtzv5KIexw2VNirL16htIHvMJR9sQMV3ltyMJ3l5YjNCLj1gGSPi3b
         e1+QHE8HsqbLHNe7Rfsfnr9rU418e2El1u9Qsx4MHLWqsVx3SJqd0N+u1c8anP6RLz4y
         h7Xzl7Ucx1rgif9xymcFEX/ahCJSwb2stKVUZgwqFvSWVdOhdb4yHhUL9aUL5mdcTCp6
         xQXYgtShn6tEKYGhdwV0WWlWkDa9ha/+32ioptFjG7XVhM/SY2fwAm7UtmAfETSEKb97
         r8LOM0wCkljfqcif7yRhtoL+PpGAy2oxrQ14QH9qqzCDSmge27kCv/YaH4R/VMlSqXCO
         5K4Q==
In-Reply-To: <CAKohpokp4QknDECgv2ecVbu-7L3jhcLtHy=TZh-3m5=ib_xDyg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

Thanks for the pointers Viresh. I gave a quick look into ftrace.
Surely it will be helpful for my analysis as it has info on time taken
by each function. Hope further analysis using ftrace can give me more
pointers.

Cheers,
karthik

On Tue, Sep 17, 2013 at 1:01 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 17 September 2013 07:43, karthik vm <meetvm@gmail.com> wrote:
>> Yeah actually that is what my concern is. It seems that for changing
>> the frequency we need to acquire a lock (in cpufreq_driver_target()).
>> Hence even though the hardware is capable of ns level DVFS, OS
>> overhead may be large enough to take advantage of it. Can we measure
>> this overhead?
>
> There are a lot of other things that we really need to look before this
> one..
>
> The way we are changing frequency currently is very delayed... There
> are few other threads that are going around power aware scheduler
> which you might be interested in.. Look for them in Archives..
>
> Coming back to your question, these kind of overheads will always be
> there, isn't it? Normally that lock will be acquired fairly quickly as there
> might be no contention..
>
> Yeah, you can measure it but don't know who is your best friend in
> term of tools.. Maybe ftrace can get you some details.
