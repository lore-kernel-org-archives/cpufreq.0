From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 75121] Intel Pstate driver - powersave mode - CPU frequency too
 low
Date: Fri, 02 May 2014 23:42:23 +0000
Message-ID: <bug-75121-12968-E3POZEH6v0@https.bugzilla.kernel.org/>
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

--- Comment #6 from Doug Smythies <dsmythies@telus.net> ---
Created attachment 134771
  --> https://bugzilla.kernel.org/attachment.cgi?id=134771&action=edit
output from perf script as requested

I had troubles with phoronix stuff also when I tried to run it under "perf
record". It seemed to think it needed to re-install and then I couldn't find
where the test profile was, so that I could change it to 1 run instead of the
default 3 (I typically run it 10 times, and always abort the first run because
it has an inconsistent run time due to the extra time needed to load the file,
which thereafter is cached).

In the end I ran this:

sudo /home/doug/bin/perf record -a -c 1 -e power:pstate_sample
phoronix-test-suite benchmark pts/ffmpeg

The output from "pref script" has been truncated to just one of the 3 tests.

Myself, I find it much easier to interpret pref data captured for the "consume"
program that was used to make the other graphs. I'll attach some of that data
also.

-- 
You are receiving this mail because:
You are the assignee for the bug.
