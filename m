From: Andrew Morton <akpm@osdl.org>
Subject: Fw: [Bugme-new] [Bug 2012] New: cpufreq: can't read cpu speed in
 both performance and powersave governor
Date: Wed, 4 Feb 2004 10:35:09 -0800
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040204103509.01e98365.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk



Begin forwarded message:

Date: Wed, 4 Feb 2004 06:28:18 -0800
From: bugme-daemon@osdl.org
To: bugme-new@lists.osdl.org
Subject: [Bugme-new] [Bug 2012] New: cpufreq: can't read cpu speed in both performance and powersave governor


http://bugme.osdl.org/show_bug.cgi?id=2012

           Summary: cpufreq: can't read cpu speed in both performance and
                    powersave governor
    Kernel Version: 2.6.2rc3
            Status: NEW
          Severity: normal
             Owner: drivers_other@kernel-bugs.osdl.org
         Submitter: guiguid@free.fr


Hardware Environment: x86 Intel Pentium 4 C 2.6GHz

Problem Description:
With Cpufreq, kernel 2.6.2rc3 + supermount patch + smp (CPU is Hypertreading) +
preemptif

When governor is in powersave or performance, there isn't place for reading
current cpu speed. (see below) 

Steps to reproduce:

[root@mdk guiguid]# echo userspace >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
[root@mdk guiguid]# echo userspace >
/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor

-> setting governor to userspace

[root@mdk guiguid]# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
userspace

-> check : ok

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
325000 650000 975000 1300000 1625000 1950000 2275000 2600000

--> freq aviable

[root@mdk guiguid]# echo 1000000 >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
[root@mdk guiguid]# echo 1000000 >
/sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed

--> try an unsupported freq

[root@mdk guiguid]# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
1300000
[root@mdk guiguid]# cat [root@mdk guiguid]# cat
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
1300000

--> check : freq goes to the next supported ! Nice

[root@mdk guiguid]# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 CPU 2.60GHz
stepping        : 9
cpu MHz         : 2598.871
cache size      : 512 KB
....
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 5128.19

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 CPU 2.60GHz
stepping        : 9
cpu MHz         : 2598.871
cache size      : 512 KB
....
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 5193.72

--> /proc/cpuinfo strange I don't see 1Ghz current freq !

[root@mdk guiguid]# echo 325000 >
/sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
[root@mdk guiguid]# echo 325000 >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed

--> 325 MHz

[root@mdk guiguid]# hdparm -T /dev/hda

/dev/hda:
 Timing buffer-cache reads:   1916 MB in  2.00 seconds = 956.23 MB/sec

--> testing direct memory read (by hdparm -T chache performance --> memory!)

[root@mdk guiguid]# echo 2600000 >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
[root@mdk guiguid]# echo 2600000 >
/sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed

--> at full speed 2.6GHz

[root@mdk guiguid]# hdparm -T /dev/hda

/dev/hda:
 Timing buffer-cache reads:   3276 MB in  2.00 seconds = 1637.43 MB/sec

--> better, normal !

[root@mdk guiguid]# echo performance >
/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
[root@mdk guiguid]# echo performance >
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

--> back to performance mode

[root@mdk guiguid]# cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
cat: /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed: No such file or
directory

--> can't read current speed

[root@mdk guiguid]# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 CPU 2.60GHz
stepping        : 9
cpu MHz         : 2598.871
cache size      : 512 KB
...
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 5128.19

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 CPU 2.60GHz
stepping        : 9
cpu MHz         : 2598.871
cache size      : 512 KB
...
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 5193.72

--> don't change as 1GHz (above) 

I think it's a bug. Or if not, how could I read curent cpu speed.

Guillaume

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
