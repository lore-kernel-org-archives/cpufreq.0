From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Wed, 10 Nov 2010 12:51:16 GMT
Message-ID: <201011101251.oAACpGjG032016@demeter2.kernel.org>
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


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |DOCUMENTED




--- Comment #50 from Thomas Renninger <trenn@suse.de>  2010-11-10 12:51:11 ---
> Will the scheduler adapt to the changed cpu features with only that single
> change?
Yes, the only part I found using it always checks for:
if (has_cpu_cap(X86_FEATURE_APERFMPERF))
     use_it()
So unsetting the cap effectively disables usage there on the next schedule.
This may change in the future, as said it's a hack...
Perfect would be a boot param disbable_cpu_cap=xy, but as most of these caps
are evaluated early it's hard to implement.

vyncere: Looks like Linux works correctly according to your BIOS settings :)

Not sure whether I should set this invalid. I set it documented, if there are
more machines with broken aperf/mperf timers, they might find it and if this
should be a more common issue, it still can be thought of a fix/workaround for
the kernel.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
