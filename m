From: Lan Tianyu <lantianyu1986@gmail.com>
Subject: Re: [Query] CPUFreq: Why do we need policy->user_policy?
Date: Tue, 27 Aug 2013 22:04:52 +0800
Message-ID: <CAOLK0pztfCd9ov297t0CW0C5S2iOSb9FJFHq9ycqwYGRiyifmA@mail.gmail.com>
References: <CAKohponkO6oZrvrsUGVK0uUbAM5wse7eHd7udtWkab7y2aatGA@mail.gmail.com>
	<20581731.mdSQ720dHi@vostro.rjw.lan>
	<CAOLK0pzg5VwDBLbUFU8J8wujxUazPgFC-+C4+Z6AMLYv7KcOtw@mail.gmail.com>
	<CAKohpo=ZKA6ieg9BrVRCRL+_7uiPfb2tWMO0_VOYx0m=Sv4+xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=fZVPL1j/hTlyPnKrbrf9xw/3b7kioJfRQmEI20Jbb/0=;
        b=rSEmgRnPAqrOu0orKvhG/NEPUyP8+AmCOOrdvjon6w+v1GWkgG3JjHAp2wmZPW0ZoA
         6X2r5sFllsfjh102yBWyejkWtu/8Enkso8OhlXEcPYQwYb//f1fknnw1JY29rRlpjjB2
         IrB47xfItodn9kwoDVJjU2B3gAO89QA47ip6t9koXlRRbmjrCyllWya9/s7sLmFfwHQ5
         hH4e9OOr9PrOypUoFHnHPnFXrEAqe1Y6d9S7LIw63rMfWSHOVJAUSHPfjgYUJLgdZu1v
         hWCQnsnQaVZLezLkToaLolxb2o1NsRjju3/bi4IVUSjbBHAdNtaCs6nX8YmlokuFQefq
         P1cA==
In-Reply-To: <CAKohpo=ZKA6ieg9BrVRCRL+_7uiPfb2tWMO0_VOYx0m=Sv4+xQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

2013/8/27 Viresh Kumar <viresh.kumar@linaro.org>:
> On 26 August 2013 20:53, Lan Tianyu <lantianyu1986@gmail.com> wrote:
>> So far as I know, it stores some user's config and cpufreq_update_po=
licy()
>> bases on the data in the struct to start a new policy. Cpu thermal d=
river
>> =A3=A8/driver/thermal/cpu_cooling.c=A3=A9also will its value to upda=
te freq policy
>> when receive a cpufreq policy adjust notification.
>
> Yeah, but how are these different from policy->min/max/policy/governo=
r?
> Why do we need to replicate this information?

=46rom my understanding.policy->min/max may be modified by some drivers
but the user_policy only store user space config and should not be chan=
ged
by other reason.  :)

--=20
Best regards
Tianyu Lan
