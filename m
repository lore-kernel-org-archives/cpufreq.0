From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 66751] [BISECTED]Does not resume from suspend (bisected)
Date: Tue, 10 Dec 2013 06:55:44 +0000
Message-ID: <bug-66751-12968-GKUugU33Sp@https.bugzilla.kernel.org/>
References: <bug-66751-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-66751-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=66751

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |tianyu.lan@intel.com
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #4 from Lan Tianyu <tianyu.lan@intel.com> ---
Both Commit 2167e2399dc5 and 5a87182aa21d have been reverted in the linux-pm
tree. bleeding-edge branch. So close this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.
