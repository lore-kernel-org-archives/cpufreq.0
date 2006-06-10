From: "Martin Skytte" <skytte@gmail.com>
Subject: speedstep-centrino does not work on Core Duo T2400
Date: Sat, 10 Jun 2006 10:11:41 +0200
Message-ID: <ac5f76150606100111u5c867295o9896d043c5702517@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi,
When I try to load the speedstep-centrino module I get:
FATAL: Error inserting speedstep_centrino
(/lib/modules/2.6.16-beyond/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-
centrino.ko): No such device
The same happens when loading acpi-cpufreq.

I've been wrestling with this for quite some time now, but I really don't
have no ideas as to how to solve this.

-Martin

cat /proc/cpuinfo
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 14
model name    : Genuine Intel(R) CPU           T2400  @ 1.83GHz
stepping    : 8
cpu MHz        : 1828.805
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 0
cpu cores    : 2
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 10
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni
monitor vmx est tm2 xtpr
bogomips    : 3661.78

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 14
model name    : Genuine Intel(R) CPU           T2400  @ 1.83GHz
stepping    : 8
cpu MHz        : 1828.805
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 1
cpu cores    : 2
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 10
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pni
monitor vmx est tm2 xtpr
bogomips    : 3657.40
