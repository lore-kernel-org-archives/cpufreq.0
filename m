From: Marijan Peh <marijan.peh@freenet.de>
Subject: Acer 1304xc laptop & wrong max cpu frequency
Date: Fri, 6 Aug 2004 07:33:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040806053333.GA10452@kanta>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq_mail_list <cpufreq@www.linux.org.uk>

Acer 1304xc laptop
Slackware linux 10.0
Kernel 2.6.8-rc3-mm1

-- dmesg start --
CPU 0 irqstacks, hard=c0422000 soft=c0421000
PID hash table entries: 2048 (order 11: 16384 bytes)
Detected 1533.348 MHz processor.
CPU: AMD mobile AMD Athlon(tm) XP 1800+  stepping 00
powernow: PowerNOW! Technology present. Can scale: frequency and
voltage.
powernow: No PST tables match this cpuid (0x780)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: Minimum speed 666 MHz. Maximum speed 1266 MHz.
-- dmesg end --

-- /sys/devices/system/cpu/cpu0/cpufreq/ --
mpeh:~% grep ".*" /sys/devices/system/cpu/cpu0/cpufreq/*
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1266673
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:1266673
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:666670
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:1266673
1000005 933338 800004 666670 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:powersave
userspace performance 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1266673
/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:powernow-k7
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:userspace
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:1266673
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:666670
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:1266673
-- /sys/devices/system/cpu/cpu0/cpufreq/ --

-- /proc/cpuinfo --
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 8
model name      : mobile AMD Athlon(tm) XP 1800+ 
stepping        : 0
cpu MHz         : 1266.678
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 2510.66
-- /proc/cpuinfo --

Solution ?

-- 
http://nymos.dyndns.org/
