From: Martin van Es <martin@mrvanes.com>
Subject: dothan B0 speedstep-centrino driver
Date: Mon, 29 Nov 2004 22:34:49 +0100
Message-ID: <200411292234.49860.martin@mrvanes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

I recently bought an Acer Travelmate 6000 series laptop with intel 855 chipset 
and centrino 1.6 processor (dothan B0). Kernel 2.6.9 speedstep-centrino won't 
recognise the proc with or without ..._CENTRINO_ACPI  switched on. I tried 
2.6.10rc2 as well, without success.

ACPI P-states driver works flawless (so no complaint about the usability of 
speedstep from that point of view).
The reason I write is that I'd like to be able to use the centrino specific 
driver for it's alleged switching speed improvement and help 
debugging/updating the driver for this CPU/Laptop/BIOS combination.

cat /proc/cpuinfo:
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.60GHz
stepping        : 6
cpu MHz         : 598.069
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
clflush dts acpi mmx fxsr sse sse2 ss tm pbe esttm2
bogomips        : 1182.72

dmesg ACPI P-States part of the the bootprocess:
...
cpufreq: CPU0 - ACPI performance management activated.
cpufreq: *P0: 1600 MHz, 24000 mW, 10 uS
cpufreq:  P1: 1400 MHz, 20000 mW, 10 uS
cpufreq:  P2: 1200 MHz, 18000 mW, 10 uS
cpufreq:  P3: 1000 MHz, 16000 mW, 10 uS
cpufreq:  P4: 600 MHz, 12000 mW, 10 uS
ACPI: (supports S0 S3 S4 S5)
...

If there's anything I can do to help.

Regards,
Martin van Es
-- 
If 'but' was any useful, it would have a logical operator.
