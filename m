From: Thomas Breitner <mail@tombreit.de>
Subject: little system-hang when switching frequencies
Date: Tue, 08 Jun 2004 20:00:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086717641.4311.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

hello cpufreq-team,

---
basically this is my debian-cpufreqd-bugreport (#253299), but they
advised me to also try it on your list
---

using speedstep_smi, i get little "cpu-hangs" when frequency is
switching from a high (here: 1 ghz) to a low (here: 730 mhz) value. for
a trickle of a second the systems stops responding (mouse hangs etc),
which i noticed especially when listening to music.
this does not occur when switching from low to high frequency.

sorry, i'm not sure if this belongs to the kernel-related 
cpu-frequency-scaling-drivers...
especially, because the speedstep_ich-module *should* be right for my 
chipset:
 >theo@theoschlepp:~$ lspci
 >0000:00:00.0 Host bridge: Intel Corp. 82815 815 Chipset 
 >Host Bridge and Memory Controller Hub (rev 04)

but, only speedstep_smi is usable for me.

Hope i'm right in this place,
thanks in advance,
thomas

ps: 
1. from dmesg:
   CPU: Intel(R) Pentium(R) III Mobile CPU      1000MHz stepping 01

2. from /var/log/messages:
   cpufreqd: parse_config_general(): ACPI workaround enabled.

3. using debian-kernel-source-package (kernel-source-2.6.6) with
following part-.config:
(the same behaviour was with kernel-source-2.6.5)

---
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
# CONFIG_CPU_FREQ_PROC_INTF is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_24_API is not set
CONFIG_CPU_FREQ_TABLE=y

#
# CPUFreq processor drivers
#
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_SPEEDSTEP_ICH=m
CONFIG_X86_SPEEDSTEP_SMI=m
# CONFIG_X86_P4_CLOCKMOD is not set
CONFIG_X86_SPEEDSTEP_LIB=m
# CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set
---




-- 
____________________________________________
Thomas Breitner
 
mail@tombreit.de   |   http://www.tombreit.de
