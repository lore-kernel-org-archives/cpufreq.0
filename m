From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 11:02:13 +0000
Message-ID: <bug-65501-12968-Bd1UO03Chv@https.bugzilla.kernel.org/>
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

--- Comment #5 from sworddragon2@aol.com ---
> Which governor are you talking about? Ondemand doesn't have down_threshold.

I'm talking about ondemand and it had in the past down_threshold.


> So, what do you want to change now ?

Just for clarification: If there is no down_threshold anymore how will the cpu
scale down its frequency? I was simply assuming that this will happen now at
10%.

-- 
You are receiving this mail because:
You are the assignee for the bug.
