From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] Problems with hibernation, with bisect
Date: Mon, 02 Dec 2013 02:11:53 +0000
Message-ID: <bug-65671-12968-i1BlvAkr5a@https.bugzilla.kernel.org/>
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

--- Comment #6 from higuita <higuita@gmx.net> ---
with modeset disable, it still crashes after hibernating (but only on the
second attempt to hibernate)

I also attempt to switch the mode from "platform" to "shutdown", but still
crashes

-- 
You are receiving this mail because:
You are the assignee for the bug.
