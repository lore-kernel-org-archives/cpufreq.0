From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Wed, 06 Nov 2013 05:34:38 +0000
Message-ID: <bug-64261-12968-Kvwao2DsOh@https.bugzilla.kernel.org/>
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

--- Comment #11 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 113581
  --> https://bugzilla.kernel.org/attachment.cgi?id=113581&action=edit
CPU 7 frequency Vs. requested percent with rounding. Turbo off.

I added generic rounding to intel_pstate.c on the kernel 3.12 build for my test
computer.

This attachment is similar to previous attachments, but with a new line added
using the new code. Turbo off. The two occurrences of the span of 4 percent
samples without a frequency step are still there, just moved. I'll look into
that sometime.

-- 
You are receiving this mail because:
You are the assignee for the bug.
