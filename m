From: Jan Piechotta <j@diesedomainwarnochfrei.de>
Subject: cpuinfo / speedstep-centrino
Date: Wed, 16 May 2007 17:04:13 +0200
Message-ID: <20070516170413.2861c83d@snowcat.jan>
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

Hi, 

my kernel wants me to send you a mail:

<<<snip>>> 
cpufreq-core: trying to register driver centrino
cpufreq-core: adding CPU 0 speedstep-centrino: found unsupported CPU
with Enhanced SpeedStep: send /proc/cpuinfo to
cpufreq@lists.linux.org.uk 
cpufreq-core: initialization failed
<<<snip>>>

Mainboard is MSI 915GM Speedster-FA4 bought Dec 2005.
Here you go:

<<<snip>>>
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 13
model name	: Intel(R) Pentium(R) M processor 1.73GHz
stepping	: 8
cpu MHz		: 1729.049
cache size	: 2048 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
bogomips	: 3460.62
clflush size	: 64
<<<snip>>>

I also tried acpi-cpufreq without success.

HTH, Jan
