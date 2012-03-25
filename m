From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 08/13] cpupower tool: remove use of undefined variables from the clean target of the top makefile
Date: Sun, 25 Mar 2012 20:38:49 +0200
Message-ID: <1332700734-26435-8-git-send-email-linux@dominikbrodowski.net>
References: <20120325183807.GA26398@comet.dominikbrodowski.net>
 <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Franck Bui-Huu <fbuihuu@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>

From: Franck Bui-Huu <fbuihuu@gmail.com>

UTIL_BINS and IDLE_OBJS variables are not defined at all, so
there's no need to remove their content from the 'clean' target.

Signed-off-by: Franck Bui-Huu <fbuihuu@gmail.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/Makefile |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index f01b3f5..eb7f448 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -228,8 +228,6 @@ compile-bench: libcpupower.so.$(LIB_MAJ)
 clean:
 	-find . \( -not -type d \) -and \( -name '*~' -o -name '*.[oas]' \) -type f -print \
 	 | xargs rm -f
-	-rm -f $(UTIL_BINS)
-	-rm -f $(IDLE_OBJS)
 	-rm -f cpupower
 	-rm -f libcpupower.so*
 	-rm -rf po/*.gmo po/*.pot
-- 
1.7.5.4

