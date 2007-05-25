From: m0livier <m0livier@orange.fr>
Subject: unsupported CPU with Enhanced SpeedStep
Date: Fri, 25 May 2007 13:55:27 +0200 (CEST)
Message-ID: <27169902.62691180094127601.JavaMail.www@wwinf2631>
Reply-To: m0livier <m0livier@orange.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi,

I send you some informations about my cpu and cpufreq not working with speedstep-centrino ( deprecated in kernel 2.6.21 ) 
and not working with acpi-cpufreq

Actual kernel : 2.6.21-2

/proc/cpufino:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.86GHz
stepping        : 8
cpu MHz         : 800.018
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe est tm2
bogomips        : 1602.01
clflush size    : 64


With cpufreq.debug=2 i got this when i try to load acpi-cpufreq module:

kernel: cpufreq-core: trying to register driver acpi-cpufreq
kernel: cpufreq-core: adding CPU 0
kernel: cpufreq-core: initialization failed
kernel: cpufreq-core: no CPU initialized for driver acpi-cpufreq
kernel: cpufreq-core: unregistering CPU 0



Tell me if you need more informations .

Berst Regards,

Olivier.
