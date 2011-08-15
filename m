From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Mon, 15 Aug 2011 15:08:34 GMT
Message-ID: <201108151508.p7FF8YLk025977@demeter2.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #56 from Thomas Renninger <trenn@suse.de>  2011-08-15 15:08:25 ---
You can verify whether turboboost is enabled/disabled by:
- utilizing one core:
  cat /dev/zero >/dev/null &
- run turbostat or "cpupower monitor -m Mperf"
  and double check average frequency of the utilized core whether it got
boosted

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
