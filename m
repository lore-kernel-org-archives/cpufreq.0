From: bugme-daemon@osdl.org
Subject: [Bug 3872] New: Bad frequencies detected
Date: Mon, 6 Dec 2004 05:45:48 -0800
Message-ID: <200412061345.iB6DjmYf012480@fire-1.osdl.org>
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

http://bugme.osdl.org/show_bug.cgi?id=3872

           Summary: Bad frequencies detected
    Kernel Version: 2.6.9
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: nicolasdufour@earthlink.net


Distribution: ArchLinux

Hardware Environment:
  Laptop Inspiron 5150
  Pentium 4 M 2.8GHz

Software Environment:

Problem Description:
I try to use a module to change the frequency of the processor. I have tested
speedstep-ich, acpi and p4_clockmod and all of them detect bad freqencies !

speedstep-ich and acpi detect only 2 frequencies : 1.6GHz and 2.8Hz.
p4_clockmod detects 8 frequencies but from 100MHz to 1.5GHz.

Steps to reproduce:

1. modprobe acpi or speedstep_ich
2. cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
3. display :
2800000 2800000 2800000 2800000 2800000 1600000

1. modprobe p4_clockmod
2. cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
3. display :
199995 399990 599985 799980 999975 1199970 1399965 1599960

Here is my /proc/cpuinfo
-----------------------------------------------------
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4     CPU 2.80GHz
stepping        : 9
cpu MHz         : 2790.800
cache size      : 512 KB
physical id     : 0
siblings        : 1
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid xtpr
bogomips        : 3155.16
-----------------------------------------------------

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
