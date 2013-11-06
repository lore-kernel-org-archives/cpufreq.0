From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Wed, 06 Nov 2013 18:58:01 +0000
Message-ID: <bug-64261-12968-cinT3DFFBq@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #16 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
(In reply to Doug Smythies from comment #12)
> Created attachment 113591 [details]
> CPU 7 frequency vs load. Turbo off. With and without rounding.
> 
> The load on cpu 7 varies from 0.005 to 0.995 in steps of 0.005 at 10 seconds
> per step. The frequency is monitored at 10 Hertz.

Are you still setting {min/max}_perf_pct or are we changing horses and talking
about using the driver in "normal' mode?

-- 
You are receiving this mail because:
You are the assignee for the bug.
