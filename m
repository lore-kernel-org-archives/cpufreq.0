From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 30712] Slow transitioning AMD ondemand CPU because of wrong
 sampling_rate
Date: Thu, 24 Mar 2011 21:58:24 GMT
Message-ID: <201103242158.p2OLwOS9030146@demeter2.kernel.org>
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
             Status|NEW                         |NEEDINFO




--- Comment #4 from Thomas Renninger <trenn@suse.de>  2011-03-24 21:58:24 ---
Great, thanks!
I know this runs for a while..., but could you let it run (over night?) with
different sampling_rate values (this was default, 109ms?).
Best: min, default and one or 2 in between (above was 

I agree that it would make sense to hardcode latency values in powernow-k8 at
least for some families. Even latency is wrong then, it should get set in a way
that ondemand takes best sampling rate values later.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
