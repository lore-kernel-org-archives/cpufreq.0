From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked
Date: Thu, 05 Dec 2013 23:37:07 +0000
Message-ID: <bug-65671-12968-QI7WohY5jG@https.bugzilla.kernel.org/>
References: <bug-65671-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65671-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65671

--- Comment #8 from higuita <higuita@gmx.net> ---
BINGO!

ok, just recompile 3.12.3 without CONFIG_CPU_FREQ i can hibernate without any
problem, even under heavy load for several hibernate-resume cycles. 

Even re-enable the AGP fast write and the VLINK 8X the hibernation works fine

Using the same kernel, WITH the cpufreq enable it fails to resume usually on
the first try under heavy load.

-- 
You are receiving this mail because:
You are the assignee for the bug.
