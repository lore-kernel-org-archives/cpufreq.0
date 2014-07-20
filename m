From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 80651] [intel_pstate] pstate settings are lost during
 suspend/resume cycle
Date: Sun, 20 Jul 2014 10:43:44 +0000
Message-ID: <bug-80651-12968-WjGLmmJZBN@https.bugzilla.kernel.org/>
References: <bug-80651-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-80651-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=80651

--- Comment #3 from Tobias Jakobi <liquid.acid@gmx.net> ---
I realized that changing and restoring the values doesn't quite do it. The
issue seems related to the fact that I usually have two of the four cores
disabled (by offlining the cpus that are associated to core ids 2 and 3).

I have to bring all cores online again, then set the values, and then I can
take core 2 and 3 offline again.

-- 
You are receiving this mail because:
You are the assignee for the bug.
