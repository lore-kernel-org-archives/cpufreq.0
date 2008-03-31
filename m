From: Christoph Biedl <cpufreq.arzs@manchmal.in-ulm.de>
Subject: "Unknown p4-clockmod-capable CPU"
Date: Mon, 31 Mar 2008 22:43:10 +0200
Message-ID: <1206995704@msgid.manchmal.in-ulm.de>
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

Hello,

as requested by dmesg:

| p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux.org.uk>

This is a mini-ITX mainboard from Intel, product name is
"D201GLY2A", running a vanilla 2.6.25-rc6 kernel.

Output from /proc/cpuinfo

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 22
model name      : Intel(R) Celeron(R) CPU          220  @ 1.20GHz
stepping        : 1
cpu MHz         : 1200.058
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx lm constant_tsc arch_perfmon pebs bts pni monitor ds_cpl tm2 ssse3 cx16 xtpr lahf_lm
bogomips        : 2401.29
clflush size    : 64

Output from /proc/acpi/processor/CPU0/info

processor id:            0
acpi id:                 1
bus mastering control:   yes
power management:        no
throttling control:      yes


Let me know if you need further information.

    Christoph
