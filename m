From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Tue, 18 Jan 2011 08:07:23 GMT
Message-ID: <201101180807.p0I87MxQ007572@demeter1.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |lenb@kernel.org
         Resolution|                            |UNREPRODUCIBLE
            Summary|SKGE driver OOPSes randomly |AthlonXP-M
                   |using cpu freq scaling on   |
                   |AthlonXP-M                  |




--- Comment #8 from Len Brown <lenb@kernel.org>  2011-01-18 08:07:20 ---
the driver oops's were watchdog timeouts,
so it does appear that this is a timer-related issue rather than a crash.

I don't know much about Athlon, but I believe that the idle
power states and the frequency scaling are interrelated.

Possibly when you disabled frequency scaling, you also
disabled their idle states, which is where you might have
problems with the TSC and/or the LAPIC timer.

Anyway, please re-open this if there is still a problem
with the latest stable kernel.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
