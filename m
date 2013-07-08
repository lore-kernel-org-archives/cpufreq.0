From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] intel_pstate synchronizes frequencies on wake from
 suspend
Date: Mon, 08 Jul 2013 02:50:05 +0000
Message-ID: <bug-59781-12968-juOMGlU4yo@https.bugzilla.kernel.org/>
References: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59781

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|cpufreq@vger.kernel.org     |tianyu.lan@intel.com

--- Comment #11 from Lan Tianyu <tianyu.lan@intel.com> ---
Hi:
    Sorry for later response. Please try the following patch. I guess this will
fix your issue. I found this issue also on one of my machine.
---

 drivers/cpufreq/cpufreq_stats.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index fb65dec..591b6fb 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -349,6 +349,7 @@ static int __cpuinit cpufreq_stat_cpu_callback(struct
notifier_block *nfb,

        switch (action) {
        case CPU_ONLINE:
+       case CPU_ONLINE_FROZEN:
                cpufreq_update_policy(cpu);
                break;
        case CPU_DOWN_PREPARE:

-- 
You are receiving this mail because:
You are the assignee for the bug.
