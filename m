From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq dir under /sys/devices/system/cpu/cpu* is not present for
 online=0 cpus
Date: Tue, 30 Sep 2014 15:30:53 +0530
Message-ID: <CAOh2x=mPzecwxi_SQx0gN2BDrNhLRMiPWYVHV9+wV9g8sbQb9Q@mail.gmail.com>
References: <loom.20140923T164259-12@post.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=awrESxpSBHv1NktZmyf5mHGZ4szwRXfUTnlXmRRkIfE=;
        b=mCSN9lmjAe5Qzx/YMVm+6EQNP7/hw5EKo5Wr2fp9QvlAKUKs0nqMHrlZsMHtosXCGj
         /yMqQw/2cZuCvLeOF50FAmpuQAPOr/TRFWijuQxdvtEK/aGZsfEhZJPVBx88H2iH+0Hy
         BGhuwSaifnRjyt8IZEQHQK5pMRQlVTUAmN27NmHIV7w/kOsl/AAC5u5pEPqNkurnQ21q
         AtzYKobRylqTAzoBKBvbm7xW/JN0T2FDV0Mpidkayvwbe4eP25CachwmzIRFdcHutyh6
         GXRFQF5+/BZAbMhXfO7hFWw35/QtW1ZDOhIA4jXcTJYN2YldDv4rGhShQHRgmZOa6mpM
         Rp0g==
In-Reply-To: <loom.20140923T164259-12@post.gmane.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ragu <raguramanmm@gmail.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

On Tue, Sep 23, 2014 at 8:19 PM, Ragu <raguramanmm@gmail.com> wrote:
> I am learning android and finding that the cpufreq dir under
> /sys/devices/system/cpu/cpu* is not present when online=0 for a cpu. Why are
> we hiding those directory and its content when a cpu goes offline/power
> collapse ?
>
> Because of the above, the cpu usage is not very accurate from some tools
> which reads data from sysfs.

These were removed because the CPU isn't online anymore and so we shouldn't
be able to change its frequency from userspace.

But probably this behavior can be changed to mark cpufreq directory and its
file as read-only in that case.

But that is some work to do..
