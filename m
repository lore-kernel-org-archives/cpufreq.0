From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42924] /proc/cpuinfo reports wrong frequency (compared to
 cpufreq-info)
Date: Tue, 29 Jan 2013 03:48:21 +0000 (UTC)
Message-ID: <20130129034821.B308611FE9A@bugzilla.kernel.org>
References: <bug-42924-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42924-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42924


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
          Component|Config-Processors           |cpufreq
         Resolution|                            |DOCUMENTED
         AssignedTo|lenb@kernel.org             |cpufreq@vger.kernel.org
            Product|ACPI                        |Power Management




--- Comment #2 from Len Brown <lenb@kernel.org>  2013-01-29 03:48:21 ---
turbostat tells the truth about what the HW is doing.
So in this case, all 4 threads (2 cores) are running at 3.3 GHz.

cpufreq is showing you 2.8 b/c that is what the OS requested.
It doesn't know that turbo HW can deliver 3.3 when it requests 2.801.

Also, on multi-core systems, the voltage is raised to support
the highest frequency request and all the cores run at that frequency.
Here 3 cpus asked for 2.8 and cpu0 asked for 800.  But cpu0 will run
at the same speed of the others even though it last requested less.

This is a longstanding problem with /proc/cpuinfo --
it is showing a cached request value, not an actual value.
The values in cpufreq are only slightly better...

Some day we may fix this, but probably only after
some major surgery (or wholesale replacement) of cpufreq.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
