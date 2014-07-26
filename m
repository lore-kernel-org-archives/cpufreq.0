From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81131] New: Not found this subsystem directory
 /sys/devices/system/cpu/cpufreq
Date: Sat, 26 Jul 2014 04:39:47 +0000
Message-ID: <bug-81131-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=81131

            Bug ID: 81131
           Summary: Not found this subsystem directory
                    /sys/devices/system/cpu/cpufreq
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.15.6
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: no111u3@gmail.com
        Regression: No

My board is XAM3359-Beaglebone Black.
I'm using specify utils - cpufrequtils, but in new kernel 3.15.6 this util's
can't work: control directory in sysfs /sys/devices/system/cpu/cpufreq does not
exists.

My configuration for cpufreq in this kernel:

jane linux-3.15.6 # cat .config | grep -i freq
CONFIG_ARCH_HAS_CPUFREQ=y
# CPU Frequency scaling
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_STAT_DETAILS=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=m
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
# ARM CPU frequency scaling drivers
# CONFIG_ARM_KIRKWOOD_CPUFREQ is not set
CONFIG_ARM_OMAP2PLUS_CPUFREQ=y
CONFIG_PM_DEVFREQ=y
# DEVFREQ Governors
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=m
CONFIG_DEVFREQ_GOV_USERSPACE=m
# DEVFREQ Drivers

This config is analogie to config for oldest patched kernels (3.8.13, 3.13.6+)
but not working.

-- 
You are receiving this mail because:
You are the assignee for the bug.
