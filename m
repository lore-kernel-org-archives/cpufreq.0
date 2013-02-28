From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54541] Cpu frequency don't work in conky with kernel
 3.9.0.0.rc0.git8
Date: Thu, 28 Feb 2013 01:24:33 +0000 (UTC)
Message-ID: <20130228012433.F19CF11F8A6@bugzilla.kernel.org>
References: <bug-54541-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-54541-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54541


Aaron Lu <aaron.lu@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aaron.lu@intel.com
         AssignedTo|cpufreq@vger.kernel.org     |aaron.lu@intel.com




--- Comment #2 from Aaron Lu <aaron.lu@intel.com>  2013-02-28 01:24:33 ---
Hi chepioq,

Thanks for reporting the problem.
Can you please try Linus' git tree? And do a git bisect from tag v3.8 to the
current head to see which commit introduced this bug? Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
