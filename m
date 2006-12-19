From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7712] New: sempron 64 bits support
Date: Tue, 19 Dec 2006 02:53:58 -0800
Message-ID: <200612191053.kBJArwS3031735@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7712

           Summary: sempron 64 bits support
    Kernel Version: 2.6.19.1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: sebastien.fievet@free.fr


Distribution: Linux from Scratch 6.2
Hardware Environment:
   processor : sempron 64bits 2800+
   motherboard : k8nf4g-sata2 (nForce4 based)

Problem Description:
Both powernow-k8 and acpi-cpufreq modules fail to load.

modprobe powernow-k8 FATAL: Error inserting powernow_k8
(/lib/modules/2.6.19.1/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k8.ko): No
such device

Below is the result of "cat /proc/cpuinfo"

processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 44
model name      : AMD Sempron(tm) Processor 2800+
stepping        : 2
cpu MHz         : 1607.349
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt lm 3dnowext 3dnow
pni lahf_lm ts ttp tm stc
bogomips        : 3217.70

The presence of the "lm" bit in the flags should confirm that i have the 64 bits
core. My motherboard (K8NF4G) supports "cool 'n quiet", and it is activated in
the bios.

The powernow flags of my proc are not reported in a "power management" section
but all together with the others flags. Could it lead the kernel module to
misdetect the "cool 'n quiet" capability?

Steps to reproduce:
simply load the powernow-k8 module

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
