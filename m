From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54221] ondemand cpufeq governor do not notice Node Manager
 power limit change
Date: Mon, 15 Jul 2013 05:18:19 +0000
Message-ID: <bug-54221-12968-xDwjAiQG63@https.bugzilla.kernel.org/>
References: <bug-54221-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-54221-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54221

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tianyu.lan@intel.com
           Assignee|cpufreq@vger.kernel.org     |tianyu.lan@intel.com

--- Comment #6 from Lan Tianyu <tianyu.lan@intel.com> ---
Hi,
    Please provide the output of "grep . /sys/bus/cpu/devices/cpu*/cpufreq/*"
after the issue takes place.

-- 
You are receiving this mail because:
You are the assignee for the bug.
