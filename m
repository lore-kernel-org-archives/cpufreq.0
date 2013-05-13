From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell
 XPS 12)
Date: Mon, 13 May 2013 09:18:32 +0530
Message-ID: <CAOh2x=m6VRk_PtuQV-zkW_8JGq8TyyGxiLeU+Y2phHJsswsxLg@mail.gmail.com>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
	<20130512165508.B641A11FA4C@bugzilla.kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=TiNNzcMO4XFnX1jfOIZWWLeRsCU6jlALUOeTiohyVbM=;
        b=f0qpvQYi8FFtYGEdkCBh2aL8qQMdzgHzbh+aepGjPxcyuBOps7uFSInwiNc0nPb7Qf
         uRph4GTcomad8gl1J8VMBE0qHVw6NMpRi0ckt1XcyUdqIqro4VFSqm7LQr1g+Zf0IFdi
         E1bxK1cS3t5e3MVJX4lAKhzE285sPCvF1VvniFxi0jpbM5nKgZKMVEt6myja8wt4FzTL
         tpfRonVVifBkUTapMKRrXIk12dbhCJEUR6/Oo6yeOweodttZCh/isC7u5JriTdkU4gAD
         ASmvL4kYaIJNBGpglwrCkpjtHpbtnMsvsvx2Kwsp64haxEQ+knouNawYVM9rYTMfnOWc
         e7FQ==
In-Reply-To: <20130512165508.B641A11FA4C@bugzilla.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bugzilla-daemon@bugzilla.kernel.org
Cc: cpufreq@vger.kernel.org

On Sun, May 12, 2013 at 10:25 PM,  <bugzilla-daemon@bugzilla.kernel.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=58001
>
>
>
>
>
> --- Comment #2 from Jean-Yves Lefort <jylefort@gmail.com>  2013-05-12 16:55:08 ---
> There is no such tool on my system (Fedora 18), I assume this is the same:
>
> $ cpupower -c all frequency-info
> analyzing CPU 0:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 0
>   maximum transition latency: 10.0 us.
>   hardware limits: 800 MHz - 2.00 GHz
>   available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
> 1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
> 800 MHz
>   available cpufreq governors: conservative, userspace, powersave, ondemand,
> performance
>   current policy: frequency should be within 800 MHz and 2.00 GHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 800 MHz.
>   boost state support:
>     Supported: yes
>     Active: yes
>     25500 MHz max turbo 4 active cores
>     25500 MHz max turbo 3 active cores
>     25500 MHz max turbo 2 active cores
>     25500 MHz max turbo 1 active cores
> analyzing CPU 1:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 1
>   maximum transition latency: 10.0 us.
>   hardware limits: 800 MHz - 2.00 GHz
>   available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
> 1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
> 800 MHz
>   available cpufreq governors: conservative, userspace, powersave, ondemand,
> performance
>   current policy: frequency should be within 800 MHz and 2.00 GHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 800 MHz.
>   boost state support:
>     Supported: yes
>     Active: yes
>     25500 MHz max turbo 4 active cores
>     25500 MHz max turbo 3 active cores
>     25500 MHz max turbo 2 active cores
>     25500 MHz max turbo 1 active cores
> analyzing CPU 2:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 2
>   maximum transition latency: 10.0 us.
>   hardware limits: 800 MHz - 2.00 GHz
>   available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
> 1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
> 800 MHz
>   available cpufreq governors: conservative, userspace, powersave, ondemand,
> performance
>   current policy: frequency should be within 800 MHz and 2.00 GHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 800 MHz.
>   boost state support:
>     Supported: yes
>     Active: yes
>     25500 MHz max turbo 4 active cores
>     25500 MHz max turbo 3 active cores
>     25500 MHz max turbo 2 active cores
>     25500 MHz max turbo 1 active cores
> analyzing CPU 3:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 3
>   maximum transition latency: 10.0 us.
>   hardware limits: 800 MHz - 2.00 GHz
>   available frequency steps: 2.00 GHz, 2.00 GHz, 1.90 GHz, 1.80 GHz, 1.70 GHz,
> 1.60 GHz, 1.50 GHz, 1.40 GHz, 1.30 GHz, 1.20 GHz, 1.10 GHz, 1000 MHz, 900 MHz,
> 800 MHz
>   available cpufreq governors: conservative, userspace, powersave, ondemand,
> performance
>   current policy: frequency should be within 800 MHz and 2.00 GHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 800 MHz.
>   boost state support:
>     Supported: yes
>     Active: yes
>     25500 MHz max turbo 4 active cores
>     25500 MHz max turbo 3 active cores
>     25500 MHz max turbo 2 active cores
>     25500 MHz max turbo 1 active cores

Can you give a try with 3.9 kernel?
