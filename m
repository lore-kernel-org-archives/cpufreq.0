From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] Problems with hibernation, with bisect
Date: Mon, 25 Nov 2013 02:49:41 +0000
Message-ID: <bug-65671-12968-yjRtWgvLOl@https.bugzilla.kernel.org/>
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

--- Comment #2 from higuita <higuita@gmx.net> ---
As asked, i tried to revert the commit on 3.12.1 and test and the crashes after
the wakeup are still there. So looks like that commit is not the only one that
broke this.

Any tip how to debug/bisect this now?

-- 
You are receiving this mail because:
You are the assignee for the bug.
