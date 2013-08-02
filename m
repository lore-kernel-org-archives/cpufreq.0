From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: BUG_ON(irqs_disabled()) in cpufreq.c
Date: Fri, 2 Aug 2013 10:32:37 +0530
Message-ID: <CAOh2x=nfzMEgbetmaUhjKx2FfCvxPjOxk6A_XC-Q9h0+HOEnGQ@mail.gmail.com>
References: <CAEL66Hib_KJ3=5Hi-=OAye=2pbQz_0-PcC6CicjP9n2Ng2KG9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=lqSm43l07lT0+sRpTWTQ5ED0W+wjoMb7CryAKOD/GTk=;
        b=LVqGx3zXxYGKKPvH6sI1s2uftJRh27F/4Eb1KQqd6GB2GcWFRt5J2Mg5Aw0RePr6w3
         /gS6SmWTFG0V7rYsf1aEKRjCX9EAAtYFBvlMgl9+bsBOuxgznIxO1PjTBgE0TObUK5OT
         APvzuDYtSWTmyrFowRm+HibIA6v3ln7We5DLLlknHUTYBgTWDe/LdNhiB3GVga7VTaHu
         FVyL1oyaODjQEf+P/SAif7GVcDlOHoNLW7UoXbfrYNb8fdW0kD66YG/iGpBT0msH1KyL
         tRJB9O0fwEBobw35W17cH8TX7QK909vE8KYbc9nSaOZLn03ffES+3jEn5sdmnVRgIBjk
         wQdg==
In-Reply-To: <CAEL66Hib_KJ3=5Hi-=OAye=2pbQz_0-PcC6CicjP9n2Ng2KG9g@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Giardino <giardino@ece.gatech.edu>
Cc: cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

More lists cc'd

On Thu, Aug 1, 2013 at 6:08 PM, Michael Giardino
<giardino@ece.gatech.edu> wrote:
> Hi,
>
> I hope this is the right spot to ask this.
>
> Is there any way to change the cpu frequency using the cpufreq driver
> from within an hrtimer callback function? I encounter a kernel panic
> at cpufreq.c line 255 (260 in 3.9.5)
>
> void __cpufreq_notify_transition(struct cpufreq_policy *policy,
> 253                 struct cpufreq_freqs *freqs, unsigned int state)
> 254 {
> 255         BUG_ON(irqs_disabled());
>
>
> I'm assuming this is due to the cpufreq_notify_transition needs
> interrupts to notify? Is there a way around this? It appears that
> acpi-cpufreq.c is calling the notifier both before and after the
> transition (CPUFREQ_PRECHANGE and CPUFREQ_POSTCHANGE).
>
> Are there any frequency change functions that can operate without interrupts?
>
> The background is this:
>
> For the past few days I have been trying to get to the bottom of a
> problem involving a nonSMP governor I have written. The goal of this
> governor is to change the frequency on a predefined schedule (in the
> ms scale). The basic breakdown is this:
>
> 1. The external scheduler computes schedules and then passes them to
> the governor (with much code appropriated from the userspace governor)
> via an exported function.
> 2. The governor sets the frequency, then sets a timer to call the next
> frequency change when it goes off
>
> In order to do this, I was using hrtimers. These timer's callback
> functions run with interrupts disabled.
>
> Michael Giardino
> <giardino@ece.gatech.edu>
> <michael.giardino@gmail.com>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
