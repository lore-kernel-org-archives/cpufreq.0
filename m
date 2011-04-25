From: Roman Vasiyarov <rvasiyarov@gmail.com>
Subject: [PATCH] cpufrequtils sysfs: increase MAX_LINE_LEN
Date: Mon, 25 Apr 2011 21:34:23 +0400
Message-ID: <1303752863-14588-1-git-send-email-rvasiyarov@gmail.com>
References: <20110425081115.GA27025@isilmar-3.linta.de>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=Le1/baSyYdcxOrY0kPD0i0eeQ1p0FBwDhFN9HjNs/S0=;
        b=drtej2dFxswmRi5qmnFw+bLKP9lgtYn5QqjHZxBjMhQBOmRFr+UE4+lbr4ExXozzle
         yHIeNngOIEcfh5OwdUvYxESDDgCBYSPp8C1W63dh+n/r8QjeD9q51pQXpcXe4M+O1JZZ
         H8RMS2z4zjr82yndbG7KYaH3ZBEqKWkLUOiXw=
In-Reply-To: <20110425081115.GA27025@isilmar-3.linta.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Roman Vasiyarov <rvasiyarov@gmail.com>

larger sysfs data (>255 bytes) was truncated and thus used improperly

Signed-off-by: Roman Vasiyarov <rvasiyarov@gmail.com>
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

