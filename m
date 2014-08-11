From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75661] AMD A8-4500M: acpi-cpufreq cannot use lowest reported
 P-state
Date: Mon, 11 Aug 2014 07:57:13 +0000
Message-ID: <bug-75661-12968-DUxhaHQwOn@https.bugzilla.kernel.org/>
References: <bug-75661-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75661-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75661

Zhang Rui <rui.zhang@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|---                         |INVALID
           Assignee|cpufreq@vger.kernel.org     |rui.zhang@intel.com

--- Comment #3 from Zhang Rui <rui.zhang@intel.com> ---
From the log, we can see that BIOS does not tell OS that 900MHZ is available.
maybe you can re-check after booting with AC unplugged, but anyway, I will
close this as it is not a kernel issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.
