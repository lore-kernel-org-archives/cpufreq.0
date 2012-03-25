From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 09/13] cpupower tool: makefile: simplify the recipe used to generate cpupower.pot target
Date: Sun, 25 Mar 2012 20:38:50 +0200
Message-ID: <1332700734-26435-9-git-send-email-linux@dominikbrodowski.net>
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

Use the '-p' and '-o' switches to specify the pathname of the output
file to xgettext(1). This avoids to move manually the output file if
xgettext(1) succeeds.

Signed-off-by: Franck Bui-Huu <fbuihuu@gmail.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index eb7f448..1952605 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -199,9 +199,7 @@ cpupower: $(UTIL_OBJS) libcpupower.so.$(LIB_MAJ)
 po/$(PACKAGE).pot: $(UTIL_SRC)
 	$(ECHO) "  GETTEXT " $@
 	$(QUIET) xgettext --default-domain=$(PACKAGE) --add-comments \
-		--keyword=_ --keyword=N_ $(UTIL_SRC) && \
-	test -f $(PACKAGE).po && \
-	mv -f $(PACKAGE).po po/$(PACKAGE).pot
+		--keyword=_ --keyword=N_ $(UTIL_SRC) -p $(@D) -o $(@F)
 
 po/%.gmo: po/%.po
 	$(ECHO) "  MSGFMT  " $@
-- 
1.7.5.4

