From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Questions about Runtime PM
Date: Mon, 28 Oct 2013 15:16:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1310281512460.1246-100000@iolanthe.rowland.org>
References: <EMEW3|116e69362a474a99eb7966986654fb49p9RFXO07lm15g10|ecs.soton.ac.uk|526E83A9.8000703@ecs.soton.ac.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <EMEW3|116e69362a474a99eb7966986654fb49p9RFXO07lm15g10|ecs.soton.ac.uk|526E83A9.8000703@ecs.soton.ac.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luis Alfonso Maeda-Nunez <lm15g10@ecs.soton.ac.uk>
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl

On Mon, 28 Oct 2013, Luis Alfonso Maeda-Nunez wrote:

> Hi,
> 
> I am a PhD student at University of Southampton, and I am doing research 
> regarding Power Management working with the BeagleBoard-xM, specifically 
> using DVFS (or the CPUFREQ Governors). I am having a problem using Power 
> Management, and would like to ask if you could help me with it.
> 
> I am using Ubuntu 12.04 and a Linux Kernel 3.7.10-x10.
> 
> The CPU Frequency governor seems to work fine on its own (performance, 
> ondemand, conservative, etc.), but the Runtime PM driver sends the CPU 
> to sleep arbitrarily.

Runtime PM does not affect CPUs; it only affects devices.

> Reading through the documentation of Runtime PM it 
> sends the processor (or any device) to sleep after a period of idleness. 
> In my system, however, as I am running a benchmark (fft from MiBench) in 
> a loop, suddenly the processor is sent to a low power mode (without 
> being idle). I looked at the traces (attached to this email) and it just 
> goes to C1 (I believe it's for ACPI).

I don't understand how a CPU can go into a low-power mode like C1 
without being idle.  By definition, when the CPU isn't in C0, it isn't 
doing any work.

> After reading on Runtime PM I modified the following parameters from 
> "auto" to "on", which meant that it would be disabled.
> 
> /sys/devices/system/cpu/cpu0/power/control
> /sys/devices/system/cpu/power/control
> /sys/devices/platform/mpu.0/power/control
> /sys/devices/ARMv7\ Cortex-A8/power/control
> /sys/devices/software/power/control
> /sys/devices/platform/power/control
> /sys/devices/platform/arm-pmu/power/control

None of those settings actually affect anything.

> Is there a way to disable Runtime PM on the kernel? Using 
> menuconfig/gconfig there is an option:
> "Run-time PM core functionality: CONFIG_PM_RUNTIME."
> but it cannot be disabled (not at least with the configuration for using 
> the BeagleBoard).
> 
> I went to pm_debug fs and changed:
> echo 0 > mpu_pwrdm/suspend
> echo 0 > iva2_pwrdm/suspend
> echo 0 > neon_pwrdm/suspend
> 
> with no luck.
> 
> Is there a way to stop Runtime PM from putting the processor to sleep?

Runtime PM never puts processors to sleep.  Other things do affect 
processors, however.  In addition to cpufreq, you should take a look at 
cpuidle.

Alan Stern

