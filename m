From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 8 Nov 2010 12:32:42 GMT
Message-ID: <201011081232.oA8CWgN9029397@demeter1.kernel.org>
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





--- Comment #46 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-11-08 12:32:34 ---
Concerning the changes to arch/x86/kernel/include/asm/cpufeatures.h:

I can't just kill the line
#define X86_FEATURE_APERFMPERF (3*32+28) /* APERFMPERF */
since this will prevent the kernel from being compiled.
For now I changed the line to
#define X86_FEATURE_APERFMPERF (6*32+11) /* APERFMPERF */
which changes the checked feature to SSE5 instead of AMPERF - my CPU does not
support SSE5 and this should report a non-set bit.

Not the most elegant solution and of course not really portable to newer cpus,
but it sure does the trick.
Do you have a better idea to hard-code that feature to zero in the kernel code?
Is there a CPUID bit that's 0 by default for all processors?

I looked at related kernel code, but I don't think there's an easier or better
fix at another place in the code, as the way I choose to go makes the feature
reported as non-present for all code in the kernel.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
