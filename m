From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked
Date: Fri, 06 Dec 2013 01:59:27 +0000
Message-ID: <bug-65671-12968-ONE152eAEC@https.bugzilla.kernel.org/>
References: <bug-65671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65671-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65671

--- Comment #9 from higuita <higuita@gmx.net> ---
Another recompile and tests and i found that the problem is in the
"conservative" governor. Using the "ondemand" governor i found no problem for
several hibernate-resume cycles... when i switch to the conservative governor
and try to hibernate for the second time, i get IO/swap problems.

I usually use the conservative governor, so that is why i'm getting this
problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.
