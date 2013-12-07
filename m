From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 66751] Does not resume from suspend (bisected)
Date: Sat, 07 Dec 2013 13:50:30 +0000
Message-ID: <bug-66751-12968-c6th2bh1S4@https.bugzilla.kernel.org/>
References: <bug-66751-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-66751-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=66751

--- Comment #1 from Martin Ziegler <ziegler@uni-freiburg.de> ---
reverting 2167e2399dc5e69c62db56d933e9c8cbe107620a solves the problem

-- 
You are receiving this mail because:
You are the assignee for the bug.
