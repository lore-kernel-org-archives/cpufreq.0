From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Thu, 10 Mar 2011 16:22:13 GMT
Message-ID: <201103101622.p2AGMDHP021904@demeter2.kernel.org>
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





--- Comment #21 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-10 16:22:11 ---
You are right the machine is a bit old. There is no HPET. The
processor.max_cstate=1 is indeed a simple workaround. powernow_k7.ko seems to
work with manual configuration but 

modprobe powernow-k7 fsb=133 overwrite_table=1 multiplier=75,105,135
switch_latency=650

has the immediate consequence that TSC becomes unstable (no because of C2 but
because of multiplier/frequency chance).

Mar 10 12:43:21 minipc klogd: [61408.385984] powernow: PowerNOW! Technology
present. Can scale: frequency and voltage.
Mar 10 12:43:21 minipc klogd: [61408.386033] powernow: Overwriting PST table
with manual settings
Mar 10 12:43:21 minipc klogd: [61408.386055] VID: 0xb (1.450V)
Mar 10 12:43:21 minipc klogd: [61408.386068] VID: 0xb (1.450V)
Mar 10 12:43:21 minipc klogd: [61408.386081] VID: 0xb (1.450V)
Mar 10 12:43:22 minipc klogd: [61408.386133] powernow: Minimum speed 997 MHz.
Maximum speed 1795 MHz.
Mar 10 12:43:22 minipc klogd: [61408.386192] Marking TSC unstable due to
cpufreq changes
Mar 10 12:43:22 minipc klogd: [61408.388262] Switching to clocksource acpi_pm

Since my server is not overheated and a working timer seems mandatory, I will
stick to the workaround 

processor.max_cstate=1 

Thank you very much for your help.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
