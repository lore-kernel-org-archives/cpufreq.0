From: "Oleg Lomaka" <oleg.lomaka@gmail.com>
Subject: Celeron 550 on Asus X80L
Date: Wed, 21 May 2008 01:45:42 +0300
Message-ID: <ede8d66d0805201545k5e5a2db9n785115217e8e3049@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: cpufreq@lists.linux.org.uk

Hello to all,

I have Asus X80L laptop with Celeron 550 2GHz CPU. Ubuntu 8.04

sudo modprobe p4-clockmod
FATAL: Error inserting p4_clockmod
(/lib/modules/2.6.24-16-generic/kernel/arch/x86/kernel/cpu/cpufreq/p4-clockmod.ko):
No such device

From dmesg:
[ 2270.259482] p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an
e-mail to <cpufreq@lists.linux.org.uk>

uname -a
Linux otter 2.6.24-16-generic #1 SMP Thu Apr 10 13:23:42 UTC 2008 i686
GNU/Linux

cat /proc/cpuinfo
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 22
model name    : Intel(R) Celeron(R) CPU          550  @ 2.00GHz
stepping    : 1
cpu MHz        : 1995.052
cache size    : 1024 KB
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 10
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx lm constant_tsc up
arch_perfmon pebs bts pni monitor ds_cpl tm2 ssse3 cx16 xtpr lahf_lm
bogomips    : 3993.37
clflush size    : 64

Thanks.
