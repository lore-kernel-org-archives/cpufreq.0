From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Tue, 10 Sep 2013 14:19:33 +0000
Message-ID: <bug-60839-12968-fE5mxvINZ4@https.bugzilla.kernel.org/>
References: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60839-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60839

--- Comment #5 from Lan Tianyu <tianyu.lan@intel.com> ---
Ok. I was confused and please try the following patch.

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 5c75e31..de9e6e4 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -449,7 +449,7 @@ static ssize_t store_##file_name                           
        \
                return -EINVAL;                                         \
                                                                        \
        ret = __cpufreq_set_policy(policy, &new_policy);                \
-       policy->user_policy.object = policy->object;                    \
+       policy->user_policy.object = new_policy.object;                 \
                                                                        \
        return ret ? ret : count;                                       \
 }

-- 
You are receiving this mail because:
You are the assignee for the bug.
