From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 10:56:11 +0000
Message-ID: <bug-65501-12968-MgUL53hCYM@https.bugzilla.kernel.org/>
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

--- Comment #4 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to sworddragon2 from comment #3)
> As far as I know some time ago the default value of down_threshold was set

Which governor are you talking about? Ondemand doesn't have down_threshold.

> to 10 and after it was removed from procfs it was still set internally to
> 10. Just try to set up_threshold to 10 or lower - it will be refused. So
> there is still a min limit of 11 for up_threshold.

That's the value of MIN_FREQUENCY_UP_THRESHOLD (11) and so it will fail for
values <= 10..

So, what do you want to change now ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
