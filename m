From: Roman Vasiyarov <rvasiyarov@gmail.com>
Subject: [PATCH] cpufrequtils sysfs: increase MAX_LINE_LEN
Date: Sat, 23 Apr 2011 21:33:09 +0400
Message-ID: <1303579989-17454-1-git-send-email-rvasiyarov@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
        bh=DyJ4+BDSn4tlu1RFpXSdbhCh0H0wTpAoUyNIHjQ2Vpk=;
        b=Mo5Lv7XcteHfUJxJg4vptsTESCIAC7TnKQxtxghUPpgWjNGUqqEiNZo+C0AzTQISXF
         WAnS4GNz7KNATLmHZXH/SpX9Z947gw3T7uNv35EtRysxD6XlGHx6SjhVWsDVGXA7YusM
         wT/KaASE04Ob8dVSE47wbsEfTObqmAia9B3T0=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Roman Vasiyarov <rvasiyarov@gmail.com>

larger sysfs data (>255 bytes) was truncated and thus used improperly
---
 lib/sysfs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/sysfs.c b/lib/sysfs.c
index 4e0edab..24dd563 100644
--- a/lib/sysfs.c
+++ b/lib/sysfs.c
@@ -18,7 +18,7 @@
 #include "cpufreq.h"
 
 #define PATH_TO_CPU "/sys/devices/system/cpu/"
-#define MAX_LINE_LEN 255
+#define MAX_LINE_LEN 4096
 #define SYSFS_PATH_MAX 255
 
 /* helper function to read file from /sys into given buffer */
-- 
1.7.4.4

