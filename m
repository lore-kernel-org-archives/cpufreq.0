From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Sat, 16 Oct 2010 08:56:42 GMT
Message-ID: <201010160856.o9G8ugxB018001@demeter2.kernel.org>
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





--- Comment #18 from vyncere <vyncere@gmail.com>  2010-10-16 08:56:37 ---
I just did some tests with >= 2.6.33 Kernels.

* Results :

2.6.33    : KERNEL_PANIC (Ouch !!!)
2.6.33.1  : Ondemand scaling KO (freeze my laptop after few minutes... I did
not investigate deeply...)

In any case, just before freezing, I had enough time to check cpufreq-info and
cpuidle state. 

* cpufreq-info print out the same "hardware limits" and "cpufreq stats" that I
reported higher in this thread, when Ondemand governor failed to scale.

So the regression may highly appear since 2.6.33.

* The current driver used for cpuidle was "acpi_idle".

So, if intel_idle driver is not incriminated, we can check the differences
between 2.6.32.24 and 2.6.33[.1] Kernel tree, which may cause this regression.

* Comparing the two "drivers/cpufreq" directories, there are some changes
between :
- cpufreq.c (add bios limit reading and release the rwsem around governor)
- cpufreq_conservative.c (some stuffs, but I never use this gouvernor)
- cpufreq_ondemand.c (very few : add a condition to read the new min policy)
- freq_table.c (some function names refactoring)

I'm not a kernel hacker and I do not know (not yet) how the cpufreq API works.

I hope this information will help you.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
