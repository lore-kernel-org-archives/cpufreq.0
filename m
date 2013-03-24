From: Duncan <1i5t5.duncan@cox.net>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Sun, 24 Mar 2013 04:49:27 -0700
Message-ID: <20130324044927.6a2b1588@ws>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
	<2581491.irn18K9zaF@hammer82.arch.suse.de>
	<CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
	<CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/6bfjDwyzZp9GaF9vcrB.n6G"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

--MP_/6bfjDwyzZp9GaF9vcrB.n6G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, 24 Mar 2013 15:32:39 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> Hi Duncan,
> 
> Please reply to this mail rather than using bugzilla as all others
> might not be following bugzilla rerport.

Thanks.  I'm used to it being the other way 'round.

> >> [PATCH] cpufreq: acpi-cpufreq: Set policy->cpus correctly
> >> from .init()
> >
> > You appear to be on the right path as all the dirs and symlinks are
> > there now, but it looks like you'll need a v2 as the order/pairing
> > is now very strange, both as booted and after a s2ram/resume (which
> > changes the order but it's still strange):

> Hmm.. Can you try one thing? Run 3.8 over your machine and give
> output of cpufreq-info and ls -ld after boot and resume..
> 
> I would like to see what's the original behavior.

Good idea! =:^)  It now appears that your bug simply cascaded on a
previously unreported bug in earlier kernels.

The 3.8 ls -dl isn't too interesting as they were all dirs not symlinks
then, and if they hadn't stuck around after a suspend/resume I'd have
definitely noticed and reported the bug back then, but it's still
useful to confirm.

The 3.8 pre-suspend and post resume ls -dl are identical -- no missing
dirs (and no symlinks):

/sys/devices/system/cpu/cpu0/cpufreq/
/sys/devices/system/cpu/cpu1/cpufreq/
/sys/devices/system/cpu/cpu2/cpufreq/
/sys/devices/system/cpu/cpu3/cpufreq/
/sys/devices/system/cpu/cpu4/cpufreq/
/sys/devices/system/cpu/cpu5/cpufreq/

The interesting results are the 3.8 cpufreq-info.  I'll attach the full
output, but here's the interesting bit:

3.8 pre-suspend cpufreq-info excerpts (nicely paired, as are the
pre-patch pre-suspend results for 3.9-rc):

analyzing CPU 0:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
analyzing CPU 1:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
analyzing CPU 2:
  CPUs which run at the same hardware frequency: 2 3
  CPUs which need to have their frequency coordinated by software: 2
analyzing CPU 3:
  CPUs which run at the same hardware frequency: 2 3
  CPUs which need to have their frequency coordinated by software: 3
analyzing CPU 4:
  CPUs which run at the same hardware frequency: 4 5
  CPUs which need to have their frequency coordinated by software: 4
analyzing CPU 5:
  CPUs which run at the same hardware frequency: 4 5
  CPUs which need to have their frequency coordinated by software: 5

3.8 post-resume (screwed up pairing, so that bit's not a 3.9 thing, I
just noticed it in 3.9 due to the now missing symlinks/dirs):

analyzing CPU 0:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
analyzing CPU 1:
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
analyzing CPU 2:
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
analyzing CPU 3:
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
analyzing CPU 4:
  CPUs which run at the same hardware frequency: 2 4
  CPUs which need to have their frequency coordinated by software: 4
analyzing CPU 5:
  CPUs which run at the same hardware frequency: 3 5
  CPUs which need to have their frequency coordinated by software: 5

-- 
Duncan - No HTML messages please, as they are filtered as spam.
"Every nonfree program has a lord, a master --
and if you use the program, he is your master."  Richard Stallman
--MP_/6bfjDwyzZp9GaF9vcrB.n6G
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=cpufreq-info.3.8.pre

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.20%, 2.40 GHz:0.16%, 1.80 GHz:0=
.20%, 1.40 GHz:99.44%  (4)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.03%, 3.00 GHz:0.14%, 2.40 GHz:0.18%, 1.80 GHz:0=
.35%, 1.40 GHz:99.29%  (6)
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2 3
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.15%, 2.40 GHz:0.15%, 1.80 GHz:0=
.17%, 1.40 GHz:99.54%  (4)
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.04%, 3.00 GHz:0.11%, 2.40 GHz:0.22%, 1.80 GHz:0=
.18%, 1.40 GHz:99.45%  (4)
analyzing CPU 4:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 4 5
  CPUs which need to have their frequency coordinated by software: 4
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.17%, 2.40 GHz:0.30%, 1.80 GHz:0=
.20%, 1.40 GHz:99.34%  (4)
analyzing CPU 5:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 4 5
  CPUs which need to have their frequency coordinated by software: 5
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.22%, 2.40 GHz:0.15%, 1.80 GHz:0=
.30%, 1.40 GHz:99.33%  (4)

--MP_/6bfjDwyzZp9GaF9vcrB.n6G
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=cpufreq-info.3.8.post

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.04%, 2.40 GHz:0.03%, 1.80 GHz:0=
.04%, 1.40 GHz:99.89%  (6)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.00%, 2.40 GHz:0.08%, 1.80 GHz:0=
.04%, 1.40 GHz:99.88%  (3)
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.00%, 2.40 GHz:0.00%, 1.80 GHz:0=
.76%, 1.40 GHz:99.24%  (2)
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.04%, 2.40 GHz:0.04%, 1.80 GHz:0=
.15%, 1.40 GHz:99.77%  (4)
analyzing CPU 4:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 2 4
  CPUs which need to have their frequency coordinated by software: 4
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.02%, 3.00 GHz:0.03%, 2.40 GHz:0.02%, 1.80 GHz:0=
.21%, 1.40 GHz:99.71%  (4)
analyzing CPU 5:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 3 5
  CPUs which need to have their frequency coordinated by software: 5
  maximum transition latency: 4.0 us.
  hardware limits: 1.40 GHz - 3.60 GHz
  available frequency steps: 3.60 GHz, 3.00 GHz, 2.40 GHz, 1.80 GHz, 1.40 G=
Hz
  available cpufreq governors: conservative, performance
  current policy: frequency should be within 1.40 GHz and 3.60 GHz.
                  The governor "conservative" may decide which speed to use
                  within this range.
  current CPU frequency is 1.40 GHz.
  cpufreq stats: 3.60 GHz:0.00%, 3.00 GHz:0.04%, 2.40 GHz:0.03%, 1.80 GHz:0=
.12%, 1.40 GHz:99.81%  (4)

--MP_/6bfjDwyzZp9GaF9vcrB.n6G--
