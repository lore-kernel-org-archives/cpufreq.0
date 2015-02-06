From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: cpuidle vs suspend vs something else
Date: Fri, 6 Feb 2015 09:37:33 +0100
Message-ID: <CAJKOXPdOu3AUFv50i_WJ-JxGErJxi1RRXD6j2uqYpZ3t1WOMzw@mail.gmail.com>
References: <54D43143.2010403@free.fr>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=ybT6vHoADoXmJ49I0sfLLpp/o5MH0P5H1FY3Xp6z+tw=;
        b=h8WmD7USIDTrJ/UWMm+kyym1rDDTt0O5CAh4nWflrxcgAu8QtLMvofjdGVDnRfjyiG
         IqX3hQi6qWTCx0YpT6D//BPpm/Jmejt40klYS9Vf7iRCs49XuLXVEiFT80tp0tMQRBWq
         LKHSlQ2GS7hqLXPxN8I3kcyqIhJHbWhbZFLyTpSE443lRN00lsRLjT6FanX4YflE8Vby
         8Meri0R/TyDKjMraXzNXYAXo3haSR/LZCew5y3yn6im5DN9MqSnyk9TQ8ew4M0BKUHN/
         7MomWGyp3Z7UcLx3DNOYdRCyT8TBSb3tCF4/qaA+/vRpUtr6oQPH0SWNw1TL0N8rGAc5
         fuvw==
In-Reply-To: <54D43143.2010403@free.fr>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mason <mpeg.blue@free.fr>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>, cpufreq <cpufreq@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>

2015-02-06 4:13 GMT+01:00 Mason <mpeg.blue@free.fr>:
> Hello everyone,
>
> I've been reading about related sub-systems (cpuidle and suspend)
> and I'm not sure I understand how they relate / interact.
>
> If I understand correctly (please do point out any misconceptions)
> on ARM Cortex A9, the first level of power saving is WFI, which is
> typically called from the idle loop.
>
> This places the core in low-power mode ("Standby mode" in ARM docs).
> "RAM arrays" (don't know what they are), "processor logic", and
> "data engine" (not sure what any of these exactly refers to, guess
> I have more reading to do) are still powered-up, but most of the
> clocks are disabled.
>
> In ARM's exact words, "WFI and WFE Standby modes disable most of the
> clocks in a processor, while keeping its logic powered up. This reduces
> the power drawn to the static leakage current, leaving a tiny clock
> power overhead requirement to enable the device to wake up."
>
> Some CPUs like Intel's have several levels of sleep (deeper levels
> mean less power, but have a higher wake-up latency). AFAIU, cpuidle
> is used to describe and manage these levels?
>
> Isn't suspend somewhat like the deepest level of sleep?
> (Or is it different in that things like RAM state are only a concern
> for suspend, not cpuidle?)

Actually on some ARM SoCs the deeper cpuidle states behave like
suspend. For example there isn't a deeper low power mode for one core
on Exynos but there are low power modes for whole SoC. Entering most
of these modes is controlled by cpuidle subsystem. The deepest mode is
sleep which on Linux is entered during Suspend to RAM. So actually to
answer your question - it depends on SoC and how you integrate it with
Linux.

I am not that familiar with other SoCs but I think on Qualcomm each
CPU may enter standalone low power mode?

> Are both subsystems still actively used?

Yes, both are used: cpuidle and suspend.

Best regards,
Krzysztof
