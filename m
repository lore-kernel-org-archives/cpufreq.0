From: Oliver Antwerpen <olli@giesskaennchen.de>
Subject: Pentium M 1.7GHz/2MB dothan
Date: Fri, 30 Jul 2004 19:02:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <410A7F31.9030604@giesskaennchen.de>
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

Hi there,

My CPU isn't recognized by speedstep-centrino, and I can't see why.

My Kernel:

c80:~# uname -r
2.6.8-rc2-mm1


Here's my cpuinfo:

c80:~# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.70GHz
stepping        : 6
cpu MHz         : 1696.378
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 apic sep mtrr pge mca 
cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe tm2 est
bogomips        : 3366.91

Any idea, what's happening here?

Olli
