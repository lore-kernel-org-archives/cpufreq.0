From: Holger Schurig <hs4233@mail.mn-solutions.de>
Subject: Bug: Pentium M not always detected by CPUFREQ
Date: Tue, 21 Nov 2006 16:46:29 +0100
Message-ID: <200611211646.29488.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934395AbWKUPq0@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Hi !

One module thinks that I have a Pentium M, the other doesn't. 
Which module is right?


# modprobe p4-clockmod
p4-clockmod: Warning: Pentium M detected. The speedstep_centrino 
module offers voltage scaling in addition of frequency scaling. 
You should use that instead of p4-clockmod, if possible.
p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available

Okay, so I'll try that:

# rmmod p4-clockmod
# modprobe speedstep-centrino
FATAL: Error inserting speedstep_centrino 
(/lib/modules/2.6.19-rc6/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko): 
No such device

# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Celeron(R) processor            600MHz
stepping        : 5
cpu MHz         : 598.093
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 apic sep mtrr 
pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm pbe
bogomips        : 1196.88


So far I can only say that speedstep-centrino doesn't have an 
entry for a CPU with a mere 600 MHz. May this be the problem?
