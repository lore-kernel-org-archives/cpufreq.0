From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Sun, 23 Dec 2012 14:47:58 +0000 (UTC)
Message-ID: <20121223144758.221E611FA61@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #9 from rocko <rockorequin@hotmail.com>  2012-12-23 14:47:57 ---
I've just encountered this again in kernel 3.7.1.

turbostat indicates the cores are running over their max 2.0GHz frequency (it
says core 1 in particular is running at up to 2.4GHz).

Is there anything I can try that might help to debug this?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
