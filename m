From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Wed, 9 Mar 2011 17:09:30 GMT
Message-ID: <201103091709.p29H9Uoo003954@demeter2.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #15 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-09 17:09:30 ---
With CONFIG_X86_TSC disabled, using the TSC is still possible from userland via
prctl :

# gcc disable-tsc-test.c -o test
# ./test 
rdtsc() == 1221707443605
prctl(PR_GET_TSC, &tsc_val); tsc_val == PR_TSC_ENABLE
rdtsc() == 1221707595418
prctl(PR_SET_TSC, PR_TSC_ENABLE)
rdtsc() == 1221707621154
prctl(PR_SET_TSC, PR_TSC_SIGSEGV)
rdtsc() == [ SIG_SEGV ]
prctl(PR_GET_TSC, &tsc_val); tsc_val == PR_TSC_SIGSEGV
prctl(PR_SET_TSC, PR_TSC_ENABLE)
rdtsc() == 1221707702746

----------------------------------------------------------------

I get an incorrect bogomips evaluation in /proc/cpuinfo, about ahalf of what
should be reported. TSC is of course not available as a clocksource and there
are now TSC related messages in dmesg. However, I can find oops like these in
early dmesg

[    0.020000] Calibrating delay loop... 1795.68 BogoMIPS (lpj=8978432)
[    0.290000] ------------[ cut here ]------------
[    0.290000] WARNING: at
/home/larchey/linux-2.6.32-ovz/arch/x86/include/asm/tsc.h:27
calibrate_delay+0x291/0x367()
[    0.290000] Hardware name: KM266-8235
[    0.290000] Modules linked in:
[    0.290000] Pid: 0, comm: swapper Not tainted 2.6.32.25-ovz-notsc-hard #4
[    0.290000] Call Trace:
[    0.290000]  [<c129240c>] ? printk+0x18/0x1c
[    0.290000]  [<c102498d>] warn_slowpath_common+0x6d/0xa0
[    0.290000]  [<c13c1e7b>] ? calibrate_delay+0x291/0x367
[    0.290000]  [<c13c1e7b>] ? calibrate_delay+0x291/0x367
[    0.290000]  [<c10249d5>] warn_slowpath_null+0x15/0x20
[    0.290000]  [<c13c1e7b>] calibrate_delay+0x291/0x367
[    0.290000]  [<c13a631e>] ? tsc_init+0xf/0x186
[    0.290000]  [<c103e9bb>] ? ktime_get+0x5b/0xf0
[    0.290000]  [<c13a0652>] start_kernel+0x244/0x2b3
[    0.290000]  [<c13a01a2>] ? unknown_bootoption+0x0/0x193
[    0.290000]  [<c13a009e>] i386_start_kernel+0x9e/0xa5
[    0.290000] ---[ end trace 4eaa2a86a8e2da22 ]---
[    0.300000] Cycles are stuck! Some statistics will not be available.

--------------------------------------------------------------------------------

# ls  /proc/acpi/processor/*/power
/proc/acpi/processor/CPU0/power
# cat /proc/acpi/processor/*/power
active state:            C0
max_cstate:              C1
maximum allowed latency: 2000000000 usec
states:
    C1:                  type[C1] promotion[--] demotion[--] latency[000]
usage[00000000] duration[00000000000000000000]

--------------------------------------------------------------------------------

# ls -al /sys/devices/system/cpu/cpu*/cpuidle/state*/*
ls: cannot access /sys/devices/system/cpu/cpu*/cpuidle/state*/*: No such file
or directory

# cat /sys/devices/system/cpu/cpuidle/current_driver 
acpi_idle

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
