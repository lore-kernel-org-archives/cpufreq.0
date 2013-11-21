From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] cpufreq: Make sure CPU is running on a freq from freq-table
Date: Thu, 21 Nov 2013 09:56:32 -0800
Message-ID: <528E4950.9030507@gmail.com>
References: <de5c3ff26e9d06a6e0b06f8ba3da6d8c3ff82304.1385017369.git.viresh.kumar@linaro.org>	<3577662.BKCLJdcf18@vostro.rjw.lan> <CAKohpo=fZ8Fr=CMDzCy3daBU+mZBJ+9fOks6L7WLOZzE7WaAaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=F25rOve2nEMP/TkBRnIfFZMUGWDHJDXQX0b07owzEYg=;
        b=JEkBqqrs6LIMnOWuCcpSU5a+ew+KRpZ2G7V6sS1hQAAhzrLAxe/BvGN07PmUC8MqRp
         EbkVbc34KAlYB5x0s1/c5hGGnbuWM/Wb6lSnaFgkNerN5UIb3K9ok6jrFHmr7LBRoM+x
         FvAKq/64o60w9vm2cW7DGFnIXXfhqvs3sc5rG/tsxvKXIZ3bqAUtdCDM7OeYocdWMF7b
         W4P7Jv11gymMUdPv0ri4gQwUhFeKPJGLyCXUCMbmBc2zMa9mupmHtjMSiZfggXzhTT5L
         2Tjpkb8GEwjsEeGebb5YrjWqSP+4Fak/7AdhwLZWXYUXd2/FNfnq7OCjgfXLjhRLzgSm
         ZEsA==
In-Reply-To: <CAKohpo=fZ8Fr=CMDzCy3daBU+mZBJ+9fOks6L7WLOZzE7WaAaQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Nishanth Menon <nm@ti.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Sripa Bagadia <ceh@ti.com>

On 11/21/2013 07:57 AM, Viresh Kumar wrote:
> On 21 November 2013 18:41, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>> On Thursday, November 21, 2013 12:39:02 PM Viresh Kumar wrote:
>
>>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>>> @@ -1038,6 +1038,32 @@ static int __cpufreq_add_dev(struct device *dev, struct subsys_interface *sif,
>
>>> +     if (has_target()) {
>>> +             ret = __cpufreq_driver_target(policy, policy->cur,
>>> +                             CPUFREQ_RELATION_L);
>>> +             if (ret)
>>> +                     pr_err("%s: Unable to set frequency from table: %d\n",
>>> +                                     __func__, ret);
>>
>> Should we continue in that case?
>
> I wasn't sure. I thought maybe there are platforms which might not be
> ready for transitions so early and so an error message would be fine,
> as we will fail soon anyway in case there is a bug.
>

The scaling driver for the CPU has already loaded and its .init procedure has 
been called so .target better be callable.

Since the scaling driver is responsible maintaining the set of valid frequencies
and setting policy->cur I think it is reasonable to have the scaling driver
ensure that policy->cur returned from its .init and the operating frequency are
in sync and match one of the values in its frequency table.

--Dirk
> --
> viresh
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

