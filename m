From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 69821] setting CONFIG_HZ_PERIODIC locks cpu at the lowest
 frequency using ONDEMAND
Date: Tue, 11 Feb 2014 10:01:18 +0000
Message-ID: <bug-69821-12968-3bTshnn9k4@https.bugzilla.kernel.org/>
References: <bug-69821-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-69821-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69821

--- Comment #2 from j.fikar@gmail.com ---
Well, I was trying the new CONFIG_NO_HZ_FULL and comparing it to the two old
CONFIG_NO_HZ_IDLE and CONFIG_HZ_PERIODIC. To my surprise the oldest (and I
thought most stable and most tested) CONFIG_HZ_PERIODIC causes problems with
CPU scaling.

On the other hand, I'm aware that CONFIG_NO_HZ_IDLE is the recommended default
and that there was a lot of recent development due to the new
CONFIG_NO_HZ_FULL. 

Anyway, I think it is a bug and not expected behaviour, right?

-- 
You are receiving this mail because:
You are the assignee for the bug.
