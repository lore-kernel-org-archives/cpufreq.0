From: Kees Cook <kees.cook@canonical.com>
Subject: [PATCH] cpufreq: remove redundant sprintf
Date: Wed, 4 May 2011 08:38:56 -0700
Message-ID: <20110504153856.GA30309@outflux.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

Since format string handling is part of request_module, there is no
need to construct the module name. As such, drop the redundant sprintf
and heap usage.

Signed-off-by: Kees Cook <kees.cook@canonical.com>
---
 drivers/cpufreq/cpufreq.c |   19 ++++++-------------
 1 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 2dafc5c..95eb6cc 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -411,21 +411,14 @@ static int cpufreq_parse_governor(char *str_governor, unsigned int *policy,
 		t = __find_governor(str_governor);
 
 		if (t == NULL) {
-			char *name = kasprintf(GFP_KERNEL, "cpufreq_%s",
-								str_governor);
+			int ret;
 
-			if (name) {
-				int ret;
+			mutex_unlock(&cpufreq_governor_mutex);
+			ret = request_module("cpufreq_%s", str_governor);
+			mutex_lock(&cpufreq_governor_mutex);
 
-				mutex_unlock(&cpufreq_governor_mutex);
-				ret = request_module("%s", name);
-				mutex_lock(&cpufreq_governor_mutex);
-
-				if (ret == 0)
-					t = __find_governor(str_governor);
-			}
-
-			kfree(name);
+			if (ret == 0)
+				t = __find_governor(str_governor);
 		}
 
 		if (t != NULL) {
-- 
1.7.4.1

-- 
Kees Cook
Ubuntu Security Team
