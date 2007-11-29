From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9475] New: jiffies counter leaps on CPU frequency changes
Date: Thu, 29 Nov 2007 08:36:24 -0800 (PST)
Message-ID: <bug-9475-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9475

           Summary: jiffies counter leaps on CPU frequency changes
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24-rc3
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: stefano.brivio@polimi.it


Most recent kernel where this bug did not occur: unknown. I'm sorry, I can't
test 2.6.23 because of some dm-crypt issue.

Distribution: Gentoo.

Hardware Environment:
st3@morte ~ $ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.50GHz
stepping        : 6
cpu MHz         : 1500.000
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat
clflush dts acpi mmx fxsr sse sse2 ss tm pbe bts est tm2
bogomips        : 2993.49
clflush size    : 64

Software environment: acpi-cpufreq module.

Problem Description:
when I switch the CPU frequency, the jiffies counter gets scaled by the ratio
of <old_frequency/new_frequency>, e.g.:

morte ~ # cpuspeedy max
cpuspeedy: CPU speed is now 1.50 GHz (100%) temperature is 55 C
morte ~ # tail -n1 /var/log/messages
[10609.463888] wmaster0: STA 00:14:c1:35:8d:eb Average rate: 10 (50/5)
morte ~ # cpuspeedy med
cpuspeedy: CPU speed is now 1 GHz (66%) temperature is 72 C
[15996.701445] wmaster0: STA 00:14:c1:35:8d:eb Average rate: 10 (60/6)

This isn't just an aesthetic issue, as many device drivers rely on the jiffies
counter.

Steps to reproduce:
see above.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
