From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 30712] Slow transitioning AMD ondemand CPU because of wrong
 sampling_rate
Date: Tue, 29 Mar 2011 15:29:12 GMT
Message-ID: <201103291529.p2TFTCfD030280@demeter1.kernel.org>
References: <bug-30712-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-30712-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=30712


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |ASSIGNED
         AssignedTo|cpufreq@vger.kernel.org     |trenn@suse.de




--- Comment #7 from Thomas Renninger <trenn@suse.de>  2011-03-29 15:29:11 ---
> Decreasing sampling_rate is still good for performance, but the total time is
> much shorter in every cases
Thanks, so there may be a fix/improvement in 2.6.38?

It will still take some time, as this is rather time intensive.
Also prio is not that high as there is no real regression.
But I am going to revisit the issue in some weeks and may come up with some
fine tuning.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
