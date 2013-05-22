From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Clarification on the DVFS capabilities
Date: Wed, 22 May 2013 09:38:57 +0530
Message-ID: <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=fvJflipxG5AJH+ge3DPZ+W+3KHta4Zini9HhU4RskVM=;
        b=DR9AhiKb66WHL4yxDGMI1z5jtkcuMGpn8KBXAE/LlxcrAa8d3GdjsN+TJfPmdsrvW0
         jr1TrqVw0TM/+LbJxai0jMzMtgLhnuKk5jhfMr2cpT2YlUsBCl/jw6Ba29Rzvum3S013
         uPnN7WPtQoe1Wc5ta6OdllIbOtHuPaY5ZQ/gJfCKMecHZ15rg2DS1J6e3mMAeGVKOaGx
         UL1DGp3xZL+1+MPzOkZUvnUlyDUl8mRv+5bDTwUcNhX0xe0Gm1voXh9OBDqTKY6DxMnk
         XkoBvq4QS+khiWfr83qxj+4SVEkQVQgO74rnL4VKC2WD8UWNMdfU+MShyKELGjmYI6eF
         QwGA==
In-Reply-To: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: karthik vm <meetvm@gmail.com>
Cc: cpufreq <cpufreq@vger.kernel.org>

On Tue, May 21, 2013 at 9:48 PM, karthik vm <meetvm@gmail.com> wrote:
> I have few doubts on the DVFS capabilities of my intel Core2Duo
> processor (T5750) which has 2 cores (no hyperthreading) and has
> Enhanced Intel Speed Step Technology (EIST). When I run the
> "cpufreq-info" command in Ubuntu Linux I get the result that: "CPUs
> which run at the same hardware frequency: 0 1". Hence I assumed that
> both the CPUs will increase and decrease the frequency in a
> synchronous fashion.
>
> But when I tried to verify it by using the below command:
>
> $ watch -n 0.1 grep \"cpu MHz\" /proc/cpuinfo
>
> Here I see that each core is varying the frequency individually
> contrary to the cpufreq-info commands output that both run at the same
> hardware frequency. Hence can anyone comment on this behavior?

Which kernel version are you using? Can you paste output of cpufreq-info.
You need to look at: "CPUs which need to have their frequency
coordinated by software:"
to get the right group of cpus..

The other group (pointed by you) had misleading values, which are
recently fixed in 3.9.
