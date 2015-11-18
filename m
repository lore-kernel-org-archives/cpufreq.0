From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 101241] cpufreq ondemand not work in my system
Date: Wed, 18 Nov 2015 12:33:10 +0000
Message-ID: <bug-101241-12968-41mftnKJOq@https.bugzilla.kernel.org/>
References: <bug-101241-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-101241-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=101241

Chen Yu <yu.c.chen@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yu.c.chen@intel.com

--- Comment #1 from Chen Yu <yu.c.chen@intel.com> ---
are you using acpi-cpufreq driver?

plz provide following log with latest  4.4-rc1 if possible

skywalker@sky-lake:/$ grep . /sys/devices/system/cpu/cpu0/cpufreq/*

thank you

Yu

-- 
You are receiving this mail because:
You are the assignee for the bug.
