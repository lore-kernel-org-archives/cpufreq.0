From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: More cpufreq breakage
Date: Sat, 23 Mar 2013 20:04:34 +0530
Message-ID: <CAKohpomTBEu1ByjnSw1mbyBhXKTrj=Qte7fBuyaKp+TcOb8d_w@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohpokjpOepnuj3dny+j0UYurVHBZci=BdFa5OxR+e7k-512w@mail.gmail.com>
	<20130323134541.GA10811@pd.tnic>
	<5152799.d8sLDQMJWT@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <5152799.d8sLDQMJWT@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Borislav Petkov <bp@alien8.de>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

On 23 March 2013 19:57, Rafael J. Wysocki <rjw@sisk.pl> wrote:
>> Mar 20 10:14:40 pd vmunix: [34173.698932] Disabling non-boot CPUs ...
>> Mar 20 10:14:40 pd vmunix: [34173.703351] smpboot: CPU 1 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.708298] smpboot: CPU 2 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.712056] smpboot: CPU 3 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.717512] smpboot: CPU 4 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.722044] smpboot: CPU 5 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.728418] smpboot: CPU 6 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.731577] smpboot: CPU 7 is now offline
>> Mar 20 10:14:40 pd vmunix: [34173.732828] PM: Creating hibernation image:
>> Mar 20 10:14:40 pd vmunix: [34174.371451] PM: Need to copy 596216 pages
>> Mar 20 10:14:40 pd vmunix: [34173.879106] Enabling non-boot CPUs ...
>> Mar 20 10:14:40 pd vmunix: [34173.879171] SMP alternatives: lockdep: fixing up alternatives
>> Mar 20 10:14:40 pd vmunix: [34173.879182] smpboot: Booting Node 0 Processor 1 APIC 0x11
>> Mar 20 10:14:40 pd vmunix: [34173.890627] LVT offset 0 assigned for vector 0x400
>> Mar 20 10:14:40 pd vmunix: [34173.893305] ------------[ cut here ]------------
>> Mar 20 10:14:40 pd vmunix: [34173.893321] WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x39c/0x3b0()

>
> This looks like the CPU offline path to me (i.e. the CPU hotplug notifier
> does something fishy).

I think otherwise, Its the cpu online path but this didn't happened for
first boot (probably).

Enabling non-boot CPUs ...

--
viresh
