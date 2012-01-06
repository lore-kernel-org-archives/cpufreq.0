From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: [PATCH 4/6] cpufreq: Preserve sysfs min/max request
Date: Fri,  6 Jan 2012 12:03:52 +0200
Message-ID: <1325844234-478-5-git-send-email-amiettinen@nvidia.com>
References: <1325844234-478-1-git-send-email-amiettinen@nvidia.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1325844234-478-1-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@vger.kernel.org

Store the value received via sysfs as the user_policy
min/max value instead of the currently enforced min/max.
This allows restoring the user min/max values when
constraints on enforced min/max change.

Signed-off-by: Antti P Miettinen <amiettinen@nvidia.com>
---
 drivers/cpufreq/cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index e63b29f..65a512b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -389,7 +389,7 @@ static ssize_t store_##file_name					\
 		return -EINVAL;						\
 									\
 	ret = __cpufreq_set_policy(policy, &new_policy);		\
-	policy->user_policy.object = policy->object;			\
+	policy->user_policy.object = new_policy.object;			\
 									\
 	return ret ? ret : count;					\
 }
-- 
1.7.4.1

