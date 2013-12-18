From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 14:33:20 +0000
Message-ID: <bug-65501-12968-vYLYpGlaBE@https.bugzilla.kernel.org/>
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

--- Comment #9 from sworddragon2@aol.com ---
Are you sure? As much as I understand this wouldn't the cpu only scale up if it
reaches 1% of cpu usage? Wouldn't the frequency then scale down as soon as the
system is in idle with ~0%?

-- 
You are receiving this mail because:
You are the assignee for the bug.
