From: =?UTF-8?B?5L+e6aKQ6LaF?= <yyc1992@gmail.com>
Subject: Re: mistake about the cpufreq?
Date: Fri, 1 Jul 2011 21:17:08 -0400
Message-ID: <BANLkTimgadBqULuQXVdr-=e792b6RZLQSg@mail.gmail.com>
References: <BANLkTin4P7X0gbbShNTQNpV0khq3Bb9PhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=bd+t2Ou/MP7/c10mR8M3OlpGwR8rH4VUjftO/0Oxupo=;
        b=ur6BSMzMzsEy//GIG52FwGBoYTRsEAYogPplO1xlKJV+2JqixyKEyuxUicX2BqOu8R
         L1T/vcuLxUMrZhLxVwYRMrWDEl875slUmuKbXXxk26IMXuW8I0/XX/fYsud3lPZe+J95
         AR1D8G3xyQuBTq1/7MYcCZSjuLUVkm7pBFZnE=
In-Reply-To: <BANLkTin4P7X0gbbShNTQNpV0khq3Bb9PhQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Fri, Jul 1, 2011 at 4:00 PM, =E4=BF=9E=E9=A2=90=E8=B6=85 <yyc1992@gm=
ail.com> wrote:
> The following is what I get when I run the command in
> /sys/devices/system/cpu/cpu0/cpufreq
>
> $ sudo grep "" *
> affected_cpus:0
> bios_limit:800000
> cpuinfo_cur_freq:2800000
> cpuinfo_max_freq:2801000
> cpuinfo_min_freq:800000
> cpuinfo_transition_latency:10000
> related_cpus:0 1
> scaling_available_frequencies:2801000 2800000 2133000 1600000 800000
> scaling_available_governors:conservative ondemand userspace powersave
> performance
> scaling_cur_freq:800000
> scaling_driver:acpi-cpufreq
> scaling_governor:performance
> scaling_max_freq:800000
> scaling_min_freq:800000
> scaling_setspeed:<unsupported>
>
> The problem is basically the scalings is different from cpuinfos. It
> appears when I unplug the power and still there when I have repluged
> the power.
> Does any know what probably the problem is and where can I look for
> more detail information.
>
> some basic info about my computer
>
> $ uname -a
> Linux yuyichao-PC 2.6.39-ARCH #1 SMP PREEMPT Mon Jun 27 21:26:22 CEST
> 2011 x86_64 Intel(R) Core(TM)2 Duo CPU T9600 @ 2.80GHz GenuineIntel
> GNU/Linux
> (The kernel version should be 2.6.39.2)
>
>
> Thanks.
>
> Yichao
>

So after reading the files in cpu-freq/, I saw it was mentioned in
user-guide.txt that the scaling_ ones is what the kernel thinks the
freq is and cpuinfo is the actual freq.
y can these two be different?
