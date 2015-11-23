From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 101241] cpufreq ondemand not work in my system
Date: Mon, 23 Nov 2015 10:30:23 +0000
Message-ID: <bug-101241-12968-fv3yZZSs7k@https.bugzilla.kernel.org/>
References: <bug-101241-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-101241-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=101241

--- Comment #2 from Chen Yu <yu.c.chen@intel.com> ---
sorry I misread your log, it is related to powernow-k8 driver.. I'm not
familiar with it..
How about the result after you
stress -c 4 ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
