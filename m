From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 36652] Ondemand governor is hyperactive
Date: Sat, 4 Jun 2011 17:37:10 GMT
Message-ID: <201106041737.p54HbAra023533@demeter2.kernel.org>
References: <bug-36652-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-36652-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=36652


Markus Trippelsdorf <markus@trippelsdorf.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |markus@trippelsdorf.de




--- Comment #1 from Markus Trippelsdorf <markus@trippelsdorf.de>  2011-06-04 17:37:09 ---
I see similar symptoms in >=2.6.38 as described here:
http://thread.gmane.org/gmane.linux.kernel.cpufreq/7167

Can you try to revert commit 5cb2c3bd0c5e0f3ced63f250ec2ad59d7c5c626a
and see if it makes any difference in your case?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
