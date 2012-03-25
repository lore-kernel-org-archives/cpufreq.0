From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 07/13] cpupower: Fix linking with --as-needed
Date: Sun, 25 Mar 2012 20:38:48 +0200
Message-ID: <1332700734-26435-7-git-send-email-linux@dominikbrodowski.net>
References: <20120325183807.GA26398@comet.dominikbrodowski.net>
 <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org
Cc: =?UTF-8?q?Ozan=20=C3=87a=C4=9Flayan?= <ozan@pardus.org.tr>, Dominik Brodowski <linux@dominikbrodowski.net>

=46rom: Ozan =C3=87a=C4=9Flayan <ozan@pardus.org.tr>

=46ix linking order to avoid undefined reference errors when
using --as-needed linker flag.

Signed-off-by: Ozan =C3=87a=C4=9Flayan <ozan@pardus.org.tr>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makef=
ile
index e8a03ac..f01b3f5 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -193,7 +193,7 @@ $(UTIL_OBJS): $(UTIL_HEADERS)
=20
 cpupower: $(UTIL_OBJS) libcpupower.so.$(LIB_MAJ)
 	$(ECHO) "  CC      " $@
-	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -lcpupower -lrt -lpci -L. -o $@ $=
(UTIL_OBJS)
+	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) $(UTIL_OBJS) -lcpupower -lrt -lpc=
i -L. -o $@
 	$(QUIET) $(STRIPCMD) $@
=20
 po/$(PACKAGE).pot: $(UTIL_SRC)
--=20
1.7.5.4

