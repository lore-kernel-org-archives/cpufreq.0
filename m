From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 41292] scaling_min_freq reverts to cpuinfo_min_freq after wake
 up
Date: Thu, 9 Feb 2012 23:10:14 GMT
Message-ID: <201202092310.q19NAEuK013657@bugzilla.kernel.org>
References: <bug-41292-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-41292-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=41292





--- Comment #3 from Bill Longman <bill.longman@gmail.com>  2012-02-09 23:10:13 ---
On 3.2.5, all the cores >0 have scaling_min_freq at cpuinfo_min_freq.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
