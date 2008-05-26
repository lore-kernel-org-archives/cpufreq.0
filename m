From: Arkadiusz Miskiewicz <arekm@maven.pl>
Subject: Re: cpufreq limits avilable frequencies to 800MHz on git kernel
Date: Mon, 26 May 2008 09:07:05 +0200
Message-ID: <200805260907.05561.arekm@maven.pl>
References: <200805231944.57320.arekm@maven.pl> <200805251136.24313.arekm@maven.pl> <1211727835.3422.36.camel@linux-2bdv.site>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754338AbYEZHHt@vger.kernel.org>
In-Reply-To: <1211727835.3422.36.camel@linux-2bdv.site>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org, trenn@suse.de
Cc: cpufreq@lists.linux.org.uk, Andrew Morton <akpm@linux-foundation.org>, gnorton@novell.com, miguel@novell.com

On Sunday 25 May 2008, Thomas Renninger wrote:
> On Sun, 2008-05-25 at 11:36 +0200, Arkadiusz Miskiewicz wrote:
> > On Saturday 24 May 2008, Andrew Morton wrote:
> > > On Fri, 23 May 2008 19:44:57 +0200 Arkadiusz Miskiewicz
> > > <arekm@maven.pl>
> >
> > wrote:
> > > > thinkpad z60m, Intel(R) Pentium(R) M processor 2.00GHz. kernel =
from
> > > > git from 1-2 days ago.
> > > >
> > > > Unfortunately it seems that suspend to ram/resume causes freque=
ncy
> > > > to be limited to 800MHz only. I can't set it to 2GHz again :-/
> > > >
> > > > scaling_max_freq is then 800000 and cannot be changed.
> > > >
> > > > reboot and the problem disappears until new suspend/resume cycl=
e.
> > > >
> > > > cpufreq stuff is driven by acpi-cpufreq
> > > >
> > > > $ cpufreq-info
> > > > cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
> > > > Report errors and bugs to linux@brodo.de, please.
> > > > analyzing CPU 0:
> > > >   driver: acpi-cpufreq
> > > >   CPUs which need to switch frequency at the same time: 0
> > > >   hardware limits: 800 MHz - 2.00 GHz
> > > >   available frequency steps: 2.00 GHz, 1.60 GHz, 1.33 GHz, 1.07=
 GHz,
> > > > 800 MHz available cpufreq governors: powersave, userspace, onde=
mand,
> > > > performance current policy: frequency should be within 800 MHz =
and
> > > > 800 MHz. The governor "performance" may decide which speed to u=
se
> > > > within this range.
> > > >   current CPU frequency is 800 MHz.
> > > >
> > > > /sys/devices/system/cpu/cpu0/cpufreq/affected_cpus:0
> > > > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:800000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:2000000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:800000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/related_cpus:0
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequenc=
ies:20
> > > >0000 0 1600000 1333000 1066000 800000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governor=
s:powe
> > > >rsav e userspace ondemand performance
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:800000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:acpi-cpufre=
q
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:performan=
ce
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:800000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:800000
> > > > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:<unsuppor=
ted>
> > >
> > > Thanks.  Is this a newly-occurring bug or did earlier kernels do =
this
> > > also?
> > >
> > > If it was newly added, do you know in which kernel version we mig=
ht
> > > have added it?
> >
> > I wasn't able to reproduce the problem on final 2.6.24 but was able=
 to
> > reproduce on final 2.6.25. Problem introduced somewhere between it =
seems.
> >
> > Note that 2-3 suspend to ram/resume cycles is needed to get into th=
e
> > problem.
>
> Sounds related to:
> =EF=BB=BF[Bug 374099] T61p speedstep problems (ondemand scheduler)
> =EF=BB=BFhttps://bugzilla.novell.com/show_bug.cgi?id=3D374099

login/pass protected

>
> Miguel speaks from "good boots" and "bad boots".

Actually I also got "bad boot" (so no suspend/resume was needed).

>
> Could you check whether the OS thinks it is too hot.
> =EF=BB=BFI described some basics how to monitor temperature and cpufr=
eq (if
> passive cooling kicks in) here:
> https://bugzilla.novell.com/show_bug.cgi?id=3D387702#c13

Doesn't seem to be overheated

[arekm@tarm ~]$ cat /proc/acpi/thermal_zone/*/{temperature,trip_points,=
state}; cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_{cur_freq,max_=
freq}
temperature:             45 C
critical (S5):           99 C
passive:                 95 C: tc1=3D5 tc2=3D4 tsp=3D600 devices=3D CPU
state:                   ok
800000
800000

but still limited to 800MHz.

>
> Hmm, it may just have been fixed by this one:
> =EF=BB=BFcommit e56a727b023d40d1adf660168883f30f2e6abe0a
> Author: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> Date:   Mon Apr 28 15:13:43 2008 -0400
>
> Miguel, Geoff: This is already in 11.0 for some time and in 10.3 for
> some days.

Unfortunately it doesn't fix the problem. The patch is in Linus tree fo=
r long
time (so I guess I had it when initially reporting the problem) + I upg=
raded
today to current git - the problem is still there.

>        Thomas

--=20
Arkadiusz Mi=C5=9Bkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
