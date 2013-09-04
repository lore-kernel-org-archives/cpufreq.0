From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [Query] CPUFreq: Does these machines have separate clock domains
 for CPUs?
Date: Wed, 4 Sep 2013 16:27:37 +0900
Message-ID: <CANqRtoQF8-W=EFcV+LEPGbJf=h_yfyjVg=+0F5Sif15jB8XjBg@mail.gmail.com>
References: <CAKohponWn-RN7-6sdhghd6RGCOd357G+TKLsxHfqnSCuMD7xxw@mail.gmail.com>
	<CANqRtoTSO2yyP35naDe4y6a7rL99=cSs4-bJAWOxR5HL2gbpuw@mail.gmail.com>
	<CAKohpom06N4DNZxrQcey-73o1jpQkNpCce2=-Wn+mDHLG9r-3g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=8J+r4vP56KD1d9Tf6HP+qCYMx10cHe3UxWn8Lv7hA9o=;
        b=zk71Dl0yCQybdlMpK4GbUIxTL4guzSvHo020QXAlPL4f5AL080T5qJP5mLyiahQEw7
         0jrmms6q27IGFlYJYJdvkQHaJ+47EQ6XrhUyd9u5UNBwpDOfZb7W1TL4HCvileARSjRp
         FlmOicS89tIID5ge2w5mxqsw6IYgoS8Q44Le3qYcaeVfrd03WUYXO/FEAu2QcAzKNEYh
         TwsTJc0KpahAqMw/wiUBPtlkbIltw4943+zHhTx+lthVKy2jGnNNgZDWd/b3YCTVinSs
         uKkp57PBrFha7SB7cOwM3+K2h/Zzd5Z9jrg1VRallyFht2+H2PAesKUvSGtE8LrzhdcH
         O4Rg==
In-Reply-To: <CAKohpom06N4DNZxrQcey-73o1jpQkNpCce2=-Wn+mDHLG9r-3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Eric Miao <eric.y.miao@gmail.com>, linux-cris-kernel@axis.com, SH-Linux <linux-sh@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Miao Steven <realmz6@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Mikael Starvik <starvik@axis.com>, Paul Mundt <lethal@linux-sh.org>, sparclinux@vger.kernel.org, Dave Jones <davej@redhat.com>, David Miller <davem@davemloft.net>, John Crispin <blogic@openwrt.org>

Hi Viresh,

On Fri, Aug 30, 2013 at 4:33 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 30 August 2013 12:18, Magnus Damm <magnus.damm@gmail.com> wrote:
>> Hi Viresh,
>>
>> On Thu, Aug 29, 2013 at 7:15 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>> Hi,
>>>
>>> I have been doing some CPUFreq cleanup work and
>>> wanted to know if the below mentioned machines have separate
>>> clock domains for their CPUs or all share the same domain?
>>>
>>> So, that we can use some generic routines for these drivers which
>>> would eventually do:
>>>
>>> cpumask_setall(policy->cpus);
>>>
>>> And I wanted to make sure that this doesn't break them.. :)
>>>
>>> ......
>>>
>>> The drivers are:
>> ...
>>> drivers/cpufreq/sh-cpufreq.c
>> ...
>>
>> The above SH cpufreq driver seems to be written with SMP in mind, but
>> I would say SMP is a very rare case for SH. So I believe it can be
>> considered as UP-only at this point. If Paul disagrees I'm quite sure
>> he will tell us.
>
> Okay.. The problem isn't really SMP but different clock domains for CPUs
> in a SMP system..
>
> So, even if we have a SMP SH machine, will it have same clock line for
> all CPUs?

Yeah, I understand your question but I'm afraid that I don't know the
answer myself.

> I will go with the change anyway..

Good plan. Thanks for cleaning up the cpufreq bits.

Cheers,

/ magnus
