From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9729] New: ondemand cpufreq governor doesn't see when
	kcryptd/dm-crypt is busy
Date: Fri, 11 Jan 2008 04:29:30 -0800 (PST)
Message-ID: <bug-9729-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9729

           Summary: ondemand cpufreq governor doesn't see when kcryptd/dm-
                    crypt is busy
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.23.11
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: tch@wpkg.org


Distribution: Debian Etch

Problem Description:

It seems that ondemand cpufreq governor doesn't see when CPU is busy with
kcryptd/dm-crypt.

With ondemand cpufreq governor reads/writes from a dm-crypt device will be very
slow.


Steps to reproduce

First, let's use "ondemand" governor - reads will be only about ~8 MB/s.

# echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# cat /proc/cpuinfo | grep MHz
cpu MHz         : 349.991
cpu MHz         : 349.991


# echo 3 > /proc/sys/vm/drop_caches

# dd if=/dev/san2_data/test of=/dev/null bs=64k count=1000
1000+0 records in
1000+0 records out
65536000 bytes (66 MB) copied, 8.64089 seconds, 7.6 MB/s



Now, let's use performance governor - we get almost 60 MB/s:

# echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# cat /proc/cpuinfo | grep MHz
cpu MHz         : 2799.930
cpu MHz         : 2799.930

# echo 3 > /proc/sys/vm/drop_caches

# dd if=/dev/san2_data/test of=/dev/null bs=64k count=1000
1000+0 records in
1000+0 records out
65536000 bytes (66 MB) copied, 1.14821 seconds, 57.1 MB/s



Some system information:


# uname -a
Linux san2 2.6.23.12-pata #10 SMP Fri Dec 21 15:59:53 CET 2007 i686 GNU/Linux


# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Xeon(TM) CPU 2.80GHz
stepping        : 9
cpu MHz         : 349.991
cache size      : 512 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pebs bts sync_rdtsc
cid xtpr
bogomips        : 5585.42
clflush size    : 64

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Xeon(TM) CPU 2.80GHz
stepping        : 9
cpu MHz         : 349.991
cache size      : 512 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pebs bts sync_rdtsc
cid xtpr
bogomips        : 5582.16
clflush size    : 64


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
