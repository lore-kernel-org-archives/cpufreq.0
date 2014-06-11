From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 14:21:48 +0000
Message-ID: <bug-77201-12968-zu3fro5kSj@https.bugzilla.kernel.org/>
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

--- Comment #44 from registosites@hotmail.com ---
I think acpi-cpufreq is needed, unless I'm not seeing this correctly (which is
quite likely). Using nconfig and asking for SymInfo on AMD Opteron/Athlon64
PowerNow! (which is required to test the problem at hand) I get:

CONFIG_X86_POWERNOW_K8:
(...)
Depends on: CPU_FREQ [=y] && X86 [=y] && ACPI [=y] && ACPI_PROCESSOR [=m] &&
X86_ACPI_CPUFREQ [=m]

Doesn't this mean acpi-cpufreq is needed?

-- 
You are receiving this mail because:
You are the assignee for the bug.
