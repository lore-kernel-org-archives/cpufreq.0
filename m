From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] Only the lowest CPU frequency available on laptop
 working from battery.
Date: Sat, 18 Dec 2010 08:28:30 GMT
Message-ID: <201012180828.oBI8SUKT023426@demeter2.kernel.org>
References: <bug-23412-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-23412-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23412





--- Comment #6 from Vladimir <v_2e@ukr.net>  2010-12-18 08:28:20 ---
(In reply to comment #5)
> Above helps (and this is hopefully what the bug is about) only if you see the
> limit here:
> /sys/devices/system/cpu/cpu0/cpufreq/bios_limit
> 
  Yes, this is my case. I also mentioned this file in my bugreport on Gentoo
Bugzilla (the link to that bugreport is in the first message of this thread). I
do not remember the older kernels (before 2.6.30) to provide this file. And
like I said before, this file does store the lowest possible CPU frequency with
AC adapter off.
  I have found a BIOS feature "Andvanced power management", but triggering it
has no effect. I don't really know what is this feature for. So, there is no
way to change this behaviour tweaking the BIOS settings.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
