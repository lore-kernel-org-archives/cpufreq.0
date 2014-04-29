From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Tue, 29 Apr 2014 23:54:04 +0000
Message-ID: <bug-75121-12968-DFZHePo1f9@https.bugzilla.kernel.org/>
References: <bug-75121-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-75121-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75121

--- Comment #1 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134311
  --> https://bugzilla.kernel.org/attachment.cgi?id=134311&action=edit
The phoronix ffmpeg test is an easy way to show the issue

Various kernels, showing the increase in test execution time as of and since
the commit referenced herein.

For reference some apci-cpufreq modes are included as is an intel_pstate
performance mode run.

-- 
You are receiving this mail because:
You are the assignee for the bug.
