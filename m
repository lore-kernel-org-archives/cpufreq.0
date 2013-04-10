From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Wed, 10 Apr 2013 08:14:06 +0200
Message-ID: <CA+icZUW2LQmWMdaVjf5oE8y3zCq8Y2829WM9dwDKxA42N5tVDQ@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
	<CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
	<CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
	<CA+icZUWH5Ni9koj4V8Ws8jJ7smwmU7JuUWBFh=aiCqkrCpqB5A@mail.gmail.com>
	<CAKohponzmLzPN8ua3p4TCt2waZCQCd+4Znh+tSQ4MBjcy+Ss6A@mail.gmail.com>
	<CA+icZUW12caZHDfgCV6E-1T4ExBPmu5bBNSqCzDwjUeidfRUPA@mail.gmail.com>
	<CA+icZUUEExm5Mktxoj6=UdzBe5HUzskktKWdHNOKaFXVHaySBg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:reply-to:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=bLv4q/zAHsfJ8XjvYU8i58N6C4k455bli0d4rzCzgcw=;
        b=pRBx1/RUs1wkMLC3PWyMkcsTFnC6EsxLT8ymi7M4vP6vgpwaMAETu0A8+b/frDRv6r
         TXBqwL4vhFuvMVH8VoILEDqasNoWrpGvTCWvcuaIIkA9G1k49yW3Yz4NuA2nzQjL+vse
         bDwQ2KSVe+F0xqTnMLHQi5vgmPKNsLTrhireNi0w/Xkc6oall66jEItxtnj0nIULnEKM
         QTX5b+L59Wyf/1gODmBnkNd3tMP23RhaH9nm/GflTxYRYEdKahQyFlF1GXqPHlUpIIOH
         SLbvcjqgJdAG/71385pOpplVvKuV5szuHZH2yV9Fa5M1Y6F5P/IFUKIonp043wNI8G3R
         +wDg==
In-Reply-To: <CA+icZUUEExm5Mktxoj6=UdzBe5HUzskktKWdHNOKaFXVHaySBg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Wed, Apr 10, 2013 at 7:53 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Wed, Apr 10, 2013 at 7:41 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> On Tue, Apr 9, 2013 at 6:51 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>> On 9 April 2013 21:38, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>>> With x=3 the system gets in an unuseable state.
>>>>
>>>>      root# echo 0 > /sys/devices/system/cpu/cpu3/online
>>>>
>>>> I could not write my reply and had to do a hard/cold reboot.
>>>> The dmesg log I saw looked similiar to my digicam-shot.
>>>
>>> Few things i need from you. First is output of cpufreq-info. Then
>>> all the steps you did to reproduce above? Removed any other cpus?
>>>
>>
>> Here is the output of cpufreq-info of the stable distro-kernel I am using.
>> If you need the one from the "BROKEN" kernel, please let me know.
>>
>> - Sedat -
>
> Hmm, I see that the kernel-sources itself ships a...
>
> ./tools/power/cpupower/utils/cpufreq-info.c
>
> IIRC current 'make deb-pkg' does not build the tools, but I have seen
> a patch on linux-kbuild ML.

I found this "[RFC PATCH] kbuild: Build linux-tools package with 'make
deb-pkg'" from February 2012.
Can't say what happened to it...

- Sedat -

[1] http://lists.debian.org/debian-kernel/2012/02/msg01009.html

> Can I build cpufreq-info.c afterwards? Do I need a already-compiled build-dir?
>
> Thanks in advance for answering my questions.
>
> BTW, I have found a nice article on LWN "cpupowerutils - cpufrequtils
> extended with quite some features" (see [1]).
>
> - Sedat -
>
> [1] http://lwn.net/Articles/433002/
