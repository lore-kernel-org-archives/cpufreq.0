From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54221] ondemand cpufeq governor do not notice Node Manager
 power limit change
Date: Thu, 28 Feb 2013 01:39:06 +0000 (UTC)
Message-ID: <20130228013906.5A7FF11F8A6@bugzilla.kernel.org>
References: <bug-54221-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-54221-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54221


Aaron Lu <aaron.lu@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aaron.lu@intel.com




--- Comment #1 from Aaron Lu <aaron.lu@intel.com>  2013-02-28 01:39:06 ---
Hi Przemyslaw,

By node manager, do you mean this one https://01.org/nodemanager/about?

And does it ever work as expected on other kernel versions? If so, can you
please identify which kernel version starts to have problem and if you can do a
git bisect to find the offending commit, that would be great, thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
