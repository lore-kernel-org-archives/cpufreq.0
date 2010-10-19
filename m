From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 19 Oct 2010 03:51:43 GMT
Message-ID: <201010190351.o9J3phlo026041@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #22 from Thomas Renninger <trenn@suse.de>  2010-10-19 03:51:38 ---
Created an attachment (id=34102)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=34102)
Provide /sys/devices/system/cpu/cpu*/cpufreq/shared_type

This should be:
CPUFREQ_SHARED_TYPE_ALL  (2)
if you added the boot param provided in the previous patch
and
CPUFREQ_SHARED_TYPE_HW   (1)
by default.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
