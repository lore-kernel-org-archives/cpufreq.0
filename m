From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after
 s2ram
Date: Mon, 18 Mar 2013 09:21:07 +0000 (UTC)
Message-ID: <20130318092107.9F12D11FB5D@bugzilla.kernel.org>
References: <bug-55411-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55411-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55411





--- Comment #1 from Duncan <1i5t5.duncan@cox.net>  2013-03-18 09:21:07 ---
Created an attachment (id=95691)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=95691)
dmesg after s2ram/resume cycle

Here's dmesg after s2ram/resume.  It was a fresh boot and then suspend/resume,
so full boot info is captured as well, then the s2ram/resume.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
