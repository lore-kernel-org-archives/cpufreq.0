From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 12:14:16 +0000
Message-ID: <bug-65501-12968-MQkHaQr0mO@https.bugzilla.kernel.org/>
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

--- Comment #7 from sworddragon2@aol.com ---
> I don't think it ever had it. I checked 2.6.30 and 3.0.. they don't have it. :)

Very interestingly.


> No, that's not right. We will go to max frequency if load has increased over up_threshold, otherwise freq will be proportional to load.

Thanks, this makes things much clearer (especially if I think on another
report). This will now leave a simple question: Why is
MIN_FREQUENCY_UP_THRESHOLD not 1?

-- 
You are receiving this mail because:
You are the assignee for the bug.
