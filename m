From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [REGRESSION] [CPUFREQ] 3.9.0-rcX
Date: Mon, 25 Mar 2013 08:48:14 -0700
Message-ID: <515071BE.4070007@gmail.com>
References: <CAG9S4UjMeRZECAiigZVLTU4av2ZJNBukyUAoCmiYRjtkdThhFw@mail.gmail.com> <CAKohpokBySA5uaTTAwF5tmUr-_+W04Ki_f6cWTLu7n1C3Tcqog@mail.gmail.com> <1965505.vyQ4xZcodg@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=jrI2w98kaVIkBhNloKKNBBKXjvxo4LKxAg9CV+ibKUI=;
        b=PNZRWM+qfYCni2MrM01qtzqOp+BW2SvwggXv9AIjaWshcsHR6ctdLc9Q6B4x7cTUvS
         OPA9lJqRcxOqXg+bVoH9N2oItxGj1Bt/ZutaWUjDrak7Lq7iL4uBkv1vWj8Fyhg8i5Io
         GflrRXEjLvkLH9c4v7067Y/Qgff735VN9ueSPsOyMEzijo+R+z/JanuIl5+dyx+3j5//
         8w9kMOnLldJqIlLruQ9ogjWmBocZHRXDjs2SjlaQ7G866xiyMkjHK8p8mIKnrXuoc/jV
         AhvZh71DnCJeWw5goSJTrntPcieVG6wjjChcqtIVVHstUgxkWObm6PTbTJjoX1/04si9
         JLQA==
In-Reply-To: <1965505.vyQ4xZcodg@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Dirk Brandewie <dirk.brandewie@gmail.com>, Maciej Rutecki <maciej.rutecki@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On 03/24/2013 07:53 AM, Rafael J. Wysocki wrote:
> On Sunday, March 24, 2013 07:59:35 PM Viresh Kumar wrote:
>> On 24 March 2013 19:41, Maciej Rutecki <maciej.rutecki@gmail.com> wrote:
>>> (long e-mail, sorry ;-))
>>
>> Don't be, it was useful :)
>>
>>> Last known good: 3.8.0
>>>
>>> Short description:
>>> 1. On -rc3, after s2ram cpufreq does not set CPU on max frequency on high
>>> load (on battery).
>>
>> Try attached patch for this.
>>
>>> 2. On -rc4 (this is not real regression because I change config between -rc3
>>> and rc4), "ondemand" does not work. Current frequency is 'strange' (792
>>> MHz).
>>> ===============================================================================
>>> Kernel 3.9.0-rc4
>>>
>>> CASE 7
>>> (normal boot)
>>> cpu0/cpufreq//affected_cpus:0
>>> cpu0/cpufreq//related_cpus:0
>>
>> This must be related to your different driver.
>
> Yes, intel_pstate is not really a cpufreq driver.  It just overtakes the
> whole subsystem.
>
> Dirk, can you please check if this is as intended?

This is working as intended.  The intel_pstate driver has the governor
integrated into the scaling driver and does not use external governors.

The reason the frequency is strange is because intel_pstate returns a
measured value of the effective frequency that the core ran at during
the last time it was sampled.

--Dirk
