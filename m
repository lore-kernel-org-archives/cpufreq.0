From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Tue, 8 Mar 2011 10:02:44 GMT
Message-ID: <201103081002.p28A2iND024370@demeter1.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #12 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-08 10:02:42 ---
Thx very much for your input. I think might Athlon is XP-M(obile) Barton 2400+.

# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 10
model name      : Mobile AMD Athl
stepping        : 0
cpu MHz         : 1802.161
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 3604.32
clflush size    : 32
cache_alignment : 32
address sizes   : 34 bits physical, 32 bits virtual
power management: ts fid vid

If I understand well, you say that it is possible to keep sleep state C1 but C2
is a mess ?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
