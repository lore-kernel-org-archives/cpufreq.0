From: Tim Butler <tmb@mpch-mainz.mpg.de>
Subject: cpufreq doesn't recognise my pentium m
Date: Sat, 6 Jan 2007 19:19:53 +0100
Message-ID: <20070106181953.GA268358@syrinx.mpch-mainz.mpg.de>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hello,

I recently ran into some trouble with CPU frequency scaling on my sony
vaio laptop. I'm running a fresh install of debian etch with a custom
kernel compiled from the latest 2.6.18 debian kernel sources, with:

CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y

Here is the cpufreq debug output:

Jan  6 18:01:31 mitre kernel: Kernel command line: root=/dev/sda2 ro cpufreq.debug=7
Jan  6 18:01:32 mitre kernel: cpufreq-core: trying to register driver centrino
Jan  6 18:01:32 mitre kernel: cpufreq-core: adding CPU 0
Jan  6 18:01:32 mitre kernel: speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send /proc/cpuinfo to cpufreq@lists.linux.org.uk
Jan  6 18:01:32 mitre kernel: cpufreq-core: initialization failed
Jan  6 18:01:32 mitre kernel: cpufreq-core: no CPU initialized for driver centrino
Jan  6 18:01:32 mitre kernel: cpufreq-core: unregistering CPU 0

and here are the requested contents of /proc/cpuinfo:

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 13
model name	: Intel(R) Pentium(R) M processor 2.13GHz
stepping	: 8
cpu MHz		: 2128.241
cache size	: 2048 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
bogomips	: 4260.33

Thanks,
Tim
-- 
************************************************************************
Tim Butler
Max Planck Institute for Chemistry     Tel: ++49/6131/305434
Department of Airchemistry             FAX: ++49/6131/305511
Postfach 3060                          email: tmb@mpch-mainz.mpg.de
55020 Mainz, Germany                   http://www.mpch-mainz.mpg.de
************************************************************************
