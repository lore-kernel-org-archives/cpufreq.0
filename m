From: jhopper@Safe-mail.net
Subject: desperately trying to enable maximum supported frequency scaling on a core2
Date: Mon, 14 Feb 2011 18:24:29 -0500
Message-ID: <N1B-mrB4sgbovA@Safe-mail.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-----5KVYT3G4Q6BC2-4D59B9AD.4D6A-L9Y0JA6PWR4JQ-----"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

This is a multi-part message in MIME format.

-------5KVYT3G4Q6BC2-4D59B9AD.4D6A-L9Y0JA6PWR4JQ-----
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit



-------5KVYT3G4Q6BC2-4D59B9AD.4D6A-L9Y0JA6PWR4JQ-----
Content-Type: text/plain; name="thefreqq.txt"
Content-Disposition: attachment; filename="thefreqq.txt"
Content-Transfer-Encoding: 7bit

Feb 15 00:30:41 localhost kernel: [    0.000000] Command line: root=/dev/sdd3 ro nomodeset processor.ignore_ppc=1 intel_iommu=on cpufreq.debug=7
Feb 15 00:30:42 localhost kernel: [    0.000000] DMI: P35-DS3R/P35-DS3R, BIOS F13 06/19/2009
Feb 15 00:30:42 localhost kernel: [    0.000000] Detected 3735.517 MHz processor.
Feb 15 00:30:42 localhost kernel: [    0.115000] CPU0: Intel(R) Core(TM)2 Duo CPU     E6750  @ 2.66GHz stepping 0b
Feb 15 00:32:35 localhost kernel: [  124.000107] cpufreq-core: setting new policy for CPU 0: 2400000 - 3700000 kHz
Feb 15 00:32:35 localhost kernel: [  124.000109] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:32:35 localhost kernel: [  124.000111] freq-table: request for verification of policy (2400000 - 3700000 kHz) for cpu 0
Feb 15 00:32:35 localhost kernel: [  124.000113] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:32:35 localhost kernel: [  124.000115] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:32:35 localhost kernel: [  124.000117] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:32:35 localhost kernel: [  124.000119] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:32:35 localhost kernel: [  124.000120] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:32:35 localhost kernel: [  124.000122] cpufreq-core: governor: change or update limits
Feb 15 00:32:35 localhost kernel: [  124.000123] cpufreq-core: __cpufreq_governor for CPU 0, event 3
Feb 15 00:32:35 localhost kernel: [  124.000126] userspace: limit event for cpu 0: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3200000 kHz
Feb 15 00:32:35 localhost kernel: [  124.000128] cpufreq-core: target for CPU 0: 3200000 kHz, relation 0
Feb 15 00:32:35 localhost kernel: [  124.000129] acpi-cpufreq: acpi_cpufreq_target 3200000 (0)
Feb 15 00:32:35 localhost kernel: [  124.000131] freq-table: request for target 3200000 kHz (relation: 0) for cpu 0
Feb 15 00:32:35 localhost kernel: [  124.000133] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:32:35 localhost kernel: [  124.000134] acpi-cpufreq: Already at target state (P0)
Feb 15 00:35:17 localhost kernel: [  286.650123] cpufreq-core: setting new policy for CPU 0: 2400000 - 3735517 kHz
Feb 15 00:35:17 localhost kernel: [  286.650125] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:35:17 localhost kernel: [  286.650127] freq-table: request for verification of policy (2400000 - 3735517 kHz) for cpu 0
Feb 15 00:35:17 localhost kernel: [  286.650129] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:35:17 localhost kernel: [  286.650132] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:35:17 localhost kernel: [  286.650133] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:35:17 localhost kernel: [  286.650135] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:35:17 localhost kernel: [  286.650137] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:35:17 localhost kernel: [  286.650138] cpufreq-core: governor: change or update limits
Feb 15 00:35:17 localhost kernel: [  286.650140] cpufreq-core: __cpufreq_governor for CPU 0, event 3
Feb 15 00:35:17 localhost kernel: [  286.650142] userspace: limit event for cpu 0: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3200000 kHz
Feb 15 00:35:17 localhost kernel: [  286.650144] cpufreq-core: target for CPU 0: 3200000 kHz, relation 0
Feb 15 00:35:17 localhost kernel: [  286.650146] acpi-cpufreq: acpi_cpufreq_target 3200000 (0)
Feb 15 00:35:17 localhost kernel: [  286.650147] freq-table: request for target 3200000 kHz (relation: 0) for cpu 0
Feb 15 00:35:17 localhost kernel: [  286.650149] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:35:17 localhost kernel: [  286.650151] acpi-cpufreq: Already at target state (P0)
Feb 15 00:41:18 localhost kernel: [  647.870113] cpufreq-core: setting new policy for CPU 0: 2400000 - 3700000 kHz
Feb 15 00:41:18 localhost kernel: [  647.870115] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:41:18 localhost kernel: [  647.870117] freq-table: request for verification of policy (2400000 - 3700000 kHz) for cpu 0
Feb 15 00:41:18 localhost kernel: [  647.870119] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:41:18 localhost kernel: [  647.870121] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:41:18 localhost kernel: [  647.870123] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:41:18 localhost kernel: [  647.870125] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:41:18 localhost kernel: [  647.870126] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:41:18 localhost kernel: [  647.870128] cpufreq-core: governor: change or update limits
Feb 15 00:41:18 localhost kernel: [  647.870129] cpufreq-core: __cpufreq_governor for CPU 0, event 3
Feb 15 00:41:18 localhost kernel: [  647.870132] userspace: limit event for cpu 0: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3200000 kHz
Feb 15 00:41:18 localhost kernel: [  647.870134] cpufreq-core: target for CPU 0: 3200000 kHz, relation 0
Feb 15 00:41:18 localhost kernel: [  647.870136] acpi-cpufreq: acpi_cpufreq_target 3200000 (0)
Feb 15 00:41:18 localhost kernel: [  647.870137] freq-table: request for target 3200000 kHz (relation: 0) for cpu 0
Feb 15 00:41:18 localhost kernel: [  647.870139] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:41:18 localhost kernel: [  647.870140] acpi-cpufreq: Already at target state (P0)
Feb 15 00:41:25 localhost kernel: [  654.200103] userspace: cpufreq_set for cpu 0, freq 3700000 kHz
Feb 15 00:41:25 localhost kernel: [  654.200105] cpufreq-core: target for CPU 0: 3200000 kHz, relation 0
Feb 15 00:41:25 localhost kernel: [  654.200107] acpi-cpufreq: acpi_cpufreq_target 3200000 (0)
Feb 15 00:41:25 localhost kernel: [  654.200109] freq-table: request for target 3200000 kHz (relation: 0) for cpu 0
Feb 15 00:41:25 localhost kernel: [  654.200111] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:41:25 localhost kernel: [  654.200112] acpi-cpufreq: Already at target state (P0)
Feb 15 00:43:23 localhost kernel: [  772.030097] cpufreq-core: setting new policy for CPU 1: 2400000 - 3700000 kHz
Feb 15 00:43:23 localhost kernel: [  772.030100] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:43:23 localhost kernel: [  772.030102] freq-table: request for verification of policy (2400000 - 3700000 kHz) for cpu 1
Feb 15 00:43:23 localhost kernel: [  772.030104] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:43:23 localhost kernel: [  772.030106] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:43:23 localhost kernel: [  772.030108] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:43:23 localhost kernel: [  772.030110] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:43:23 localhost kernel: [  772.030111] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:43:23 localhost kernel: [  772.030113] cpufreq-core: governor: change or update limits
Feb 15 00:43:23 localhost kernel: [  772.030114] cpufreq-core: __cpufreq_governor for CPU 1, event 3
Feb 15 00:43:23 localhost kernel: [  772.030117] userspace: limit event for cpu 1: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3200000 kHz
Feb 15 00:43:23 localhost kernel: [  772.030118] cpufreq-core: target for CPU 1: 3200000 kHz, relation 0
Feb 15 00:43:23 localhost kernel: [  772.030120] acpi-cpufreq: acpi_cpufreq_target 3200000 (1)
Feb 15 00:43:23 localhost kernel: [  772.030122] freq-table: request for target 3200000 kHz (relation: 0) for cpu 1
Feb 15 00:43:23 localhost kernel: [  772.030124] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:43:23 localhost kernel: [  772.030125] acpi-cpufreq: Already at target state (P0)
Feb 15 00:47:53 localhost kernel: [ 1042.120094] cpufreq-core: setting new policy for CPU 1: 2400000 - 3700000 kHz
Feb 15 00:47:53 localhost kernel: [ 1042.120097] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:47:53 localhost kernel: [ 1042.120099] freq-table: request for verification of policy (2400000 - 3700000 kHz) for cpu 1
Feb 15 00:47:53 localhost kernel: [ 1042.120101] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:47:53 localhost kernel: [ 1042.120103] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:47:53 localhost kernel: [ 1042.120105] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:47:53 localhost kernel: [ 1042.120107] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:47:53 localhost kernel: [ 1042.120109] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:47:53 localhost kernel: [ 1042.120110] cpufreq-core: governor: change or update limits
Feb 15 00:47:53 localhost kernel: [ 1042.120111] cpufreq-core: __cpufreq_governor for CPU 1, event 3
Feb 15 00:47:53 localhost kernel: [ 1042.120114] userspace: limit event for cpu 1: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3200000 kHz
Feb 15 00:47:53 localhost kernel: [ 1042.120116] cpufreq-core: target for CPU 1: 3200000 kHz, relation 0
Feb 15 00:47:53 localhost kernel: [ 1042.120118] acpi-cpufreq: acpi_cpufreq_target 3200000 (1)
Feb 15 00:47:53 localhost kernel: [ 1042.120119] freq-table: request for target 3200000 kHz (relation: 0) for cpu 1
Feb 15 00:47:53 localhost kernel: [ 1042.120121] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:47:53 localhost kernel: [ 1042.120123] acpi-cpufreq: Already at target state (P0)
Feb 15 00:48:15 localhost kernel: [ 1064.160116] cpufreq-core: setting new policy for CPU 0: 2400000 - 3700000 kHz
Feb 15 00:48:15 localhost kernel: [ 1064.160119] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:48:15 localhost kernel: [ 1064.160121] freq-table: request for verification of policy (2400000 - 3700000 kHz) for cpu 0
Feb 15 00:48:15 localhost kernel: [ 1064.160123] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:48:15 localhost kernel: [ 1064.160125] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:48:15 localhost kernel: [ 1064.160127] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:48:15 localhost kernel: [ 1064.160128] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 0
Feb 15 00:48:15 localhost kernel: [ 1064.160130] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:48:15 localhost kernel: [ 1064.160132] cpufreq-core: governor: change or update limits
Feb 15 00:48:15 localhost kernel: [ 1064.160133] cpufreq-core: __cpufreq_governor for CPU 0, event 3
Feb 15 00:48:15 localhost kernel: [ 1064.160135] userspace: limit event for cpu 0: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3700000 kHz
Feb 15 00:48:15 localhost kernel: [ 1064.160138] cpufreq-core: target for CPU 0: 3200000 kHz, relation 1
Feb 15 00:48:15 localhost kernel: [ 1064.160139] acpi-cpufreq: acpi_cpufreq_target 3200000 (0)
Feb 15 00:48:15 localhost kernel: [ 1064.160141] freq-table: request for target 3200000 kHz (relation: 1) for cpu 0
Feb 15 00:48:15 localhost kernel: [ 1064.160143] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:48:15 localhost kernel: [ 1064.160144] acpi-cpufreq: Already at target state (P0)
Feb 15 00:48:36 localhost kernel: [ 1085.750101] userspace: cpufreq_set for cpu 1, freq 3700000 kHz
Feb 15 00:48:36 localhost kernel: [ 1085.750103] cpufreq-core: target for CPU 1: 3200000 kHz, relation 0
Feb 15 00:48:36 localhost kernel: [ 1085.750105] acpi-cpufreq: acpi_cpufreq_target 3200000 (1)
Feb 15 00:48:36 localhost kernel: [ 1085.750107] freq-table: request for target 3200000 kHz (relation: 0) for cpu 1
Feb 15 00:48:36 localhost kernel: [ 1085.750109] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:48:36 localhost kernel: [ 1085.750111] acpi-cpufreq: Already at target state (P0)
Feb 15 00:49:06 localhost kernel: [ 1115.520106] cpufreq-core: setting new policy for CPU 1: 2200000 - 3200000 kHz
Feb 15 00:49:06 localhost kernel: [ 1115.520108] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:49:06 localhost kernel: [ 1115.520110] freq-table: request for verification of policy (2200000 - 3200000 kHz) for cpu 1
Feb 15 00:49:06 localhost kernel: [ 1115.520113] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:49:06 localhost kernel: [ 1115.520115] acpi-cpufreq: acpi_cpufreq_verify
Feb 15 00:49:06 localhost kernel: [ 1115.520116] freq-table: request for verification of policy (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:49:06 localhost kernel: [ 1115.520118] freq-table: verification lead to (2400000 - 3200000 kHz) for cpu 1
Feb 15 00:49:06 localhost kernel: [ 1115.520120] cpufreq-core: new min and max freqs are 2400000 - 3200000 kHz
Feb 15 00:49:06 localhost kernel: [ 1115.520121] cpufreq-core: governor: change or update limits
Feb 15 00:49:06 localhost kernel: [ 1115.520123] cpufreq-core: __cpufreq_governor for CPU 1, event 3
Feb 15 00:49:06 localhost kernel: [ 1115.520125] userspace: limit event for cpu 1: 2400000 - 3200000 kHz, currently 3200000 kHz, last set to 3700000 kHz
Feb 15 00:49:06 localhost kernel: [ 1115.520128] cpufreq-core: target for CPU 1: 3200000 kHz, relation 1
Feb 15 00:49:06 localhost kernel: [ 1115.520129] acpi-cpufreq: acpi_cpufreq_target 3200000 (1)
Feb 15 00:49:06 localhost kernel: [ 1115.520131] freq-table: request for target 3200000 kHz (relation: 1) for cpu 1
Feb 15 00:49:06 localhost kernel: [ 1115.520133] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:49:06 localhost kernel: [ 1115.520134] acpi-cpufreq: Already at target state (P0)
Feb 15 00:49:46 localhost kernel: [ 1155.940123] userspace: cpufreq_set for cpu 1, freq 2500000 kHz
Feb 15 00:49:46 localhost kernel: [ 1155.940126] cpufreq-core: target for CPU 1: 2500000 kHz, relation 0
Feb 15 00:49:46 localhost kernel: [ 1155.940128] acpi-cpufreq: acpi_cpufreq_target 2500000 (1)
Feb 15 00:49:46 localhost kernel: [ 1155.940130] freq-table: request for target 2500000 kHz (relation: 0) for cpu 1
Feb 15 00:49:46 localhost kernel: [ 1155.940132] freq-table: target is 0 (3200000 kHz, 0)
Feb 15 00:49:46 localhost kernel: [ 1155.940134] acpi-cpufreq: Already at target state (P0)
Feb 15 00:49:57 localhost kernel: [ 1166.440114] userspace: cpufreq_set for cpu 1, freq 2400000 kHz
Feb 15 00:49:57 localhost kernel: [ 1166.440117] cpufreq-core: target for CPU 1: 2400000 kHz, relation 0
Feb 15 00:49:57 localhost kernel: [ 1166.440119] acpi-cpufreq: acpi_cpufreq_target 2400000 (1)
Feb 15 00:49:57 localhost kernel: [ 1166.440121] freq-table: request for target 2400000 kHz (relation: 0) for cpu 1
Feb 15 00:49:57 localhost kernel: [ 1166.440123] freq-table: target is 1 (2400000 kHz, 1)
Feb 15 00:49:57 localhost kernel: [ 1166.440125] cpufreq-core: notification 0 of frequency transition to 2400000 kHz
Feb 15 00:49:57 localhost kernel: [ 1166.440127] userspace: saving cpu_cur_freq of cpu 1 to be 2400000 kHz
Feb 15 00:49:57 localhost kernel: [ 1166.440704] cpufreq-core: notification 1 of frequency transition to 2400000 kHz
Feb 15 00:49:57 localhost kernel: [ 1166.440705] cpufreq-core: FREQ: 2400000 - CPU: 1
Feb 15 00:49:57 localhost kernel: [ 1166.440706] userspace: saving cpu_cur_freq of cpu 1 to be 2400000 kHz
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 
3200000
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
3200000
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 
3200000
# echo 3735517 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
3200000
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 
3200000
# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq 
3200000
# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq
# cat /sys/module/cpufreq/parameters/debug
7
# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq 
bash: /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq: Permission denied
# echo 3700000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
# echo 3700000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed 
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 
3200000
# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 Duo CPU     E6750  @ 2.66GHz
stepping        : 11
cpu MHz         : 3200.000
cache size      : 4096 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm lahf_lm dts tpr_shadow vnmi flexpriority
bogomips        : 7471.03
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 Duo CPU     E6750  @ 2.66GHz
stepping        : 11
cpu MHz         : 3200.000
cache size      : 4096 KB
physical id     : 0
siblings        : 2
core id         : 1
cpu cores       : 2
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm lahf_lm dts tpr_shadow vnmi flexpriority
bogomips        : 7471.99
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

# cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq 
3200000
# cat /sys/devices/system/cpu/cpu1/cpufreq/bios_limit 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu1/cpufreq/bios_limit 
bash: /sys/devices/system/cpu/cpu1/cpufreq/bios_limit: Permission denied
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
3200000
# cat /sys/module/processor/parameters/ignore_ppc 
1
# cat /sys/module/processor/parameters/ignore_tpc 
0
# echo 1 > /sys/module/processor/parameters/ignore_tpc
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq 
3200000
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq 
3200000
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed 
3200000
# echo 3700000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed 
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed 
3200000
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq 
2400000
# echo 2200000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq 
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq 
2400000
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq
3200000
# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
userspace
# echo 2500000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
# echo 2400000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
#cat /sys/devices/system/cpu/cpu1/cpufreq/bios_limit 
3200000

-------5KVYT3G4Q6BC2-4D59B9AD.4D6A-L9Y0JA6PWR4JQ-------
