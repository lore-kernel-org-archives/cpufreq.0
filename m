From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: [PATCH v2 4/8] cpufreq: Preserve sysfs min/max request
Date: Fri, 13 Jan 2012 14:59:15 +0200
Message-ID: <1326459559-5436-5-git-send-email-amiettinen@nvidia.com>
References: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org
Cc: mgross@linux.intel.com

Store the value received via sysfs as the user_policy
min/max value instead of the currently enforced min/max.
This allows restoring the user min/max values when
constraints on enforced min/max change.

Signed-off-by: Antti P Miettinen <amiettinen@nvidia.com>
---
 drivers/cpufreq/cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index f115888..127e37a 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -388,7 +388,7 @@ static ssize_t store_##file_name					\
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

