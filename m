From: Giuseppe Ponzio <g.ponzio@vodafone.it>
Subject: Pentium Cetrino
Date: Sun, 12 Jun 2005 10:14:41 +0200
Message-ID: <200506121014.41734.g.ponzio@vodafone.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi 2 all,
my problem is to be able to load the speedstep-centrino module but each time i 
try i've the message: "FATAL: Error inserting speedstep_centrino 
(/lib/modules/2.6.11.9/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko): 
No such device"

Here is my cpuinfo:

root@SlackZotBox:~# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.60GHz
stepping        : 6
cpu MHz         : 598.681
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat 
clflush dts acpi mmx fxsr sse sse2 ss tm pbe est tm2
bogomips        : 1185.79

I've enabled on my kernel:

root@SlackZotBox:/usr/src/linux# grep -i "CPU_FREQ" .config
CONFIG_CPU_FREQ=y
# CONFIG_CPU_FREQ_DEBUG is not set
CONFIG_CPU_FREQ_STAT=m
CONFIG_CPU_FREQ_STAT_DETAILS=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_TABLE=m

I'm totally able to use p4-clockmod and/or acpi-cpufreq with each governor i 
prefer.... why this problem with speedstep-centrino? 

Please help me... 

thx in advance
bye
