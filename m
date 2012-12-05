From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Wed, 05 Dec 2012 15:28:10 -0500
Message-ID: <50BFAE5A.1010809@verisign.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: dirk.brandewie@gmail.com
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com, arjan@linux.intel.com


Dirk,

I applaud the work you are doing.  In general I believe it is important=
 to separate policy (governor and its settings) from the driver, partic=
ularly so as different end-users have very different goals for power ma=
nagement.  Not everyone is trying to maximize performance per watt per =
se (in fact probably rather few end users are doing so literally).  In =
server applications, for example, the first priority is typically maxim=
um performance when under heavy load, and the second priority is minimu=
m power consumption at idle.  There may not ever be a benefit for choos=
ing one of the middle clock states.  The OnDemand governor with the sam=
pling_down_factor set to ~100 can do quite well at this, at least compa=
red to implementations prior to yours.  Another consideration is that j=
ust blindly trying to run flat out all the time (e.g. the old performan=
ce governor approach) bumps you up against your thermal limits and can =
actually slow you down, vs. intelligently powersaving idle hardware
threads -- so a user who totally aims for performance with no regard fo=
r power savings cannot avoid must paying some attention to power manage=
ment.

So what you have sounds like both a new driver (very important) and a n=
ew governor (also potentially very useful), with some of the dynamic po=
rtions of power management handled by the hardware itself.  Ideally the=
 new driver would be separated from the new governor in a somewhat modu=
lar way (so that implementation and policy can be separated).  And idea=
lly it would be nice if the new driver can be compatible with the exist=
ing governor by exposing an ability to set and report current frequenci=
es.  But if this is impractical or pointless for Sandy Bridge, so be it=
=2E  I expect your new governor probably could not sit on top of any of=
 the existing drivers, but some of the existing drivers could perhaps b=
e enhanced to provide the necessary hooks, and it would be bad to have =
to implement the same policy framework over and over for all past and f=
uture hardware drivers that want to benefit from your work.  So outside=
 of a research kernel, I don't think having a "cpufreq/snb" directory
is a good place to expose tuning parameters, the exposed interface shou=
ld be generalized as much as possible and not be so implementation-spec=
ific.  In the long run both integrators and maintainers of Linux distri=
butions are going to insist on a generic interface that can work across=
 the vast majority of modern hardware, rather than cater to a special c=
ase that only works on one or CPU families, even if those families are =
particularly important ones.

David C Niemi


On 12/05/12 14:01, dirk.brandewie@gmail.com wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> This driver provides a P state driver for Sandybridge and Ivybridge
> processors.
> =20
> Motivation:
> The goal of this driver is to improve the power efficiency of
> Sandybridge/Ivybridge based systems.  As the investigation into how t=
o
> achieve this goal progressed it became apparent (to me) that some of =
the
> design assumptions of the cpufreq subsystem are no longer valid and
> that a micro-architecure specific P state driver would be less comple=
x
> and potentially more effiecent.  As Intel continues to innovate in th=
e
> area of freqency/power control this will become more true IMHO.
>
> General info:
> The driver uses a PID controller to adjust the core frequency based o=
n
> the presented load. The driver exposes the tuning parameters for the
> controller in the /sys/devices/system/cpu/cpufreq/snb directory.  The
> controller code is being used in PI mode with the default tuning
> parmeters.
>
> Tuning parmeters:
>    setpoint - load in percent on the core will attempt to maintain.=09
>    sample_rate_ms - rate at which the driver will sample the load on =
the core.=20
>    deadband  - percent =C2=B1 around the setpoint the controller will
>                consider zero error.
>    p_gain_pct - Proportional gain in percent.=20
>    i_gain_pct - Integral gain in percent.=20
>    d_gain_pct - Derivative gain in percent
>
> To use the driver as root run the following shell script:
>    #!/bin/sh
>    for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
>    do=20
>       echo snb > $file
>    done
>
> Limitations:
>
> ATM this driver will only run on SandyBridge systems testing on
> Ivybridge systems is not complete.
> =20
> Open Questions:
>
> What is the correct way to integrate this driver into the system?  Th=
e
> current implementation registers as a cpufreq frequency governor, thi=
s
> was done to streamline testing using cpufreq to load/unload governors=
=2E
>
> What tuning parameters should be exposed via sysfs (if any)?  ATM all
> the PID parameters are exposed to enable tuning of the driver.
>
=2E...

