From: Natanael Copa <ncopa@alpinelinux.org>
Subject: [PATCH] Fix NLS handling when building on uclibc
Date: Wed,  1 Sep 2010 08:10:25 +0000
Message-ID: <1283328625-4742-1-git-send-email-ncopa@alpinelinux.org>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Natanael Copa <ncopa@alpinelinux.org>

uClibc does not have libintl.h so we only include it if NLS=true
---
 Makefile     |    1 +
 utils/info.c |   10 +++++++++-
 utils/set.c  |   14 +++++++++++---
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 3ef2af7..26c6441 100644
--- a/Makefile
+++ b/Makefile
@@ -140,6 +140,7 @@ endif
 ifeq ($(strip $(NLS)),true)
 	INSTALL_NLS += install-gmo
 	COMPILE_NLS += update-gmo
+	CFLAGDEF += -DNLS
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
index 2ece47e..312cc8c 100644
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
 
-#define _(String) gettext(String)
+#ifdef NLS
+#include <libintl.h>
+#define _(String) gettext (String)
+#define gettext_noop(String) String
+#define N_(String) gettext_noop (String)
+#else
 #define gettext_noop(String) String
-#define N_(String) gettext_noop(String)
+#define _(String) gettext_noop (String)
+#define gettext(String) gettext_noop (String)
+#define N_(String) gettext_noop (String)
+#define textdomain(String)
+#endif
 
 #define NORM_FREQ_LEN 32
 
-- 
1.7.2.2

