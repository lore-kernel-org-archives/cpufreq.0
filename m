From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77771] Intel P-State: Constantly changing CPU frequencies on
 idle system.
Date: Fri, 13 Jun 2014 08:18:29 +0000
Message-ID: <bug-77771-12968-KdqetOFPHG@https.bugzilla.kernel.org/>
References: <bug-77771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77771

Yuyang Du <yuyang.du@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yuyang.du@intel.com

--- Comment #2 from Yuyang Du <yuyang.du@intel.com> ---
(In reply to Michael Long from comment #0)
> With the introduction of the kernel patch 3.14.7 and around the release of
> 3.15-rc8 the idle CPU frequency of each core in an idle system is changing
> erratically.
> 

This behavior is expected, see:

http://marc.info/?l=linux-pm&m=140141648726863&w=2

Nothing to say more.

Thanks,
Yuyang

-- 
You are receiving this mail because:
You are the assignee for the bug.
