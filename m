From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Sun, 04 May 2014 19:18:50 +0000
Message-ID: <bug-75121-12968-g4c5tlnbXE@https.bugzilla.kernel.org/>
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

--- Comment #15 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 135151
  --> https://bugzilla.kernel.org/attachment.cgi?id=135151&action=edit
Just another method I tried. Phoronix ffmpeg test is as fast as performance
mode with this method.

Hi Dirk: Did you ever figure out for certain why some had the CPU freq remains
high after suspend issue? It remains unclear to me, and I do not know how to
even try to re-create here on my test computer.

References (some but not all):
https://bugzilla.kernel.org/show_bug.cgi?id=66581#c21
https://bugzilla.kernel.org/show_bug.cgi?id=66581#c26

-- 
You are receiving this mail because:
You are the assignee for the bug.
