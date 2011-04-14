From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 33202] cpufreq-info 008 only reports maximum "current
 frequency", contradicts cpufreq stats and /proc/cpuinfo
Date: Thu, 14 Apr 2011 15:18:45 GMT
Message-ID: <201104141518.p3EFIjuQ003656@demeter2.kernel.org>
References: <bug-33202-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-33202-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=33202





--- Comment #3 from Leho Kraav <leho@kraav.com>  2011-04-14 15:18:44 ---
after doing parameter changes, cpufreq-info now reports minimum frequencies as
well. i may be able to produce a diff but it might be unlikely. im guessing
this one can be closed until or if i get some more info.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
