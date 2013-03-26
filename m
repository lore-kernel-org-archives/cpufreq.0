From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55091] cpufreq governors woks crazy
Date: Tue, 26 Mar 2013 16:39:46 +0000 (UTC)
Message-ID: <20130326163946.98BB511F8D3@bugzilla.kernel.org>
References: <bug-55091-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55091-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55091





--- Comment #3 from towo@siduction.org  2013-03-26 16:39:46 ---
Sorry for the long delay, but it seems all is good.
If i check the frewuency with

watch -n 0,5 cpufreq-info

all is good, only conky is showing those fancy freqency changes.
So i would resume, it's conky's fault.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
