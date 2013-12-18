From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 11:09:08 +0000
Message-ID: <bug-65501-12968-8X91mnEZPq@https.bugzilla.kernel.org/>
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

--- Comment #6 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to sworddragon2 from comment #5)
> I'm talking about ondemand and it had in the past down_threshold.

I don't think it ever had it. I checked 2.6.30 and 3.0.. they don't have it. :)

> Just for clarification: If there is no down_threshold anymore how will the
> cpu scale down its frequency? I was simply assuming that this will happen
> now at 10%.

No, that's not right. We will go to max frequency if load has increased over
up_threshold, otherwise freq will be proportional to load.

-- 
You are receiving this mail because:
You are the assignee for the bug.
