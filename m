From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked
Date: Fri, 27 Dec 2013 11:42:24 +0000
Message-ID: <bug-65671-12968-60jqJccMZN@https.bugzilla.kernel.org/>
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

--- Comment #11 from higuita <higuita@gmx.net> ---
This problem can be much older than kernel 3.12...  i've been having sporadic
problems with random corrupted filesystems since maybe about june. During all
summer i assumed it was a bad HD (that started to report bad sectors and is
mostly unused, it's actually umounted and suspended on boot) was introducing
problems in other SATA channels and corrupting other HD partitions.

Since i switch to the performance governor, i had no FS corruption, so looks
like the (unused) HD was not the problem, but again some bug in the ondemand
governor. If true, this could be a lot older and recent changes made it much
more frequent and reproducible. 

Sadly, the old FS corruption was hard to trigger, so it's not easy to point
when it started to show up

-- 
You are receiving this mail because:
You are the assignee for the bug.
