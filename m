From: Nirmal Govind <nirmalg@psu.edu>
Subject: sysfs cpufreq missing in 2.6.0
Date: Tue, 23 Dec 2003 11:38:08 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FE86F70.8060908@psu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

I compiled the 2.6.0 kernel (released on Dec. 18, downloaded from 
kernel.org) with the options enabled for userspace cpufreq.. the 
documentation says that sysfs will be used however I do not have any 
such device in /proc/sys/ or in /. I enabled the /proc/cpufreq so I 
do see a /proc/cpufreq but nothing similar to 
/sys/devices/system/cpu/cpu0/cpufreq/ as mentioned in the kernel 
documentation which also says that the sysfs devices will be created 
automatically. Here's what my /proc/sys/ looks like:

root@variance:~# ls /proc/sys
abi/  debug/  dev/  fs/  kernel/  net/  proc/  sunrpc/  vm/

Below is the relevant config options in the kernel (the default on 
boot is set to userspace). Please let me know if I'm missing 
something and if there's some way to get the cpufreq working with sysfs.

Thanks,
nirmal

--

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_PROC_INTF=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
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
CONFIG_X86_SPEEDSTEP_CENTRINO=y
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set
