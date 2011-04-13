From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 33202] cpufreq-info 008 only reports maximum "current
 frequency", contradicts cpufreq stats and /proc/cpuinfo
Date: Wed, 13 Apr 2011 12:57:42 GMT
Message-ID: <201104131257.p3DCvg4Z017303@demeter2.kernel.org>
References: <bug-33202-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-33202-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=33202





--- Comment #2 from LK <leho@kraav.com>  2011-04-13 12:57:41 ---
did watch -n 0.1 cat ...

/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq - does not change
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq - changes frequencies as
expected

am i simply misunderstanding something here?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
