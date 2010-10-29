From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 29 Oct 2010 13:00:27 GMT
Message-ID: <201010291300.o9TD0Rw1025289@demeter1.kernel.org>
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





--- Comment #31 from Thomas Renninger <trenn@suse.de>  2010-10-29 13:00:19 ---
I also wonder whether if you bind a 100% CPU utilizing task to CPU0:
numactl --physcpubind=0 cat /dev/zero >/dev/null
whether top (and then hit "1" to see each CPU's utilization) really shows you
100% (sy + us) running and 0% idle time?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
