From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Thu, 12 Jun 2014 19:27:47 +0000
Message-ID: <bug-77201-12968-IwtuIjFjLD@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #67 from Rafael J. Wysocki <rjw@rjwysocki.net> ---
For completeness, the commit immediately preceding the one chosen by Srivatsa
is

fada94ee64e6 workqueue: add args to workqueue lockdep name

so Mauro, please check if fada94ee64e6 works and then if 5bdfff96c69a fails.

-- 
You are receiving this mail because:
You are the assignee for the bug.
