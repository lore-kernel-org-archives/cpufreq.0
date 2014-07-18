From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 80651] [intel_pstate] pstate settings are lost during
 suspend/resume cycle
Date: Fri, 18 Jul 2014 22:41:54 +0000
Message-ID: <bug-80651-12968-yGColDQmPG@https.bugzilla.kernel.org/>
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

--- Comment #2 from Tobias Jakobi <liquid.acid@gmx.net> ---
Created attachment 143451
  --> https://bugzilla.kernel.org/attachment.cgi?id=143451&action=edit
i7z output

This is some generic output by i7z when the cpu is in 'low' perf mode
(max_perf_pct=55, min_perf_pct=23, no_turbo=1).

After resume, while these settings above didn't change, the multiplicator
sticks to around 24.5.

-- 
You are receiving this mail because:
You are the assignee for the bug.
