From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] New: intel_pstate synchronizes frequencies on wake from
 suspend
Date: Sun, 16 Jun 2013 16:12:15 +0000 (UTC)
Message-ID: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59781

           Summary: intel_pstate synchronizes frequencies on wake from
                    suspend
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.10.0rc5, 3.10.0rc6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: pqwoerituytrueiwoq@gmail.com
        Regression: No


Created an attachment (id=104841)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=104841)
Behavior before suspend

When 1st boot both my core's frequencies change independently, but once i wake
from suspend they are synchronized
~$ uname -r # http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.10-rc6-saucy/
3.10.0-031000rc6-generic
$ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_driver 
intel_pstate
intel_pstate
$ cat /sys/devices/system/cpu/cpu*/cpuidle/driver/name 
intel_idle
intel_idle
$ cat /proc/cpuinfo # Only showing one core
processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 42
model name    : Intel(R) Pentium(R) CPU B970 @ 2.30GHz
stepping    : 7
microcode    : 0x23
cpu MHz        : 1242.000
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 1
cpu cores    : 2
apicid        : 2
initial apicid    : 2
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm
constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr
pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer xsave lahf_lm arat epb
xsaveopt pln pts dtherm
bogomips    : 4589.55
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
