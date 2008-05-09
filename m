From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10653] New: p4-clockmod gets a wrong max clock (1.2GHz insted
	1.6GHz)
Date: Thu,  8 May 2008 18:10:17 -0700 (PDT)
Message-ID: <bug-10653-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10653

           Summary: p4-clockmod gets a wrong max clock (1.2GHz insted
                    1.6GHz)
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: andrea.cimitan@gmail.com


Latest working kernel version: I don't know
Hardware Environment: P4 1.6 GHz
Problem Description:
My p4 1.6GHz gets a wrong max speed using p4-clockmod.
Available frequencies taken from cpufreq-info (same output for cat
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies).

Using acpi-cpufreq:
1.20 GHz, 1.60GHz
using p4-clockmod: 
150 MHz, 300 MHz, 450 MHz, 600 MHz, 750 MHz, 900 MHz, 1.05 GHz, 1.20 GHz

I'm forced to use acpi-cpufreq :).

Useful cpuinfo for model and stepping:
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 Mobile CPU 1.60GHz
stepping        : 4
cpu MHz         : 1200.000
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm up pebs bts
bogomips        : 2395.99
clflush size    : 64


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
