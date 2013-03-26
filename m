From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54761] Variable cpu frequency causes to loose performance
Date: Tue, 26 Mar 2013 13:24:50 +0000 (UTC)
Message-ID: <20130326132450.DF86811FB0C@bugzilla.kernel.org>
References: <bug-54761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-54761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54761





--- Comment #5 from sworddragon2@aol.com  2013-03-26 13:24:50 ---
I thought 1400 MHz @ ~50% cpu load vs 2700 MHz @ ~25% cpu load would have
mathematically ~the same performance but it doesn't seem so. What is the reason
for this? Maybe because of short 100% peaks that aren't enough for an
upscaling?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
