From: Lan Tianyu <lantianyu1986@gmail.com>
Subject: Re: [Query] CPUFreq: Why do we need policy->user_policy?
Date: Mon, 26 Aug 2013 23:23:03 +0800
Message-ID: <CAOLK0pzg5VwDBLbUFU8J8wujxUazPgFC-+C4+Z6AMLYv7KcOtw@mail.gmail.com>
References: <CAKohponkO6oZrvrsUGVK0uUbAM5wse7eHd7udtWkab7y2aatGA@mail.gmail.com>
	<20581731.mdSQ720dHi@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=y76PysSbDDmPfJNBcuf3JNpZC1YSKwiLgdEyUZZsRsc=;
        b=YYFGYku64S543mho23Rs3f7Bm0daQzjGWo606d0XfWId5n9oxo++H1iW4d4euMokZB
         cCrvVsyVgxMJeuDZPWX4EnWGnIHP6b1KmD+qwVcuja4S5AODU7CsmYurA7/JdldIBaY/
         5hSzHs5jrWZgvkIQBrUG+7hjaGvkim0D4x4+oLGLAnw5q8F9MjWBWOnFD4EVsnY73AB2
         8eQQ7J4Th/E2i1lKd7bLccX5KqG7hMBmSHUoSMChoxRbQ2ztAkAmpAwVVd8HKy7TdY+2
         Jm4yxXg9IPF1HzflwUaLlSbkj6A0HwR9Xf11rMXuf6eM6bk9m9DVQ72BWUnLwtE1nAow
         n75g==
In-Reply-To: <20581731.mdSQ720dHi@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

2013/8/26 Rafael J. Wysocki <rjw@sisk.pl>:
> On Monday, August 26, 2013 08:00:52 PM Viresh Kumar wrote:
>> Hi Rafael,
>
> Hi,
>
>> I am almost done with cleanup of drivers and am back at cpufreq core=
=2E. :)
>> I got to this structure: struct cpufreq_real_policy;
>>
>> And I am not able to understand what's the need for this structure?
>> Can you let me know? Before I try to get rid of it :)
>
> Honestly, I don't remember from the top of my head.

So far as I know, it stores some user's config and cpufreq_update_polic=
y()
bases on the data in the struct to start a new policy. Cpu thermal driv=
er
=A3=A8/driver/thermal/cpu_cooling.c=A3=A9also will its value to update =
freq policy
when receive a cpufreq policy adjust notification.

>
> Thanks,
> Rafael
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best regards
Tianyu Lan
