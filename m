From: aash29 <aash29@gmail.com>
Subject: cpu frequencies are lowered, reason unknown
Date: Fri, 6 Jan 2012 11:48:38 +0000 (UTC)
Message-ID: <loom.20120106T122029-71@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Greetings,
I encountered a problem on my ASUS 625 laptop:
after I unplug AC cable, in about 1-2 minutes cpu0 frequencies are lowered to 
800 MHz (usually, it sometimes shortly rises to 1.5GHz). Maximum frequency is 
2.1 GHz.
I uninstalled all frequency-controlling daemons and programs, 
but this behaviour persists. After watching /sys/devices/system/cpu/cpu0/
 files, I saw that scaling_max_freq is lowered to 840000 at this time. When I 
edit this file, the value is immediately reversed.
 Unfortunately my BIOS has no freq scaling options whatsoever, so
 I cannot turn it off to test, but I'd rather have no scaling at 
all than work at 1/3 power. I tried adding processor.ignore_ppc=1 
to boot command line, but this resulted in nothing. bios_limit
 value is, as expected, 2100000.

Which logs could be useful? I include excerpts from kernel.log which seem 
relevant


Jan  6 14:46:46 localhost kernel: [    0.000000] Initializing cgroup subsys 
cpuset
Jan  6 14:46:46 localhost kernel: [    0.000000] Initializing cgroup subsys cpu
Jan  6 14:46:46 localhost kernel: [    0.000000] Linux version 3.1.6-1-ARCH 
(tobias@T-POWA-LX) (gcc version 4.6.2 20111125 (prerelease) (GCC) ) #1 SMP 
PREEMPT Thu Dec 22 08:52:33 UTC 2011
Jan  6 14:46:46 localhost kernel: [    0.000000] Notice: NX (Execute Disable) 
protection cannot be enabled: non-PAE kernel!
Jan  6 14:46:46 localhost kernel: [    0.000000] DMI 2.6 present.
Jan  6 14:46:46 localhost kernel: [    0.000000] DMI: Hewlett-Packard HP 
625/1475, BIOS 68DVA Ver. F.01 05/24/2010

Jan  6 14:46:46 localhost kernel: [    0.003727] CPU: Physical Processor ID: 0
Jan  6 14:46:46 localhost kernel: [    0.003730] CPU: Processor Core ID: 0
Jan  6 14:46:46 localhost kernel: [    0.003734] mce: CPU supports 6 MCE banks
Jan  6 14:46:46 localhost kernel: [    0.003743] using AMD E400 aware idle 
routine
Jan  6 14:46:46 localhost kernel: [    0.004601] ACPI: Core revision 20110623
Jan  6 14:46:46 localhost kernel: [    0.013344] ftrace: allocating 15589 
entries in 31 pages
Jan  6 14:46:46 localhost kernel: [    0.016734] Enabling APIC mode:  Flat.  
Using 1 I/O APICs
Jan  6 14:46:46 localhost kernel: [    0.017029] ..TIMER: vector=0x30 apic1=0 
pin1=2 apic2=-1 pin2=-1
Jan  6 14:46:46 localhost kernel: [    0.052918] CPU0: AMD Athlon(tm) II P320 
Dual-Core Processor stepping 03
Jan  6 14:46:46 localhost kernel: [    0.053330] Performance Events: AMD PMU 
driver.
Jan  6 14:46:46 localhost kernel: [    0.053330] ... version:                0
Jan  6 14:46:46 localhost kernel: [    0.053330] ... bit width:              48
Jan  6 14:46:46 localhost kernel: [    0.053330] ... generic registers:      4
Jan  6 14:46:46 localhost kernel: [    0.053330] ... value mask:             
0000ffffffffffff
Jan  6 14:46:46 localhost kernel: [    0.053330] ... max period:             
00007fffffffffff
Jan  6 14:46:46 localhost kernel: [    0.053330] ... fixed-purpose events:   0
Jan  6 14:46:46 localhost kernel: [    0.053330] ... event mask:             
000000000000000f
Jan  6 14:46:46 localhost kernel: [    0.053330] System has AMD C1E enabled
Jan  6 14:46:46 localhost kernel: [    0.053330] Switch to broadcast mode on 
CPU0


