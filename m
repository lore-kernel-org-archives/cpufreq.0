From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Mon, 6 Sep 2010 10:22:11 GMT
Message-ID: <201009061022.o86AMBdr006864@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #14 from Thomas Renninger <trenn@suse.de>  2010-09-06 10:22:10 ---
> Thomas, do you need me to enable cpufreq.debug=7 and upload the results
I fear there won't be much usable info for your problem with this debug
setting.

> My usual CPUfreq .config section looks like this:
Interesting, you compile in everything. No idea, why it should make a
difference yet, but it should be a difference to most other distro .config
setups.

> I'm going to download 2.6.27.32 and the latest 2.6.36-rc now
Great. Do you compile the kernels yourself or do you have the affected one
compiled yourself?
If yes, it's not that much of work to add some printks into the ondemand
governor. The relevant parts would be in drivers/cpufreq/cpufreq_ondemand.c
dbs_check_cpu(..):
printing out all kind of idle/load/wall_time, better too much as missing
something is a good idea.
You'll get a lot output if ondemand is running then, but you could limit it by
switching governors, e.g. this should limit output to one sec:
---
#/bin/bash

cat /dev/zero >/dev/null &
cat /dev/zero >/dev/null &
for x in /sys/devices/system/cpu/cpu0/cpufreq/*;do echo performance
>$x/scaling_governor;done
logger "XXXX: Here starts my ondemand test in /var/log/messages"
for x in /sys/devices/system/cpu/cpu0/cpufreq/*;do echo ondemand
>$x/scaling_governor;done
sleep 1;
for x in /sys/devices/system/cpu/cpu0/cpufreq/*;do echo performance
>$x/scaling_governor;done
logger "YYYY: Here ends my ondemand test in /var/log/messages"
killall cat
---
(could have typos, did not run above)

The problem does not sound HW/BIOS related. It more looks like a kernel bug
which slipped in at a specific version, possibly together with some of your
.config specifics -> otherwise there should exist more reports.

> I just need to check if the ondemand governor works "out of the box" with the
> other kernels?
Yep, if we have non-/working versions to compare that would make things a lot
easier.

Another idea: You could adopt a bit our CONFIG_CPU_FREQ* settings which are
more modular, possibly this gives us a hint why your system has issues:
#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
# CONFIG_CPU_FREQ_DEBUG is not set
CONFIG_CPU_FREQ_STAT=m
CONFIG_CPU_FREQ_STAT_DETAILS=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=m
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m

CONFIG_X86_ACPI_CPUFREQ=m
==============

CONFIG_CPU_FREQ_STAT=m
and not loading the module sounds like a good idea...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
