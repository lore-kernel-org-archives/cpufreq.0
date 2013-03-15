From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 55261] down_threshold is missing
Date: Fri, 15 Mar 2013 08:58:02 +0000 (UTC)
Message-ID: <20130315085802.8A9EE11F877@bugzilla.kernel.org>
References: <bug-55261-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-55261-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55261


Viresh Kumar <viresh.kumar@linaro.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |viresh.kumar@linaro.org




--- Comment #1 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-15 08:58:02 ---

This happened a long time back for ondemand governor (it is still supported by
conservative though).

commit c29f1403098135bdef75b190a5037db514701031
Author: Dave Jones <davej@redhat.com>
Date:   Tue May 31 19:03:50 2005 -0700

    [CPUFREQ] ondemand governor automatic downscaling

    [PATCH] [4/5] ondemand governor automatic downscaling

    Here is a change of policy for the ondemand governor. The modification
    concerns the frequency downscaling. Instead of decreasing to a lower
    frequency when the CPU usage is under 20%, this new policy automatically
    scales to the optimal frequency. The optimal frequency being the lowest
    frequency which provides enough power to not trigger the upscaling policy.

    Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
    Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
    Signed-off-by: Dave Jones <davej@redhat.com>

---
 drivers/cpufreq/cpufreq_ondemand.c | 117
+++++++++++++++++++++++------------------------------------------------------------------------------------
 1 file changed, 25 insertions(+), 92 deletions(-)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
