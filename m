From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked
Date: Thu, 19 Dec 2013 11:56:07 +0000
Message-ID: <bug-65671-12968-ZnpeEPfifz@https.bugzilla.kernel.org/>
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

--- Comment #10 from higuita <higuita@gmx.net> ---
i've been using the ondemand governor and not problem at all. So it's really
something that is broken in the conservative governor... maybe not all changes
in the ondemand weren't applied to the conservative one?

-- 
You are receiving this mail because:
You are the assignee for the bug.
