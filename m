From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Thu, 19 Dec 2013 10:16:14 +0000
Message-ID: <bug-65501-12968-UlQFbobjVB@https.bugzilla.kernel.org/>
References: <bug-65501-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65501-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65501

--- Comment #16 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to sworddragon2 from comment #15)
> Normally having such a freedom was the choice I have abandoned Windows over 3
> years ago :)

I don't want you to go to windows again :) 

@Rafael: What do you say? Probably we can lower the MIN possible value of
UP_THRESHOLD, that wouldn't affect any existing user.

-- 
You are receiving this mail because:
You are the assignee for the bug.
