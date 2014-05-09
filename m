From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65671] hibernation - IO errors writing to swap, crashing apps,
 3,11.8 worked, unless rmmod powernow_k8
Date: Fri, 09 May 2014 01:59:46 +0000
Message-ID: <bug-65671-12968-auzglDIsp2@https.bugzilla.kernel.org/>
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

--- Comment #16 from higuita <higuita@gmx.net> ---
i compiled kernel 3.15-rc4, disabled my workarounds and tried to trigger the
hibernation problems with more than 15 hibernations cycles (under various
loads) and failed.

i also had tried something similar on kernel 4.14.1 and also didn't had any
problem.

So or the problem was fixed, or the hidden corruption change it target. I still
do have (maybe once a month) some random ext4 corruption, but even that have
improved.

maybe because the hibernations tests, after those tests i rebooted and got this
ext4 error a few minutes after, on the /home partition:

[  367.200228] EXT4-fs error (device sda8): ext4_mb_generate_buddy:756: group
513, 3097 clusters in bitmap, 3081 in gd; block bitmap corrupt.
[  367.218897] JBD2: Spotted dirty metadata buffer (dev = sda8, blocknr = 0).
There's a risk of filesystem corruption in case of system crash.
[  367.285925] JBD2: Spotted dirty metadata buffer (dev = sda8, blocknr = 0).
There's a risk of filesystem corruption in case of system crash.

I will try to grab the fsck output to check if it helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.
