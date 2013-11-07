From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64251] Intel Pstate driver minimum percent does not change with
 turbo off
Date: Thu, 07 Nov 2013 05:36:45 +0000
Message-ID: <bug-64251-12968-SaBHnqRaSt@https.bugzilla.kernel.org/>
References: <bug-64251-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64251-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64251

--- Comment #5 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 113721
  --> https://bugzilla.kernel.org/attachment.cgi?id=113721&action=edit
BIOS disabled Turbo mode CPU freq Vs. Requested.

This graph is in support of the previous comments.

The "rnd" and "nokick" in the legend are related to other bug reports, and can
be ignored in the context of this bug report. They are both with driver turbo
on, but BIOS turbo disabled.

"Toff" means driver turbo disabled, and multiple tests were done, each one with
a different frequency on CPU 7 at the time of driver transition from turbo
enabled to disabled, to demonstrate that the CPU frequency will lock and be
thereafter unchangeable.

-- 
You are receiving this mail because:
You are the assignee for the bug.
