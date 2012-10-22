From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Mon, 22 Oct 2012 13:44:45 +0000 (UTC)
Message-ID: <20121022134445.0B63111FAE0@bugzilla.kernel.org>
References: <bug-49231-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-49231-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49231


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |trenn@suse.de




--- Comment #1 from Thomas Renninger <trenn@suse.de>  2012-10-22 13:44:44 ---
Can you use "cpupower monitor"
(tools/power/cpupower)
instead of turbostat.
Then you will also see what idle states the kernel requested.
Does this single job (or something else) produce interrupts frequently (maybe
powertop helps in this respect)?
This would explain why C1 and no deeper sleep states are entered.
If properly configured, "cpupower top" should invoke the powertop tool.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
