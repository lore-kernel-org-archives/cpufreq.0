From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] OOPS in cpufreq driver with AMD Kaveri CPU - AMD
 Athlon(tm) 5150 APU with Radeon(tm) R3
Date: Tue, 14 Apr 2015 16:04:13 +0000
Message-ID: <bug-81701-12968-OQ5BNSV53n@https.bugzilla.kernel.org/>
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

Oleksandr Natalenko <oleksandr@natalenko.name> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|---                         |INVALID

--- Comment #20 from Oleksandr Natalenko <oleksandr@natalenko.name> ---
Definitely not a kernel bug.

I've replaced RAM module with another one and the issue went away.

No idea why oopses refered to ACPI, but they seem to be the result of simple
hardware incompatibility.

-- 
You are receiving this mail because:
You are the assignee for the bug.
