From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Fri, 27 Aug 2010 12:21:18 GMT
Message-ID: <201008271221.o7RCLImf027906@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #6 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-08-27 12:21:12 ---
Created an attachment (id=28111)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=28111)
cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/*

Increasing the sampling_rate does not affect the issue at all.

Lowering up_treshold to 53 or below makes the ondemand governor work, even
short load spikes (like when starting firefox) makes the cpu frequency jump up
to 2GHz and then back down to 800MHz.
Any value greater than 53 does not change anything, even 54 has no effect at
all.
Same with increased and default sampling_rate. 

ignore_nice_load was already set to 0 by default.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
