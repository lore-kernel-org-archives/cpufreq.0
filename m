From: bugme-daemon@osdl.org
Subject: [Bug 3855] New: Powernow-k8 doesn't work with 90nm Athlon64@939pin
	(Winchester)
Date: Fri, 3 Dec 2004 06:52:47 -0800
Message-ID: <200412031452.iB3Eql8Z031779@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3855

           Summary: Powernow-k8 doesn't work with 90nm Athlon64@939pin
                    (Winchester)
    Kernel Version: 2.6.9
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: malte.d@gmx.net


Distribution: Slackware 10.0 
Hardware Environment: MSI Neo2 Platinum 939 K8 Board + Athlon64 3000+ 
Winchester 90nm, Socket 939 
# cat /proc/cpuinfo  
processor       : 0 
vendor_id       : AuthenticAMD 
cpu family      : 15 
model           : 31 
model name      : AMD Athlon(tm) 64 Processor 3000+ 
stepping        : 0 
cpu MHz         : 1808.320 
cache size      : 512 KB 
fdiv_bug        : no 
hlt_bug         : no 
f00f_bug        : no 
coma_bug        : no 
fpu             : yes 
fpu_exception   : yes 
cpuid level     : 1 
wp              : yes 
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov 
pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow 
bogomips        : 3579.90 
 
 
Problem Description: You cannot change the cpu frequency with this 
hardware-setup 
 
Steps to reproduce: 
 
# modprobe powernow-k8 
# dmesg | tail -n 7 
ACPI: Processor [CPU0] (supports C1) 
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b) 
powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x6 (1400 mV) 
powernow-k8:    1 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV) 
powernow-k8: cpu_init done, current fid 0xa, vid 0x4 
powernow-k8: vid trans failed, vid 0x3, curr 0x4 
powernow-k8: transition frequency failed 
 
# ls /sys/devices/system/cpu/cpu0/cpufreq/ 
cpuinfo_cur_freq               scaling_available_governors  scaling_max_freq 
cpuinfo_max_freq               scaling_cur_freq             scaling_min_freq 
cpuinfo_min_freq               scaling_driver               scaling_setspeed 
scaling_available_frequencies  scaling_governor 
# cat  /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq               
1800000 
# cat  /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies  
1800000 1000000  
# echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed  
 
# dmesg | tail -n 9 
ACPI: Processor [CPU0] (supports C1) 
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b) 
powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x6 (1400 mV) 
powernow-k8:    1 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV) 
powernow-k8: cpu_init done, current fid 0xa, vid 0x4 
powernow-k8: vid trans failed, vid 0x3, curr 0x4 
powernow-k8: transition frequency failed 
powernow-k8: vid trans failed, vid 0x3, curr 0x4 
powernow-k8: transition frequency failed

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
