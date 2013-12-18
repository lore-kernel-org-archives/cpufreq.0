From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65501] Blind angle of 1% between up_threshold and
 down_threshold
Date: Wed, 18 Dec 2013 10:52:28 +0000
Message-ID: <bug-65501-12968-T46z82wtUg@https.bugzilla.kernel.org/>
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

--- Comment #3 from sworddragon2@aol.com ---
> So more clarification required from your side on this issue.

As far as I know some time ago the default value of down_threshold was set to
10 and after it was removed from procfs it was still set internally to 10. Just
try to set up_threshold to 10 or lower - it will be refused. So there is still
a min limit of 11 for up_threshold.

-- 
You are receiving this mail because:
You are the assignee for the bug.
