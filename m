From: Diwaker Gupta <dgupta@cs.ucsd.edu>
Subject: cpufreq default governor?
Date: Sun, 18 Jan 2004 23:16:59 -0800
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <400B846B.6000202@cs.ucsd.edu>
Reply-To: diwaker@ucsd.edu
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

I'm running 2.6.1 vanilla kernel from kernel.org with no patches. I want 
to set the default cpufreq governor to userspace. Here is the relevant 
portion of my .config:

====
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_PROC_INTF=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_24_API=y
CONFIG_CPU_FREQ_TABLE=y
CONFIG_X86_ACPI_CPUFREQ=y
CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
====

Everything compiles fine, but when I boot into the new kernel, the 
default governor is still set to performance:

<diwaker@diwaker>$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
performance

But the userspace governor is indeed available:
<diwaker@diwaker>$ cat 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
powersave userspace performance

Any suggestions?
TIA,
Diwaker
-- 
Diwaker Gupta
Graduate Student, Computer Sc. and Engg.
University of California, San Diego
<http://www.cse.ucsd.edu/users/dgupta>
