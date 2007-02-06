From: =?utf-8?q?Micha=C5=82_Pytasz?= <pytasz@lodz.home.pl>
Subject: Centrino duo - frequency not switching with cpufrqd nor ondemand
	govenor
Date: Tue, 6 Feb 2007 14:45:22 +0100
Message-ID: <200702061445.22913.pytasz@lodz.home.pl>
References: <20061118110642.GA10713@feivel.credativ.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061118110642.GA10713@feivel.credativ.de>
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
Content-Type: text/plain; charset="macroman"
To: cpufreq@lists.linux.org.uk

Hi,

I have a centrino-duo based tablet (Siemens Lifebook T4210). /proc/cpuinfo=
=20
says:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 14
model name      : Genuine Intel(R) CPU           T2300  @ 1.66GHz
stepping        : 8
cpu MHz         : 1667.000
cache size      : 2048 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca=
=20
cmov pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pn=
i=20
monitor est tm2 xtpr
bogomips        : 3327.59

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 14
model name      : Genuine Intel(R) CPU           T2300  @ 1.66GHz
stepping        : 8
cpu MHz         : 1667.000
cache size      : 2048 KB
physical id     : 0
siblings        : 2
core id         : 1
cpu cores       : 2
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca=
=20
cmov pat clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx constant_tsc pn=
i=20
monitor est tm2 xtpr
bogomips        : 3324.56

I have ACPI in kernel, speedstep-centrino as a module, inserted into kernel=
 ob=20
boot.
In /sys/devices/system/cpu I have 2 cpus (or rather cores) reported, each h=
as=20
cpufreq ability. For each core I have files:

=2Dr--r--r-- 1 root root 4096 Feb  6 10:46 affected_cpus
=2Dr-------- 1 root root 4096 Feb  6 14:34 cpuinfo_cur_freq
=2Dr--r--r-- 1 root root 4096 Feb  6 10:46 cpuinfo_max_freq
=2Dr--r--r-- 1 root root 4096 Feb  6 10:46 cpuinfo_min_freq
=2Dr--r--r-- 1 root root 4096 Feb  6 10:46 scaling_available_frequencies
=2Dr--r--r-- 1 root root 4096 Feb  6 10:46 scaling_available_governors
=2Dr--r--r-- 1 root root 4096 Feb  6 14:34 scaling_cur_freq
=2Dr--r--r-- 1 root root 4096 Feb  6 14:34 scaling_driver
=2Drw-r--r-- 1 root root    0 Feb  6 14:34 scaling_governor
=2Drw-r--r-- 1 root root 4096 Feb  6 10:46 scaling_max_freq
=2Drw-r--r-- 1 root root 4096 Feb  6 10:46 scaling_min_freq

The root of a problem (at least at least in my opinion) might be thecontent=
 of=20
scaling_min_freq reported as 1667000, the same as scaling max_freq, althoug=
h=20
scaling_available_frequencies has 3 levels:
1667000 1333000 1000000

How do I make it work (scale frequency), I have no experience with intel,=20
previously I used amd (and powernow).

Best regards,
Micha=C5=82=20
