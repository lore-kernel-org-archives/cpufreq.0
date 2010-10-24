From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Sun, 24 Oct 2010 23:10:15 GMT
Message-ID: <201010242310.o9ONAFeR004547@demeter1.kernel.org>
References: <bug-16072-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16072-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16072





--- Comment #22 from Thomas Renninger <trenn@suse.de>  2010-10-24 23:10:02 ---
> But just to make certain: in case of overheating, where does linux control the
> thermal protection of these CPU's? Especially now, WITHOUT drivers?
There is for example a HW based thermal protection.
The HW will throttle (same technique as p4_clockmod) automatically and send a
MCE (Machine Check Exception) to inform the user.
Compare with:
arch/x86/kernel/cpu/mcheck/therm_throt.c
Even if this should not be implemented, the CPU will always have a "switch off
hard" mechanism in case of not working or missing fans and similar.

> If the
> answer here is p4_clockmod (or acpi-cpufreq), one might even think about
> raising the importance of this bug, considering the potential overheating
> isues, which are of course not uncommon in notebooks.
As it's not only HP, but several vendors (every?) showing this issue with this
specific CPU model, I expect it's working as designed.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
