From: Sebastien Fievet <sebastien.fievet@free.fr>
Subject: sempron 64 bits support
Date: Mon, 18 Dec 2006 19:48:38 +0100
Message-ID: <20061218194838.693b2810.sebastien.fievet@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Hello there,

i have a sempron 64 bits processor and would like to enable the frequency s=
caling
capability of the kernel for it. Unfortunately, both powernow-k8 and acpi-c=
pufreq
modules fail to detect my processor as Cool 'n quiet capable.

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
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt lm 3dno=
wext 3dnow pni lahf_lm ts ttp tm stc
bogomips        : 3217.70

The presence of the "lm" bit in the flags should confirm that i have the 64=
 bits core.
My motherboard (K8NF4G) supports "cool 'n quiet", and it is activated in th=
e bios.

I spent a lot of time googling to find out what could be wrong.
The only thing i found is that the powernow flags of my proc are not report=
ed in a
"power management" section but all together with the others flags.
Could it lead the kernel module to misdetect the "cool 'n quiet" capability?

I just compiled the 2.6.19.1 kernel...

Thank you if you can help me save the arctic ices! :-)

S=E9b.
