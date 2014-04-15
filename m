From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 64271] Intel Pstate driver - "kick" code is not needed
Date: Tue, 15 Apr 2014 06:30:48 +0000
Message-ID: <bug-64271-12968-gN6XFke4Gi@https.bugzilla.kernel.org/>
References: <bug-64271-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-64271-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=64271

Aaron Lu <aaron.lu@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |aaron.lu@intel.com
         Resolution|---                         |CODE_FIX

--- Comment #6 from Aaron Lu <aaron.lu@intel.com> ---
commit 91a4cd4f3d8169d7398f9123683f64575927c682
Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
Date:   Tue Dec 17 09:42:07 2013 -0800

    intel_pstate: Remove periodic P state boost

entered Linus' tree as v3.14 material.

-- 
You are receiving this mail because:
You are the assignee for the bug.
