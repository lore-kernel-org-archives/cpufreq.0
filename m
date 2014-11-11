From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] OOPS in cpufreq driver with AMD Kaveri CPU - AMD
 Athlon(tm) 5150 APU with Radeon(tm) R3
Date: Tue, 11 Nov 2014 10:42:11 +0000
Message-ID: <bug-81701-12968-OWEmIjYn22@https.bugzilla.kernel.org/>
References: <bug-81701-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-81701-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=81701

--- Comment #18 from Oleksandr Natalenko <oleksandr@natalenko.name> ---
It seems that this bug has nothing to do with acpi-cpufreq code but with 
another ACPI area.

With ACPI enabled kernel may hang in a day or in a week (never survived more 
than approx. 2 weeks). With acpi=off it seems to work OK. For instance, I had 
to boot Ubuntu installer with acpi disabled to finish it successfully.

Usually, hanging is not accompanied by panic log. Only small vertical red 
lines appear on the screen near letters (tried to use plaintext 80x25 console 
without radeon and got the same issue).

Still observing this for 3.16 kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.
