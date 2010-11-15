From: Joe Perches <joe@perches.com>
Subject: [PATCH 04/44] drivers/cpufreq: Remove unnecessary semicolons
Date: Sun, 14 Nov 2010 19:04:23 -0800
Message-ID: <a4bef9c18ce34e80870a07c728ee25e8efac6d9d.1289789604.git.joe@perches.com>
References: <cover.1289789604.git.joe@perches.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <cover.1289789604.git.joe@perches.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/cpufreq/cpufreq_conservative.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 526bfbf..b0d8f3d 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -118,7 +118,7 @@ static inline cputime64_t get_cpu_idle_time_jiffy(unsigned int cpu,
 	if (wall)
 		*wall = (cputime64_t)jiffies_to_usecs(cur_wall_time);
 
-	return (cputime64_t)jiffies_to_usecs(idle_time);;
+	return (cputime64_t)jiffies_to_usecs(idle_time);
 }
 
 static inline cputime64_t get_cpu_idle_time(unsigned int cpu, cputime64_t *wall)
-- 
1.7.3.1.g432b3.dirty

