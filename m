From: Carl Wenninger <charles@carl-wenninger.de>
Subject: ACPI-CPUFREQ problem on VIA C7-D 1800 MHz
Date: Sun, 01 Aug 2010 16:36:59 +0200
Message-ID: <4C55868B.6070901@carl-wenninger.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org
Cc: Tim Mager <tim.mager@himmer.de>


Hello,

I run a stock 2.6.34.1 kernel on a VIOTECH 3100+ board with a

    CPU: Centaur VIA C7-D Processor 1800MHz stepping 00

Having compiled acpi-cpufreq as a module, the system boots up with no 
cpufreq driver, i.e. at 1800 MHz. Here my heavily cpu-bound test 
application takes 0.43s to complete.

After "modprobe acpi_cpufreq" (with default governor = userspace) the 
system still claims to run on 1800MHz, but my test app now needs 0.97s 
to complete. I.e. the system runs in fact on a reduced speed, 
presumeably on 800 MHz. (The system is supposed to support 2 P-States: 
1800 and 800 MHz).

Changing frequency down to 800 MHz via 
    /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
changes the indicated frequency in scaling_cur_freq and /proc/cpuinfo,
but has absolutly no effect on the runtime of my test app: still 0.97s
Changing back to 1800 MHz again changes the indicated frequencies, but 
has no effect on cpu performance.

I'd be happy to provide any further technical information you may require.

Rgds
Carl


