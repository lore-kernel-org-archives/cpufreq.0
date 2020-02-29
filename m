From: Jelle de Jong <jelledejong@powercraft.nl>
Subject: Re: can not seem to set cpufreq to max performance with newer kernels
 for xeons X56xx
Date: Sat, 29 Feb 2020 15:31:39 +0100
Message-ID: <dd6f0f29-539b-9508-aca8-98c61c6cd7a3@powercraft.nl>
References: <7c59571c-0693-85e1-6836-64c67399f819@powercraft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <7c59571c-0693-85e1-6836-64c67399f819@powercraft.nl>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: cpufreq@vger.kernel.org

Hello everybody,

I am still having the issue that using the performance driver under 
newer kernels does not set the cpu frequency to max. How can I run the 
CPU at his max speed on newer kernels with the older Intel X56XX cpu's.

# cpupower frequency-set -g  performance

# lscpu | grep "CPU MHz:"
CPU MHz:             1750.195

# uname -a
Linux virt04 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64 
GNU/Linux

# lshw -c processor | grep version
        version: Intel(R) Xeon(R) CPU X5675 @ 3.07GHz
        version: Intel(R) Xeon(R) CPU X5675 @ 3.07GHz

Kind regards,

Jelle de Jong


On 2020-01-01 07:45, Jelle de Jong wrote:
> Hello everybody,
> 
> How do I force the X56xx CPUs to stop scaling and run on maximum speed 
> again?
> 
> I been experiencing performance issues for on some ceph storage clusters 
> with slow requests, and I found at least a partial issue issue in the 
> CPU frequency scalling.
> 
> I debugged on two different platform to and three different Debian 
> versions to make sure it was not a bios or version issue.
> 
> The following kernel is working with cpu scalling performance on both 
> platforms, the cpu can run on his max without scalling back:
> 4.9.0-11-amd64 #1 SMP Debian 4.9.189-3+deb9u2 (2019-11-11) x86_64 GNU/Linux
> 
> # not working performance scalling Intel Xeon X5680 on Intel S5520HC
> 5.4.0-1-amd64 #1 SMP Debian 5.4.6-1 (2019-12-27) x86_64 GNU/Linux
> 
> # not working performance scalling Intel Xeon X5670 on HP Z600
> 5.4.0-1-amd64 #1 SMP Debian 5.4.6-1 (2019-12-27) x86_64 GNU/Linux
> 5.3.0-0.bpo.2-amd64 #1 SMP Debian 5.3.9-2~bpo10+1 (2019-11-13) x86_64 
> GNU/Linux
> 4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 
> GNU/Linux
> 
> I need to use a newer kernel for atlantic.ko 10Gbit driver which is 
> buggy on 4.9.0-11.
> 
> I tried setting intel_pstate=enable acpi=force and intel_pstate=disable 
> acpi=force but both did not work with the 5.x kernels i tried.
> 
> BOOT_IMAGE=/vmlinuz-5.4.0-1-amd64 root=/dev/mapper/lvm0--vol-root ro 
> rootfstype=ext4 fsck.mode=force console=ttyS0,115200 rootdelay=3 
> intel_pstate=enable acpi=force quiet
> 
> The CPU just keeps calling down to a lower freq with both the new 
> cpupower and older cpufrequtils utils.
> 
> cpupower show different current cpu speeds.
> 
> root@ceph03:~# cpupower frequency-set --governor performance --min 
> 2927000 --max 2927000
> Setting cpu: 0
> Setting cpu: 1
> Setting cpu: 2
> Setting cpu: 3
> Setting cpu: 4
> Setting cpu: 5
> Setting cpu: 6
> Setting cpu: 7
> Setting cpu: 8
> Setting cpu: 9
> Setting cpu: 10
> Setting cpu: 11
> Setting cpu: 12
> Setting cpu: 13
> Setting cpu: 14
> Setting cpu: 15
> Setting cpu: 16
> Setting cpu: 17
> Setting cpu: 18
> Setting cpu: 19
> Setting cpu: 20
> Setting cpu: 21
> Setting cpu: 22
> Setting cpu: 23
> 
> # lscpu
> Architecture:          x86_64
> CPU op-mode(s):        32-bit, 64-bit
> Byte Order:            Little Endian
> CPU(s):                24
> On-line CPU(s) list:   0-23
> Thread(s) per core:    2
> Core(s) per socket:    6
> Socket(s):             2
> NUMA node(s):          2
> Vendor ID:             GenuineIntel
> CPU family:            6
> Model:                 44
> Model name:            Intel(R) Xeon(R) CPU           X5670  @ 2.93GHz
> Stepping:              2
> CPU MHz:               1770.170
> CPU max MHz:           2927.0000
> CPU min MHz:           1596.0000
> BogoMIPS:              5852.10
> Virtualization:        VT-x
> L1d cache:             32K
> L1i cache:             32K
> L2 cache:              256K
> L3 cache:              12288K
> NUMA node0 CPU(s):     0-5,12-17
> NUMA node1 CPU(s):     6-11,18-23
> Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr 
> pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe 
> syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good 
> nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor 
> ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid dca sse4_1 sse4_2 
> popcnt aes lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi 
> flexpriority ept vpid dtherm ida arat flush_l1d
> 
> root@ceph03:~# cpupower frequency-info
> analyzing CPU 0:
>    driver: acpi-cpufreq
>    CPUs which run at the same hardware frequency: 0
>    CPUs which need to have their frequency coordinated by software: 0
>    maximum transition latency: 10.0 us
>    hardware limits: 1.60 GHz - 2.93 GHz
>    available frequency steps:  2.93 GHz, 2.93 GHz, 2.79 GHz, 2.66 GHz, 
> 2.53 GHz, 2.39 GHz, 2.26 GHz, 2.13 GHz, 2.00 GHz, 1.86 GHz, 1.73 GHz, 
> 1.60 GHz
>    available cpufreq governors: powersave userspace conservative 
> ondemand performance schedutil
>    current policy: frequency should be within 2.93 GHz and 2.93 GHz.
>                    The governor "performance" may decide which speed to use
>                    within this range.
>    current CPU frequency: 2.93 GHz (asserted by call to hardware)
>    boost state support:
>      Supported: yes
>      Active: yes
>      3200 MHz max turbo 4 active cores
>      3200 MHz max turbo 3 active cores
>      3333 MHz max turbo 2 active cores
>      3333 MHz max turbo 1 active cores
> 
> root@ceph03:~# cat /etc/default/cpufrequtils
> GOVERNOR="performance"
> root@ceph03:~# systemctl status cpufrequtils
> ● cpufrequtils.service - LSB: set CPUFreq kernel parameters
>     Loaded: loaded (/etc/init.d/cpufrequtils; generated; vendor preset: 
> enabled)
>     Active: active (exited) since Tue 2019-12-31 14:12:36 CET; 41min ago
>       Docs: man:systemd-sysv-generator(8)
>    Process: 1734519 ExecStop=/etc/init.d/cpufrequtils stop (code=exited, 
> status=0/SUCCESS)
>    Process: 1734527 ExecStart=/etc/init.d/cpufrequtils start 
> (code=exited, status=0/SUCCESS)
> 
> Dec 31 14:12:36 ceph03 systemd[1]: Starting LSB: set CPUFreq kernel 
> parameters...
> Dec 31 14:12:36 ceph03 cpufrequtils[1734527]: CPUFreq Utilities: Setting 
> performance CPUFreq 
> governor...CPU0...CPU1...CPU2...CPU3...CPU4...CPU5...CPU6...CPU7...CPU8...CPU9...CPU10...CPU11...CPU12...CPU13...CPU14...CPU15...CPU16...CPU17...CPU18...CPU19... 
> 
> Dec 31 14:12:36 ceph03 systemd[1]: Started LSB: set CPUFreq kernel 
> parameters.
> 
> root@ceph03:~# cpufreq-info --freq
> 1595816
> root@ceph03:~# cpufreq-info --driver
> acpi-cpufreq
> root@ceph03:~# cpufreq-info --policy
> 2927000 2927000 performance
> root@ceph03:~# cpufreq-info --stats
> 2927000:16889032, 2926000:2, 2793000:1, 2660000:3, 2527000:4, 2394000:9, 
> 2261000:12, 2128000:12, 1995000:15, 1862000:30, 1729000:85, 1596000:1762 
>   (167)
> 
> Kind regards,
> 
> Jelle de Jong
