From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7186] New: p4-clockmod reports wrong MHz in /proc/cpuinfo
	desktop P4
Date: Fri, 22 Sep 2006 11:29:00 -0700
Message-ID: <200609221829.k8MIT08E023358@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7186

           Summary: p4-clockmod reports wrong MHz in /proc/cpuinfo desktop
                    P4
    Kernel Version: 2.6.18
            Status: NEW
          Severity: low
             Owner: cpufreq@www.linux.org.uk
         Submitter: kernel_bugs@tstotts.net
                CC: linux@brodo.de


Most recent kernel where this bug did not occur:
This always occurs since 2.6.16. No idea about earlier versions.

Distribution:
    Gentoo.  Verified bug with vanilla kernel.
Bug was originally filed at:
    http://bugs.gentoo.org/show_bug.cgi?id=141234
Possibly related:
    Bug 6367

Hardware Environment:
    Dell Dimension 8100
    Pentium 4 1300 MHz w/ RDRAM from mid-2001

Software Environment:
    N/A

Problem Description:
    p4-clockmod produces wrong MHz statistics in /proc/cpuinfo
    Simple benchmark with Perl script adding 1000s of integers shows that the 
frequency scaling works correctly and that the CPU is not being over-clocked.

Steps to reproduce:

#### (1) without p4-clockmod loaded:
# cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 0
model name	: Intel(R) Pentium(R) 4 CPU 1300MHz
stepping	: 7
cpu MHz		: 1285.413
cache size	: 256 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips	: 2573.13

#### (2) with p4-clockmod loaded:
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
525000 787500 1050000 1312500 1575000 1837500 2100000
# cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 0
model name	: Intel(R) Pentium(R) 4 CPU 1300MHz
stepping	: 7
cpu MHz		: 2100.000
cache size	: 256 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips	: 2573.13

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
