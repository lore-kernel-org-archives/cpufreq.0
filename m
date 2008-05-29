From: =?ISO-8859-1?Q?Krister_B=E4ckman?= <ixevix@gmail.com>
Subject: Intel Celeron 550
Date: Thu, 29 May 2008 14:01:29 +0200
Message-ID: <483E9B19.9060706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: cpufreq@lists.linux.org.uk

Hi,

I am using gentoo-sources-2.6.24-r8. I get the following message when =

trying to boot with p4_clockmod enabled in the kernel:

"p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to =

<cpufreq@lists.linux.org.uk>"

My computer is a HP Compaq 6720s laptop.

Here's my cat /proc/cpuinfo :

processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 22
model name    : Intel(R) Celeron(R) CPU          550  @ 2.00GHz
stepping    : 1
cpu MHz        : 1995.084
cache size    : 1024 KB
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 10
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =

cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx lm =

constant_tsc arch_perfmon pebs bts pni monitor ds_cpl tm2 ssse3 cx16 =

xtpr lahf_lm
bogomips    : 3994.25
clflush size    : 64

Regards,
Krister B=E4ckman
