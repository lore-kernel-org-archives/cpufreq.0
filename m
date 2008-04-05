From: "adaca@tiscali.it" <adaca@tiscali.it>
Subject: Intel Celeron M 530 cpu not recognized by cpufreq nor p4_clockmod
Date: Sat, 5 Apr 2008 11:04:38 +0200 (CEST)
Message-ID: <15643306.1207386278296.JavaMail.root@ps13>
Reply-To: "adaca@tiscali.it" <adaca@tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: cpufreq@lists.linux.org.uk

Hi,
on my new Toshiba A20 laptop I've never been able to see cpufreq working, so the cpu is always at max speed (1.73GHz); this applies to kernel 2.6.23 on both Ubuntu 7.10 and Fedora 8, and now 2.6.24 on Fedora (2.6.24.4-64.fc8).
This post says I need the p4_clockmod driver: 
http://lists.opensuse.org/opensuse-bugs/2008-03/msg05714.html
So I compiled the p4_clockmod module from the kernel sources but when I do:
modprobe p4_clockmod
I get:
FATAL: Error inserting p4_clockmod (/lib/modules/2.6.24.4-64.fc8/kernel/arch/x86/kernel/cpu/cpufreq/p4-clockmod.ko): No such device
Here's what I found in the syslog:
Apr  5 10:51:12 amc kernel: p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux.org.uk>
And here's my /proc/cpuinfo output:
[root@amc 2.6.24.4-64.fc8]# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 22
model name      : Intel(R) Celeron(R) CPU          530  @ 1.73GHz
stepping        : 1
cpu MHz         : 1729.036
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx lm constant_tsc up arch_perfmon pebs bts pni monitor ds_cpl tm2 ssse3 cx16 xtpr lahf_lm
bogomips        : 3460.44
clflush size    : 64

Please help!
Thank you
Adalberto M. Caccia


___________________________________________________
Tiscali.Fax: ricevi gratis sulla tua email e invii 
a 12 cent per pagina senza scatto alla risposta 
