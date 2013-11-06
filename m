From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64261] Intel Pstate driver truncates to pstate instead of
 rounding to nearest pstate
Date: Wed, 06 Nov 2013 05:43:55 +0000
Message-ID: <bug-64261-12968-oXXKTwr7xg@https.bugzilla.kernel.org/>
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

--- Comment #13 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 113601
  --> https://bugzilla.kernel.org/attachment.cgi?id=113601&action=edit
CPU 7 frequency vs load. Turbo on. With and without rounding.

The load on cpu 7 varies from 0.005 to 0.995 in steps of 0.005 at 10 seconds
per step. The frequency is monitored at 10 Hertz.

Test 1 of 2. A subsequent test where the load was held at 0.83 and the
load/sleep frequency was varied from 50 hertz to 300 hertz (graph not posted
herein, as it was uneventful between rounding and no rounding), showed much
less frequency jitter for the un-rounded case. Therefore it was decided to
repeat this test.

-- 
You are receiving this mail because:
You are the assignee for the bug.
