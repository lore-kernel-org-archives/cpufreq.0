From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10968] New: p4-clockmod reports false frequency
Date: Mon, 23 Jun 2008 10:11:14 -0700 (PDT)
Message-ID: <bug-10968-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10968

           Summary: p4-clockmod reports false frequency
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.25.7
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: ott@enolink.de


# uname -a
Linux hyperix 2.6.25.7 #2 Sat Jun 21 14:12:02 CEST 2008 i686 Intel(R)
Pentium(R) 4 CPU 1.80GHz GenuineIntel GNU/Linux
# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 1
model name      : Intel(R) Pentium(R) 4 CPU 1.80GHz
stepping        : 2
cpu MHz         : 3650.000
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pebs bts
bogomips        : 3603.33
clflush size    : 64

# cpufreq-info 
cpufrequtils 0.4: cpufreq-info (C) Dominik Brodowski 2004
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 3.65 GHz - 14.60 GHz
  available frequency steps: 3.65 GHz, 5.48 GHz, 7.30 GHz, 9.13 GHz, 10.95 GHz,
12.78 GHz, 14.60 GHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 3.65 GHz and 14.60 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 5.48 GHz (asserted by call to hardware).

Latest working kernel version: 2.6.23 (last version that I tried)

Any suggestions?

To me it seems that the bit shift width is incorrect. I had a similar problems
years ago and fixed by adding a different bit shift width for Pentium 4 Model 0
and 1.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
