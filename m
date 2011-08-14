From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] cpufrequtils: make NLS optional
Date: Sat, 13 Aug 2011 23:02:20 -0400
Message-ID: <1313290940-23943-1-git-send-email-mattst88@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=Ongx20oCbJLUA4lHIc5/eJ5Ccwbpr0P6neVwpv88R04=;
        b=hE4+iLbX8DNX4fLI14Ly38xDA4S8ORxrsCNl5Za5CS5Tbh8RyVNrXWN1bdIaEexjqa
         wtyBOL133IgpU9Vas79XYpZkKbmdZ9tmmuAUzMUOL7T35DdT1D3268Ya3GCmIVKEufOp
         o8GpmoOWwmncpe6qJfgrOduI4cYDkFEJpnzrc=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@vger.kernel.org, Sergey Dryabzhinsky <sergey.dryabzhinsky@gmail.com>, Matt Turner <mattst88@gmail.com>

From: Sergey Dryabzhinsky <sergey.dryabzhinsky@gmail.com>

https://bugs.gentoo.org/205576

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Makefile     |    1 +
 utils/info.c |   10 +++++++++-
 utils/set.c  |   10 +++++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ed6bdde..84f265d 100644
--- a/Makefile
+++ b/Makefile
@@ -121,6 +121,7 @@ CFLAGS +=	-pipe
 ifeq ($(strip $(NLS)),true)
 	INSTALL_NLS += install-gmo
 	COMPILE_NLS += update-gmo
+	CPPFLAGS += -DNLS
 endif
 
 ifeq ($(strip $(CPUFRQ_BENCH)),true)
diff --git a/utils/info.c b/utils/info.c
index 38d906a..155e604 100644
--- a/utils/info.c
+++ b/utils/info.c
@@ -10,7 +10,6 @@
 #include <errno.h>
 #include <stdlib.h>
 #include <string.h>
-#include <libintl.h>
 #include <locale.h>
 
 #include <getopt.h>
@@ -18,9 +17,18 @@
 #include "cpufreq.h"
 
 
+#ifdef NLS
+#include <libintl.h>
 #define _(String) gettext (String)
 #define gettext_noop(String) String
 #define N_(String) gettext_noop (String)
+#else
+#define gettext_noop(String) String
+#define _(String) gettext_noop (String)
+#define gettext(String) gettext_noop (String)
+#define N_(String) gettext_noop (String)
+#define textdomain(String)
+#endif
 
 #define LINE_LEN 10
 
diff --git a/utils/set.c b/utils/set.c
index 2ece47e..bfca465 100644
--- a/utils/set.c
+++ b/utils/set.c
@@ -12,16 +12,24 @@
 #include <limits.h>
 #include <string.h>
 #include <ctype.h>
-#include <libintl.h>
 #include <locale.h>
 
 #include <getopt.h>
 
 #include "cpufreq.h"
 
+#ifdef NLS
+#include <libintl.h>
 #define _(String) gettext(String)
 #define gettext_noop(String) String
 #define N_(String) gettext_noop(String)
+#else
+#define gettext_noop(String) String
+#define _(String) gettext_noop (String)
+#define gettext(String) gettext_noop (String)
+#define N_(String) gettext_noop (String)
+#define textdomain(String)
+#endif
 
 #define NORM_FREQ_LEN 32
 
-- 
1.7.3.4

