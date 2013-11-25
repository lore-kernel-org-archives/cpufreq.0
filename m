From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Mon, 25 Nov 2013 03:09:26 +0000
Message-ID: <bug-65301-12968-Mpl83WYEgx@https.bugzilla.kernel.org/>
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

--- Comment #3 from Mykal Valentine <zoku88@gmail.com> ---
I'm not really sure. I know it definitely didn't work normally in 3.11 or that
version of 3.10rc that I pulled that had the i915 bug fix either.

I think versions before that commit would run into the i915 bug, though. which
I think also causes the frequency for the cores to stay high after resume.

-- 
You are receiving this mail because:
You are the assignee for the bug.
