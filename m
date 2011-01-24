From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19672] ondemand is slow
Date: Mon, 24 Jan 2011 13:01:27 GMT
Message-ID: <201101241301.p0OD1R8T008016@demeter2.kernel.org>
References: <bug-19672-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19672-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19672


Florian Mickler <florian@mickler.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |florian@mickler.org
         Resolution|                            |CODE_FIX




--- Comment #1 from Florian Mickler <florian@mickler.org>  2011-01-24 13:01:27 ---
a fix for this has been merged in .37-rc1:
commit 3f78a9f7fcee0e9b44a15f39ac382664e301fad5
Author: David C Niemi <dniemi@verisign.com>
Date:   Wed Oct 6 16:54:24 2010 -0400

    [CPUFREQ] add sampling_down_factor tunable to improve ondemand performance

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
