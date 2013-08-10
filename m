From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60727] New: The CPU frequency does not raise when compiling
 packages on Gentoo
Date: Sat, 10 Aug 2013 15:02:34 +0000
Message-ID: <bug-60727-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60727

            Bug ID: 60727
           Summary: The CPU frequency does not raise when compiling
                    packages on Gentoo
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.11-rc4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: patrakov@gmail.com
        Regression: No

Created attachment 107170
  --> https://bugzilla.kernel.org/attachment.cgi?id=107170&action=edit
Kernel config (3.11-rc4)

The kernel used for this bug report is not a vanilla 3.11-rc4, but the one
patched with https://bugzilla.kernel.org/attachment.cgi?id=106891&action=diff
from bug #58971. It is not possible to know whether this is a regression,
because the bug (if it existed before) was effectively masked by bug #48721.

To reproduce, compile a simple package (like media-libs/tiff-4.0.3-r2) on
Gentoo using portage. Sometimes (but not always), during the whole process, the
CPU frequency (both as reported by cpufreq-info and as reported by cat
/proc/cpuinfo) doesn't raise as high as I would expect. I.e. it raises only to
1176 MHz, while I expect it to become 3.50 GHz on at least one CPU core,
because the compilation process is clearly CPU bound. The driver is
intel_pstate and the governor is powersave.

It may be relevant that the load created by portage is nice (but there is no
ignore_nice_load file in my sysfs tree), and that all of the configuration
tests and gcc calls exit quickly. If the setting to ignore the nice load exists
with intel_pstate but is not named ignore_nice_load, then please tell me about
it - the bug may be invalid after all due to it.

# cat /proc/cpuinfo 
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 42
model name    : Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz
stepping    : 7
microcode    : 0x28
cpu MHz        : 1176.000
cache size    : 4096 KB
physical id    : 0
siblings    : 4
core id        : 0
cpu cores    : 2
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm
constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3
cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave
avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority
ept vpid
bogomips    : 5587.21
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 42
model name    : Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz
stepping    : 7
microcode    : 0x28
cpu MHz        : 1176.000
cache size    : 4096 KB
physical id    : 0
siblings    : 4
core id        : 0
cpu cores    : 2
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm
constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3
cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave
avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority
ept vpid
bogomips    : 5587.21
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 2
vendor_id    : GenuineIntel
cpu family    : 6
model        : 42
model name    : Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz
stepping    : 7
microcode    : 0x28
cpu MHz        : 1176.000
cache size    : 4096 KB
physical id    : 0
siblings    : 4
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
aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3
cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave
avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority
ept vpid
bogomips    : 5587.21
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 3
vendor_id    : GenuineIntel
cpu family    : 6
model        : 42
model name    : Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz
stepping    : 7
microcode    : 0x28
cpu MHz        : 1176.000
cache size    : 4096 KB
physical id    : 0
siblings    : 4
core id        : 1
cpu cores    : 2
apicid        : 3
initial apicid    : 3
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm
constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc
aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3
cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave
avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority
ept vpid
bogomips    : 5587.21
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

-- 
You are receiving this mail because:
You are the assignee for the bug.
