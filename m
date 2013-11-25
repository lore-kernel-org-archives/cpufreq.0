From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Mon, 25 Nov 2013 09:08:34 +0000
Message-ID: <bug-65301-12968-ZyktzxCp9L@https.bugzilla.kernel.org/>
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

--- Comment #5 from Mykal Valentine <zoku88@gmail.com> ---
Just tried, it doesn't seem like I'm able to boot with 3.8 or 3.9 rc kernels...
Not really sure why?  The screen turns black at some point during boot
sequence, some point after fsck.

Maybe those kernels miss some commits needed for haswell IGPs or something...

-- 
You are receiving this mail because:
You are the assignee for the bug.
