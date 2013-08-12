From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60727] The CPU frequency does not raise when compiling packages
 on Gentoo
Date: Mon, 12 Aug 2013 02:56:49 +0000
Message-ID: <bug-60727-12968-9erA8u0qGN@https.bugzilla.kernel.org/>
References: <bug-60727-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60727-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60727

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |tianyu.lan@intel.com
           Assignee|cpufreq@vger.kernel.org     |tianyu.lan@intel.com

--- Comment #1 from Lan Tianyu <tianyu.lan@intel.com> ---
Could you provide the output of running
"grep . /sys/bus/cpu/devices/cpu*/cpufreq/*" when the issue happen?

-- 
You are receiving this mail because:
You are the assignee for the bug.
