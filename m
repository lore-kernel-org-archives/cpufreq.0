From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 63081] ignore_nice_load changes from one to zero after
 suspend2ram
Date: Fri, 15 Nov 2013 06:14:17 +0000
Message-ID: <bug-63081-12968-6wJRS6QoaE@https.bugzilla.kernel.org/>
References: <bug-63081-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-63081-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=63081

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|cpufreq@vger.kernel.org     |tianyu.lan@intel.com

--- Comment #12 from Lan Tianyu <tianyu.lan@intel.com> ---
Hi, please try this patch.

http://www.spinics.net/lists/kernel/msg1636080.html

-- 
You are receiving this mail because:
You are the assignee for the bug.
