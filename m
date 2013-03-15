From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55261] down_threshold is missing
Date: Fri, 15 Mar 2013 12:02:09 +0000 (UTC)
Message-ID: <20130315120209.86C2611F8CD@bugzilla.kernel.org>
References: <bug-55261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55261





--- Comment #2 from sworddragon2@aol.com  2013-03-15 12:02:09 ---
This makes it dificult to get an early upscaling of the cpu frequency. I'm
trying to achieve this at ~1% cpu usage. Would it be possible after this commit
to allow up_threshold to be lower (for example 1 on my system)?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
