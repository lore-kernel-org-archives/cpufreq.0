From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59481] New: Intel Pstates driver issues, including CPU
 frequency not stepping up enough
Date: Sat,  8 Jun 2013 23:37:16 +0000 (UTC)
Message-ID: <bug-59481-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59481

           Summary: Intel Pstates driver issues, including CPU frequency
                    not stepping up enough
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.10.0-rc4+
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: dsmythies@telus.net
        Regression: No


Created an attachment (id=103961)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=103961)
1 of 4 - CPU always under 100% load between samples

Kernel (from: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git)
doug@s15:~/temp$ uname -a
Linux s15 3.10.0-rc4+ #1 SMP Sat Jun 8 08:48:15 PDT 2013 x86_64 x86_64 x86_64
GNU/Linux
However, much of my testing work was done on a distro specific version of
3.10rc4, and then I confirmed the same results on the above kernel.

Processor:
vendor_id       : GenuineIntel
cpu family      : 6
model           : 42
model name      : Intel(R) Core(TM) i7-2600K CPU @ 3.40GHz
stepping        : 7
microcode       : 0x26

maximum frequency, turbo on = 3.8 GHz = 100%
maximum frequency, turbo off = 2.4 GHz = 100% (when turbo disabled, apparently)
minimum frequency = 1.6 GHz = 42% of max, turbo on or 47% of max, turbo off
(see comments about min freq later)

Note 1: Thermal throttling is not the issue in any of these tests.
Note 2: I realize that can use intel_pstate=disable to be able to do some
things mentioned herein, but I am just trying to help with this driver.
Note 3: I have read everything I could find about this new driver, but that
doesn't mean I didn't miss something important.

Issue 1 (the main issue):

pstate driver conditions:
"powersave"
/sys/devices/system/cpu/intel_pstate/max_perf_pct = 100
/sys/devices/system/cpu/intel_pstate/min_perf_pct = 42
/sys/devices/system/cpu/intel_pstate/no_turbo = 0 or 1, it does not matter

Note: problem does not occur under these conditions:
"performance"
/sys/devices/system/cpu/intel_pstate/max_perf_pct = 100
/sys/devices/system/cpu/intel_pstate/min_perf_pct = 100
/sys/devices/system/cpu/intel_pstate/no_turbo = 0 (1 not tested)

Sometimes (approximately 20% of the time, sample size 1000 tests for each
pstate driver conditions listed above), when a CPU intensive single thread task
is started, the CPU only ramps up to 1.768 GHz instead of the maximum
frequency. When this occurs, more load can be added and added until all CPUs
are fully loaded and the CPU frequency will never increase.

Example (issue occurring):

doug@s15:~/temp$ sudo cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
1768000
1768000
1768000
1768000
1768000
1768000
1768000
1768000

top - 09:56:37 up 51 min,  3 users,  load average: 8.00, 7.99, 6.84
Tasks: 154 total,   9 running, 145 sleeping,   0 stopped,   0 zombie
Cpu0  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu1  : 99.7%us,  0.3%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu2  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu3  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu4  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu5  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu6  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu7  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st

Example (issue not occurring, single CPU (7) loaded):

doug@s15:~/temp$ sudo cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
3672000
3672000
3638000
3774000
3672000
3502000
3604000
3774000  <<<< The active fully loaded CPU

top - 10:00:22 up 55 min,  3 users,  load average: 2.75, 6.29, 6.49
Tasks: 147 total,   2 running, 145 sleeping,   0 stopped,   0 zombie
Cpu0  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu1  :  0.0%us,  0.0%sy,  0.0%ni, 99.7%id,  0.3%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu2  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu3  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu4  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu5  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu6  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu7  :100.0%us,  0.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st

Issue 2:

When turbo is turned off, it seems that max_perf_pct = 100 now means 3.4 GHz
(see test result graphs). So, shouldn't min_perf_pct now become 47 percent (for
my case)? Or, min should always be 47 and max should be 100 for turbo off and
112 for turbo on?

Issue 3:

Sometimes it is desirable to lock the CPU frequencies at some value, at least
when it is active. Now, these settings work fine:

"performance"
/sys/devices/system/cpu/intel_pstate/max_perf_pct = 42
/sys/devices/system/cpu/intel_pstate/min_perf_pct = 42
/sys/devices/system/cpu/intel_pstate/no_turbo = 0 (or 1 with both of the above
set to 47, but leaving them at 42 works also)

But some other settings give odd results, and also seem to depend on if the
numbers are increasing or decreasing and if the CPU was unload or loaded before
the change. This is best described by graphs of the experiments done. Attached.
Potentially of particular interest are the cases were the CPU frequency is
always 1.768 GHz when sampled (5 seconds after the CPU becomes 100% loaded).
For example:

"performance"
/sys/devices/system/cpu/intel_pstate/max_perf_pct = 69
/sys/devices/system/cpu/intel_pstate/min_perf_pct = 69
/sys/devices/system/cpu/intel_pstate/no_turbo = 0

Where we would expect something around 2.6 GHz. I also tested loading other
CPUs at the same time, and could never get any other frequency (tested about
100 times, in addition to the 24 done to make the graphs)(Correction: a few
times the CPU kicked up in frequency, but just after the sample was taken, and
I think because of the action of either waking up to take the sample or
whatever).

Sub-experiment: Take another frequency sample after another couple of seconds,
to get an accurate count of how many times out of 100 it kicks up after the
first sample: Results: 3 times out of 100.
Sub-sub-experiment: Does the CPU kick up because the controlling script came
out of sleep, or is it because it reads
/sys/devices/system/cpu/cpu7/cpufreq/cpuinfo_cur_freq? Result: Inconclusive
(Will try to think of a better test and test more later, if required. Might
require a larger sample size).

To be clear, it is not best effieciency wanted here, it is knowing that the
active CPU frequency will always be the same. An example application is the
test procedure to make sure that reported load averages are correct.

Issue 4:

It appears as though there is a slight rounding down effect in the reported
frequencies. Wouldn't we at least expect turbostat to give the same numbers?
Example:

doug@s15:~/temp$ sudo cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
3468000
3468000
3468000
3468000
3468000
3468000
3468000
3468000

doug@s15:~/temp$ sudo ./turbostat
 cr CPU    %c0  GHz  TSC    %c1    %c3    %c6    %c7  %pc2  %pc3  %pc6  %pc7
         100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   0   0 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   0   4 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   1   1 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   1   5 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   2   2 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   2   6 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   3   3 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00
   3   7 100.00 3.51 3.41   0.00   0.00   0.00   0.00  0.00  0.00  0.00  0.00

Issue 5: (actually just an opinion, and at the risk of raising an issue that
seems to have been brought up a lot)

Why wasn't what is now called "powersave" called "ondemand" (or "conservative"
if preferred), as it is similar? Then "powersave" could have been as it was,
namely:
"powersave"
/sys/devices/system/cpu/intel_pstate/max_perf_pct = 42
/sys/devices/system/cpu/intel_pstate/min_perf_pct = 42
/sys/devices/system/cpu/intel_pstate/no_turbo = 0 (or 1 with both of the above
set to 47)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
