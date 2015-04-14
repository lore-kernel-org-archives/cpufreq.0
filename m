From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 81701] OOPS in cpufreq driver with AMD Kaveri CPU - AMD
 Athlon(tm) 5150 APU with Radeon(tm) R3
Date: Tue, 14 Apr 2015 15:47:53 +0000
Message-ID: <bug-81701-12968-Yx8d51Adur@https.bugzilla.kernel.org/>
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

Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #19 from Len Brown <lenb@kernel.org> ---
Subject:    Re: [BUG] oops in cpufreq driver with AMD Kaveri CPU
From:       Oleksandr Natalenko <oleksandr () natalenko ! name>
Date:       2014-11-18 19:07:51

acpi=off as well as disabling ASPM and NMI watchdog didn't help

Now trying to update BIOS.

P.S. Still affected while using 3.17.2 kernel.

ref. http://marc.info/?l=linux-acpi&m=141633767812764&w=2

Did the BIOS update help?
Are you certain that running an old kernel is stable?

-- 
You are receiving this mail because:
You are the assignee for the bug.
