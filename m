From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Wed, 06 Nov 2013 05:48:00 +0000
Message-ID: <bug-64261-12968-UzBklIE3FS@https.bugzilla.kernel.org/>
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

--- Comment #14 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 113611
  --> https://bugzilla.kernel.org/attachment.cgi?id=113611&action=edit
CPU 7 frequency vs load. Turbo on. With and without rounding. 2

The load on cpu 7 varies from 0.005 to 0.995 in steps of 0.005 at 10 seconds
per step. The frequency is monitored at 10 Hertz.

Turbo on test 2 of 2. The significant different for the un-rounded data at the
higher frequencies is not understood. I'll look into it.

Note that gains and setpoints have not been altered, yet.

-- 
You are receiving this mail because:
You are the assignee for the bug.
