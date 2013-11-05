From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Tue, 05 Nov 2013 15:06:54 +0000
Message-ID: <bug-64261-12968-xNEXvhZFKi@https.bugzilla.kernel.org/>
References: <bug-64261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64261

--- Comment #10 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 113491
  --> https://bugzilla.kernel.org/attachment.cgi?id=113491&action=edit
Test done with min=max percent and min left at 42 percent

This was the test I did so that I knew I could leave min percent at 42 percent
without an unknown side effect. (as long as CPU 7 was under full load, of
course)

-- 
You are receiving this mail because:
You are the assignee for the bug.
