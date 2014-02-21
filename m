From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 70941] 'powersave' performance excessively slow on Dell Venue 8
 Pro (Baytrail tablet)
Date: Fri, 21 Feb 2014 15:04:01 +0000
Message-ID: <bug-70941-12968-d3Fv5IYLXs@https.bugzilla.kernel.org/>
References: <bug-70941-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-70941-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70941

Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com

--- Comment #1 from Dirk Brandewie <dirk.brandewie@gmail.com> ---


commit fcb6a15c2e7e76d493e6f91ea889ab40e1c643a4 is the problem.  I am working
on a fix ATM.

Lowering the setpoint for the PID should workaround the problem

echo 90 > /sys/kernel/debug/pstate_snb/setpoint

This will cost some power though.

This also broke GregKH
https://lkml.org/lkml/2014/2/19/626

-- 
You are receiving this mail because:
You are the assignee for the bug.
