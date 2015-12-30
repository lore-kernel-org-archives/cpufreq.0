From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 71841] cpufreq ondemand ignore_nice_load doesn't work
Date: Wed, 30 Dec 2015 17:49:17 +0000
Message-ID: <bug-71841-12968-q1yLe5u4Oz@https.bugzilla.kernel.org/>
References: <bug-71841-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-71841-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71841

--- Comment #5 from higuita <higuita@gmx.net> ---
hi

i'm now using a different cpu, a AMD A10-7850K Radeon R7, 12 Compute Cores
4C+8G
that uses acpi-cpufreq...

testing in this with this cpu and a kernel 4.3.3 it works fine.

maybe this was fixed of just happen in certain HW configs?

-- 
You are receiving this mail because:
You are the assignee for the bug.
