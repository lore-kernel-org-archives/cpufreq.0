From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Sun, 15 Jun 2014 10:31:36 +0000
Message-ID: <bug-77201-12968-IwOr17uFTd@https.bugzilla.kernel.org/>
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

--- Comment #83 from Mauro <registosites@hotmail.com> ---
Created attachment 139791
  --> https://bugzilla.kernel.org/attachment.cgi?id=139791&action=edit
stop_transition before cpufreq_notify_transition()

All is good, machine doesn't hang.

-- 
You are receiving this mail because:
You are the assignee for the bug.
