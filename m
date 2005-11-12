From: Mark <mark2@ml1.net>
Subject: kernel hang powernow-k8 SMP
Date: Sat, 12 Nov 2005 18:40:05 +0000
Message-ID: <43763705.1030309@ml1.net>
Reply-To: cpufreq@mnlist.ml1.net
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi

I've just updated my Tyan 2875 board to dual Operon rev CG 248's.

cpufreq-info

analyzing CPU 0:
   driver: powernow-k8
   CPUs which need to switch frequency at the same time: 0
   hardware limits: 1000 MHz - 2.20 GHz
   available frequency steps: 2.20 GHz, 2.00 GHz, 1.80 GHz, 1000 MHz
   available cpufreq governors: conservative, ondemand, userspace, 
performance
   current policy: frequency should be within 1000 MHz and 2.20 GHz.
                   The governor "userspace" may decide which speed to use
                   within this range.
   current CPU frequency is 2.20 GHz (asserted by call to hardware).
analyzing CPU 1:
   driver: powernow-k8
   CPUs which need to switch frequency at the same time: 1
   hardware limits: 1000 MHz - 2.20 GHz
   available frequency steps: 2.20 GHz, 2.00 GHz, 1.80 GHz, 1000 MHz
   available cpufreq governors: conservative, ondemand, userspace, 
performance
   current policy: frequency should be within 1000 MHz and 2.20 GHz.
                   The governor "userspace" may decide which speed to use
                   within this range.
   current CPU frequency is 2.20 GHz (asserted by call to hardware).

cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 5
model name      : AMD Opteron(tm) Processor 248
stepping        : 10
cpu MHz         : 2193.154
cache size      : 1024 KB
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 
3dnowext 3dnow
bogomips        : 4390.67
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 5
model name      : AMD Opteron(tm) Processor 248
stepping        : 10
cpu MHz         : 2193.154
cache size      : 1024 KB
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 
3dnowext 3dnow
bogomips        : 4385.58
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts fid vid ttp

I have powernow-k8 and ACPI code as built in to kernel

Irrespective of which govenor I run my system is locking up.  I've seen 
a few general protection faults.  It locks even with the userspace 
govenor and an attempted manual frequency change.

The problens cease when I recompile without SMP, however, this is not 
really a solution.

I'm not a developer, and was hoping someone would be able to help me 
debug this.  I'm running 64 bit Gentoo 2.614 kernel

Mark
