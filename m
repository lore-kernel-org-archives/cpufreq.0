From: Dag Bakke <dag@bakke.com>
Subject: cpufreq for older Toshibas with P3-M and ALi chipset?
Date: Sun, 02 Jan 2005 17:24:47 +0100
Message-ID: <41D8204F.3090108@bakke.com>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk
Cc: ptb@it.uc3m.es

Greetings.

I have for quite some time used Peter T Breuer's 'cpuswitch' [1] utility
to change the processor frequency on my Toshiba Satellite Pro 6000 [3]. 
This utility makes use of HCI/SCI to do its work, and must(?) be built 
together with Jonathan Buzzard's toshiba-utils. [2]
It gives me 8 different CPU frequencies to choose from. (Though the 
frequency in /proc/cpuinfo is never updated.)

I'd like to make use of cpufreq with the 'ondemand' governor instead. 
The laptop appears to work with the 'ACPI Processor P-States driver', 
but this only gives me two frequencies to choose between. Is this to be 
expected?

None of the cpufreq processor drivers appears to fit the bill for a 
PIII-M on an ALi chipset, so I wonder if I am stuck with the cpuswitch 
utility if I want the better granularity it offers over the ACPI driver?
Is it at all possible to fit the functions 'cpuswitch' makes use of into 
a cpufreq driver?


BTW:
I do notice that if I fiddle with the BIOS settings, I can make the 
laptop boot at "half speed", coming up at 500 MHz instead of 1000. (As 
displayed in /proc/cpuinfo.) And the P-states driver still works, so 
presumably it is possible to combine 'native support' and P-states to 
obtain 16 steps? :-)


Thank you to Jonathan, Peter, Dominik, Len and all the others who 
contribute to making laptops useable under Linux.

Dag B


[1] http://www.it.uc3m.es/ptb/cpuswitch.c
[2] http://www.buzzard.org.uk/toshiba/downloads/toshutils-2.0.1.tar.gz
[3]
dagb-work cpufreq # lspci
0000:00:00.0 Host bridge: ALi Corporation M1644/M1644T 
Northbridge+Trident (rev 01)
0000:00:01.0 PCI bridge: ALi Corporation PCI to AGP Controller
0000:00:02.0 USB Controller: ALi Corporation USB 1.1 Controller (rev 03)
0000:00:04.0 IDE interface: ALi Corporation M5229 IDE (rev c3)
0000:00:06.0 Multimedia audio controller: ALi Corporation M5451 PCI 
AC-Link Controller Audio Device (rev 01)
0000:00:07.0 ISA bridge: ALi Corporation M1533 PCI to ISA Bridge 
[Aladdin IV]
0000:00:08.0 Bridge: ALi Corporation M7101 Power Management Controller [PMU]
[....]

dagb-work cpufreq # cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 11
model name      : Intel(R) Pentium(R) III Mobile CPU      1000MHz
stepping        : 1
cpu MHz         : 995.905
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 mmx fxsr sse
bogomips        : 1961.98

dagb-work cpufreq # x86info    
x86info v1.12b.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
Family: 6 Model: 11 Stepping: 1 Type: 0 Brand: 6
CPU Model: Pentium III-M Original OEM
