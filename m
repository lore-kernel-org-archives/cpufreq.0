From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Tue, 26 Nov 2013 01:20:00 +0000
Message-ID: <bug-65301-12968-m9cyL6xZXH@https.bugzilla.kernel.org/>
References: <bug-65301-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65301-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65301

--- Comment #8 from Mykal Valentine <zoku88@gmail.com> ---
Marcin: I'm not sure if that's the exact same problem, given that resuming from
suspend to RAM was what I was filing the bug on, which seems to function as a
workaround for another issue that you're seeing.

Unfortunately, I wasn't very clear with the original bug report to state that. 
Incidentally, I haven't tested resume from hibernate.

Also, since there was a bug in i915 for SNB, you should make sure that you're
not hitting that bug.  I wasn't sure what version that bug fix got in (either
3.11 or 3.12), but I would recommend trying 3.12 on your system to see if the
problem persists, just in case 3.11 didn't have the fix.  Or checking
out/compiling commit 7dcd2677ea912573d9ed4bcd629b0023b2d11505 to see if that
fixes your problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.
