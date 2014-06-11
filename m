From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 14:42:02 +0000
Message-ID: <bug-77201-12968-QULlp1jgkn@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #45 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to registosites from comment #44)
> Depends on: CPU_FREQ [=y] && X86 [=y] && ACPI [=y] && ACPI_PROCESSOR [=m] &&
> X86_ACPI_CPUFREQ [=m]

I don't have a clue why does it depend on that :(

Anyway, I have updated my branch with two more commits (at top) and it does
compile now.

In case these revert fixes it for you and you try to identify which revert
fixed it, you might also need to apply top revert to get things compiled.

-- 
You are receiving this mail because:
You are the assignee for the bug.
