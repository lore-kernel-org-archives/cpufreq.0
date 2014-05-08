From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Thu, 08 May 2014 22:19:24 +0000
Message-ID: <bug-75121-12968-5W2ym10QPm@https.bugzilla.kernel.org/>
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

--- Comment #18 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 135491
  --> https://bugzilla.kernel.org/attachment.cgi?id=135491&action=edit
CPU 7 frequency vs load. Turbo on. Dirk patch applied

Reference: https://lkml.org/lkml/2014/5/8/574

For the Phoronix ffmpeg test I get the exact same numbers as Dirk (we have the
same CPU) so am not posting a new graph.

For CPU 7 freq. Vs. load, this is a new graph with Dirk's patches applied (I
have removed some previous test data to reduce clutter).

I'll post a new CPU 7 frequency vs load / idle frequency in a moment.

-- 
You are receiving this mail because:
You are the assignee for the bug.
