From: Henne <henne@nachtwindheim.de>
Subject: cpufreq on Toshiba Portege M100 Laptop
Date: Thu, 12 Jul 2007 13:41:46 +0200
Message-ID: <4696137A.1010701@nachtwindheim.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Hello,
this week I got a Toshiba Portege M100 Laptop. I installed Debian (sid) and everything was great.
I could see the P-States on powertop, which were 600MHz - 1200 MHz in 100MHz steps.
Then I upgraded the firmware of the Laptop and then it happend:

acpi-cpufreq: acpi_cpufreq_init
acpi-cpufreq: acpi_cpufreq_early_init
cpufreq-core: trying to register driver acpi-cpufreq
cpufreq-core: adding CPU 0
acpi-cpufreq: acpi_cpufreq_cpu_init
acpi-cpufreq: No P-States 1
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver acpi-cpufreq
cpufreq-core: unregistering CPU 0

That 1 in the line after "No P-States" is the value of perf->state_count from acpi_cpufreq_cpu_init(),
which I added to acpi-cpufreq to see whats wrong. I used the latest kernel-2.6.22-git2 via git.
Then I tryed cpeedstep-centrino with this result.

cpufreq-core: trying to register driver centrino
cpufreq-core: adding CPU 0
speedstep-centrino: No P-States
speedstep-centrino: speedstep-centrino: invalid ACPI data
speedstep-centrino: found "Intel(R) Pentium(R) M processor 1200MHz": max frequency: 1200000kHz
speedstep-centrino: trying to enable Enhanced SpeedStep (111088)
speedstep-centrino: couldn't enable Enhanced SpeedStep
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver centrino
cpufreq-core: unregistering CPU 0

So can you help/tell me where i have to look for this error.
Before the firmware upgrade I made hexdump -C of the first MB of /dev/mem, maybe that could help.

Btw, PFX should not be used in dprintk(), cause speedstep-centrino: is printed twice.
I'll write a patch for that.

Greets, Henne.

P.S. Here's the output of /proc/cpuinfo

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 9
model name	: Intel(R) Pentium(R) M processor 1200MHz
stepping	: 5
cpu MHz		: 598.516
cache size	: 1024 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm pbe est tm2
bogomips	: 1197.79
clflush size	: 64
