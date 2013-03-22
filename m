From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 19:35:19 +0530
Message-ID: <CAKohpongPUY-iQRQm+=x4CTomZ3okX9oipxrxizDBb8uR2s4ng@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
	<3039053.c3U9fYsQRn@vostro.rjw.lan>
	<1479611.koCCfMhmrZ@skinner.arch.suse.de>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<20130322135419.GE30807@pd.tnic>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130322135419.GE30807@pd.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Renninger <trenn@suse.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On 22 March 2013 19:24, Borislav Petkov <bp@alien8.de> wrote:
> No, you're breaking existing drivers with your changes - nobody will fix
> stuff *you're* breaking.
>
> You need to get the hardware and test your changes on *that* hardware
> too. Otherwise, the offending patches should be reverted until you can
> provide a patchset which works on everything.
>
> Geez, the fact that I even need to explain this...

You are right in every sense and i can't defend myself on that, no excuse.

When i wrote those patches, i fixed many drivers and wasn't aware that
acpi-cpufreq got broken. And only with the mail from Duncan i realized it.

Then i tried to go thorough it & fix it and found there is some stuff in init()
which is is sort of per user case dependent. And wasn't sure how exactly
to fix it and so shouted for help.

But yes i will give it another try to go through the driver in details and see
if i can fix it.

--
viresh
