From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 86461] intel_pstate does not obey min/max frequencies set by
 user
Date: Fri, 17 Oct 2014 15:17:28 +0000
Message-ID: <bug-86461-12968-TFDFyBDAQv@https.bugzilla.kernel.org/>
References: <bug-86461-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-86461-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86461

Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com

--- Comment #1 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
Can you send the output of the following commands before and after setting
scaling_min_freq:

   turbostat sleep 5
   grep MH /proc/cpuinfo
   grep .  /sys/devices/system/cpu/intel_pstate/*

-- 
You are receiving this mail because:
You are the assignee for the bug.
