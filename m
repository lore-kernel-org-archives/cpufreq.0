From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Few clarifications on DVFS
Date: Mon, 16 Sep 2013 11:16:18 +0530
Message-ID: <CAOh2x=n3PVMJhbrJE33Qe73=6ZUhh8yR1rs+ziWTD5tFNjW6RA@mail.gmail.com>
References: <CAOuKo4nZ5Yij3cnM=PuMR3awJ2QAbY4O+-mKi110xfc66xyWUg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=MyDvstTqhU/q9k03N7zJOSLe0ZtbfWSIY428xo6j8oA=;
        b=sReZCoaiwiBtKVsVFZOa2r6nd6tg5dG+zGEUKxdNxFv4PtyFCioCOxD2Y05S457ImI
         4mo8yTXDgU2S1PXPSi797G8fJXqNhjjja4ScGAki0elx+zbp6rYYQ0Nt1Jiong2p365m
         suI4g3+rbH3QKIFxsBrDPx43R5SN6yBBUbGYvL8UzVeRHqG8HHevIxy7Ltaav+w6/smK
         MV62HPGLqMVKbs1g/q0GIIBs1CvX2TzMcV7JYvG2hG3Fhnb9dBFIE0k3CIeLQa/rBMXn
         gSSxGTR+XSB0wzii5trM7i7W+zBP2FfHR05BW4fDYqr1dFPB1XWtlt5++52wPzOaQEIA
         jXcA==
In-Reply-To: <CAOuKo4nZ5Yij3cnM=PuMR3awJ2QAbY4O+-mKi110xfc66xyWUg@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: karthik vm <meetvm@gmail.com>
Cc: cpufreq <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

Included pm list as well..

On Mon, Sep 16, 2013 at 6:00 AM, karthik vm <meetvm@gmail.com> wrote:
> Hi,
>
> I am a PhD student doing research in DVFS area. I have few questions
> for which I am looking for an answer. It would be great if some one
> could give some pointers.
>
> 1) In my current Core2Duo laptop, "maximum transition latency" from
> cpufreq-info command is 10us. Hence I get that to change the frequency
> of my cpu it takes 10us. Also recent research papers say that the
> frequency of the processor can be changed in ns scale (eg. 10 ns -
> 100ns). If that is the case, can processor frequency be still modified
> thru OS? Will OS be able to handle such a fine grained frequency
> change?

What's the problem you see in OS doing that? Its not about the guarantee
that OS can change freq in that time, but is more about hardware... And
so it doesn't matter who changes it..

> 2) Currently the frequency change is handled by governors. But is it
> possible to change the frequency of a cpu directly by calling the
> CPU-driver functions from another part of the kernel?

Ya, the API is open to be called from anywhere you want... but then its
your hardware and you must know what you are doing :)
