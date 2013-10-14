From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 62851] Sometimes cpu frequency is stuck at low levels on Dell
 Lattitude E6320 (Sandybridge i7-2640M)
Date: Mon, 14 Oct 2013 03:18:39 +0000
Message-ID: <bug-62851-12968-0UYWj7Adu8@https.bugzilla.kernel.org/>
References: <bug-62851-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-62851-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=62851

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |tianyu.lan@intel.com
           Assignee|cpufreq@vger.kernel.org     |tianyu.lan@intel.com

--- Comment #2 from Lan Tianyu <tianyu.lan@intel.com> ---
Could you try to disable speedstep in the Bios?

From bug 59821, the reporter also meet the same issue and fix by the previous
change.
https://bugzilla.kernel.org/show_bug.cgi?id=59821

-- 
You are receiving this mail because:
You are the assignee for the bug.
