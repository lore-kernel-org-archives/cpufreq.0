From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8634] Unstable clocksource reported
Date: Sat, 16 Jun 2007 00:05:43 -0700 (PDT)
Message-ID: <20070616070543.8AE0A11C001@picon.linux-foundation.org>
References: <bug-8634-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8634-3570@http.bugzilla.kernel.org/>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8634


patrick.matthaei@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |patrick.matthaei@web.de




------- Comment #2 from patrick.matthaei@web.de  2007-06-16 00:08 -------
Some additional infos:

the-me:~# cat
/sys/devices/system/clocksource/clocksource0/available_clocksource
acpi_pm pit jiffies tsc

the-me:~# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 55
model name      : AMD Athlon(tm) 64 Processor 4000+
stepping        : 2
cpu MHz         : 1000.000
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext fxsr_opt lm 3dnowext
3dnow pni lahf_lm ts fid vid ttp
bogomips        : 2011.84
clflush size    : 64


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
