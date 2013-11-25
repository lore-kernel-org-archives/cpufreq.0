From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65301] Cores stuck at max frequency after resume from suspend
 (Haswell)
Date: Mon, 25 Nov 2013 03:28:56 +0000
Message-ID: <bug-65301-12968-z8S8dUVE1L@https.bugzilla.kernel.org/>
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

--- Comment #4 from Lan Tianyu <tianyu.lan@intel.com> ---
This origin bug is introduced by commit 15239099 "drm/i915: enable irqs earlier
when resuming." which is merged v3.9-rc5. So the v3.8 or v3.9-rc1~rc4 maybe
safe to test.

-- 
You are receiving this mail because:
You are the assignee for the bug.
