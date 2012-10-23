From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 49231] Single CPU bound process results in non-optimal turbo
 boost configuration
Date: Tue, 23 Oct 2012 02:09:34 +0000 (UTC)
Message-ID: <20121023020934.6930911FA69@bugzilla.kernel.org>
References: <bug-49231-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-49231-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=49231


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lenb@kernel.org




--- Comment #4 from Len Brown <lenb@kernel.org>  2012-10-23 02:09:34 ---
Even the "idle" case doesn't look right -- it is 2.73% busy.
try using top and find out what is running.

core CPU   %c0   GHz  TSC   %c1    %c3    %c6    %c7   %pc2   %pc3   %pc6
           2.73 1.20 3.20   7.06   0.00   0.02  90.19  20.20   0.00  68.20

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
