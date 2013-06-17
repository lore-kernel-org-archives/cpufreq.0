From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] intel_pstate synchronizes frequencies on wake from
 suspend
Date: Mon, 17 Jun 2013 11:42:46 +0000 (UTC)
Message-ID: <20130617114246.B620811FB35@bugzilla.kernel.org>
References: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59781





--- Comment #4 from pqwoerituytrueiwoq@gmail.com  2013-06-17 11:42:46 ---
This is the script I used to get the attached charts
http://pastebin.com/PYj4wwCj
it uses /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq to get the
current cpu frequency

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
