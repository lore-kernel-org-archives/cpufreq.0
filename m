From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 8 Nov 2010 12:49:10 GMT
Message-ID: <201011081249.oA8CnAr6031129@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #47 from Thomas Renninger <trenn@suse.de>  2010-11-08 12:49:05 ---
> since this will prevent the kernel from being compiled.
Yep, you would need to touch the other places where it gets evaluated as well.

Easiest for you should be to take the patch you verified working from comment
#34 (with the boot/module param described somewhere...):
acpi-cpufreq: Provide param to disable average HW statistics for broken timers
If you want to make sure scheduler also does not make use of the timers you can
additionally add something like:

struct cpuinfo_x86 *c;
...
c = &cpu_data(cpu);
clear_cpu_cap(c, X86_FEATURE_APERFMPERF);

This is an ugly hack, but should work for you.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
