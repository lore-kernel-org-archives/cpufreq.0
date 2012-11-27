From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/8] cpupower tools: Fix minor warnings
Date: Tue, 27 Nov 2012 13:17:44 +0100
Message-ID: <1354018669-63680-4-git-send-email-trenn@suse.de>
References: <1354018669-63680-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1354018669-63680-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: Palmer Cox <p@lmercox.com>, cpufreq@vger.kernel.org, Thomas Renninger <trenn@suse.de>

From: Palmer Cox <p@lmercox.com>

Fix minor warnings reported with GCC 4.6:
* The sysfs_write_file function is unused - remove it.
* The pr_mon_len in the print_header function is unsed - remove it.

Signed-off-by: Palmer Cox <p@lmercox.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/utils/helpers/sysfs.c         |   19 -------------------
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |    3 +--
 2 files changed, 1 insertions(+), 21 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/sysfs.c b/tools/power/cpupower/utils/helpers/sysfs.c
index 96e28c1..38ab916 100644
--- a/tools/power/cpupower/utils/helpers/sysfs.c
+++ b/tools/power/cpupower/utils/helpers/sysfs.c
@@ -37,25 +37,6 @@ unsigned int sysfs_read_file(const char *path, char *buf, size_t buflen)
 	return (unsigned int) numread;
 }
 
-static unsigned int sysfs_write_file(const char *path,
-				     const char *value, size_t len)
-{
-	int fd;
-	ssize_t numwrite;
-
-	fd = open(path, O_WRONLY);
-	if (fd == -1)
-		return 0;
-
-	numwrite = write(fd, value, len);
-	if (numwrite < 1) {
-		close(fd);
-		return 0;
-	}
-	close(fd);
-	return (unsigned int) numwrite;
-}
-
 /*
  * Detect whether a CPU is online
  *
diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
index 0d6571e..7a657f3 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
@@ -84,7 +84,7 @@ int fill_string_with_spaces(char *s, int n)
 void print_header(int topology_depth)
 {
 	int unsigned mon;
-	int state, need_len, pr_mon_len;
+	int state, need_len;
 	cstate_t s;
 	char buf[128] = "";
 	int percent_width = 4;
@@ -93,7 +93,6 @@ void print_header(int topology_depth)
 	printf("%s|", buf);
 
 	for (mon = 0; mon < avail_monitors; mon++) {
-		pr_mon_len = 0;
 		need_len = monitors[mon]->hw_states_num * (percent_width + 3)
 			- 1;
 		if (mon != 0) {
-- 
1.7.6.1

