From: Ben Kevan <ben.kevan@gmail.com>
Subject: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable Enchanced
	SpeedStep
Date: Mon, 19 Jun 2006 16:10:40 -0700
Message-ID: <200606191610.40597.ben.kevan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: linux@brodo.de
Cc: cpufreq@lists.linux.org.uk

Hi, 

I copied both on this because I thought you both may be interested. My problem 
is, my Toshiba Tecra M1 will only run at 598Mhz, and I can not use toshutils 
or anything else to configure speedstep to run higher. Or in any other way 
can I use it to run higher.  

Below are a bunch of commands to give you an idea of what's going on. Is this 
a bug with the 2.6.16.x build? Or is it something else that I am just 
oblivious too (ACPI?). 

Any information would be greatly appreciated.

LSHESU01004839:/home/bkevan # dmesg | grep speedstep
speedstep-centrino: couldn't enable Enhanced SpeedStep
speedstep-centrino: couldn't enable Enhanced SpeedStep
speedstep-centrino: couldn't enable Enhanced SpeedStep
speedstep-centrino: couldn't enable Enhanced SpeedStep

LSHESU01004839:/home/bkevan # modprobe speedstep_centrino
FATAL: Error inserting speedstep_centrino 
(/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko): 
No such device
LSHESU01004839:/home/bkevan # modprobe acpi_cpufreq
FATAL: Error inserting acpi_cpufreq 
(/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): 
No such device


LSHESU01004839:/home/bkevan # cpufreq-info
cpufrequtils 0.4: cpufreq-info (C) Dominik Brodowski 2004
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
LSHESU01004839:/home/bkevan # uname -r
2.6.16.13-4-default

LSHESU01004839:/home/bkevan # cat /proc/acpi/processor/C*/info
processor id:            0
acpi id:                 1
bus mastering control:   yes
power management:        yes
throttling control:      no
limit interface:         no

LSHESU01004839:/home/bkevan # cat /proc/acpi/processor/C*/limit
<not supported>

LSHESU01004839:/home/bkevan # cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Pentium(R) M processor 1600MHz
stepping        : 5
cpu MHz         : 598.582
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat 
clflush dts acpi mmx fxsr sse sse2 tm pbe est tm2
bogomips        : 1198.30
