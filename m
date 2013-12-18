From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 06:16:18 +0000
Message-ID: <bug-65501-12968-YYF1QoxzbF@https.bugzilla.kernel.org/>
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

--- Comment #2 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to sworddragon2 from comment #0)
> The lowest value that /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
> can contain is 11 while the implicit configuration down_threshold will be
> statically set to 10.

I got a bit confused. You are talking about up_threshold and down_threshold for
ondemand governor. Whereas down_threshold isn't there for ondemand governor.
Its only there for conservative governor. And there are no such max/min limits
available there.

So more clarification required from your side on this issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.
