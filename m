From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10386] New: cpufreq reports wrong scaling_freqs on AcerExtensa
Date: Wed,  2 Apr 2008 14:39:43 -0700 (PDT)
Message-ID: <bug-10386-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10386

           Summary: cpufreq reports wrong scaling_freqs on AcerExtensa
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24.4
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: miste78@web.de


Latest working kernel version:
Earliest failing kernel version:

Distribution:ArchLinux stable

Hardware Environment:
Acer Extensa 3001 WLMi
Intel(R) Pentium(R) M processor 1.50GHz

Software Environment:

Problem Description:
cpufreq reports wrong scaling frequencies on my Acer Eaxtensa 3001WLMi.
CPU is a Pentium M 1.5GHz. I tried both available BIOS Versions (3A08 and 3A10)
and use a fixed DSDT. The are no warnings or erros about acpi in the dmesg
output.

some infos

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
1600000 1400000 1200000 800000 600000 

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver 
acpi-cpufreq

# cat /proc/version 
Linux version 2.6.24.4 (michael@acer01) (gcc version 4.3.0 (GCC) ) #3 SMP
PREEMPT Wed Apr 2 19:31:01 CEST 2008

# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.50GHz
stepping        : 8
cpu MHz         : 1400.000
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat
clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx up bts est tm2
bogomips        : 2999.74
clflush size    : 64

Steps to reproduce:
I think it depends on my Hardware.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
