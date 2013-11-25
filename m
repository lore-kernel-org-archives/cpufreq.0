From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 65611] wrong file mode of
 /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
Date: Mon, 25 Nov 2013 03:03:09 +0000
Message-ID: <bug-65611-12968-2iDGqq4EQm@https.bugzilla.kernel.org/>
References: <bug-65611-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-65611-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=65611

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |tianyu.lan@intel.com
           Assignee|cpufreq@vger.kernel.org     |tianyu.lan@intel.com

--- Comment #1 from Lan Tianyu <tianyu.lan@intel.com> ---
This also doesn't make sense to me. I will send a patch to change it and see
other guys' comment.

-- 
You are receiving this mail because:
You are the assignee for the bug.
