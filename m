From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 14:29:39 +0000
Message-ID: <bug-65501-12968-iGlJZkj770@https.bugzilla.kernel.org/>
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

--- Comment #8 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to sworddragon2 from comment #7)
> Why is MIN_FREQUENCY_UP_THRESHOLD not 1?

That would be foolish :)

This will make CPU run on max frequency all the time.

-- 
You are receiving this mail because:
You are the assignee for the bug.
