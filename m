From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 12/13] cpupower tools: allow to build debug tools in a separate directory too
Date: Sun, 25 Mar 2012 20:38:53 +0200
Message-ID: <1332700734-26435-12-git-send-email-linux@dominikbrodowski.net>
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

Signed-off-by: Franck Bui-Huu <fbuihuu@gmail.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/debug/i386/Makefile   |   26 ++++++++++++++++----------
 tools/power/cpupower/debug/x86_64/Makefile |   14 ++++++++++----
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/power/cpupower/debug/i386/Makefile b/tools/power/cpupower/debug/i386/Makefile
index d08cc1e..626478b 100644
--- a/tools/power/cpupower/debug/i386/Makefile
+++ b/tools/power/cpupower/debug/i386/Makefile
@@ -1,20 +1,26 @@
+OUTPUT=./
+ifeq ("$(origin O)", "command line")
+	OUTPUT := $(O)/
+endif
+
+
 default: all
 
-centrino-decode: centrino-decode.c
-	$(CC) $(CFLAGS) -o centrino-decode centrino-decode.c
+$(OUTPUT)centrino-decode: centrino-decode.c
+	$(CC) $(CFLAGS) -o $@ centrino-decode.c
 
-dump_psb: dump_psb.c
-	$(CC) $(CFLAGS) -o dump_psb dump_psb.c
+$(OUTPUT)dump_psb: dump_psb.c
+	$(CC) $(CFLAGS) -o $@ dump_psb.c
 
-intel_gsic: intel_gsic.c
-	$(CC) $(CFLAGS) -o intel_gsic -llrmi intel_gsic.c
+$(OUTPUT)intel_gsic: intel_gsic.c
+	$(CC) $(CFLAGS) -o $@ -llrmi intel_gsic.c
 
-powernow-k8-decode: powernow-k8-decode.c
-	$(CC) $(CFLAGS) -o powernow-k8-decode powernow-k8-decode.c
+$(OUTPUT)powernow-k8-decode: powernow-k8-decode.c
+	$(CC) $(CFLAGS) -o $@ powernow-k8-decode.c
 
-all: centrino-decode dump_psb intel_gsic powernow-k8-decode
+all: $(OUTPUT)centrino-decode $(OUTPUT)dump_psb $(OUTPUT)intel_gsic $(OUTPUT)powernow-k8-decode
 
 clean:
-	rm -rf centrino-decode dump_psb intel_gsic powernow-k8-decode
+	rm -rf $(OUTPUT){centrino-decode,dump_psb,intel_gsic,powernow-k8-decode}
 
 .PHONY: all default clean
diff --git a/tools/power/cpupower/debug/x86_64/Makefile b/tools/power/cpupower/debug/x86_64/Makefile
index 3326217..8e26d67 100644
--- a/tools/power/cpupower/debug/x86_64/Makefile
+++ b/tools/power/cpupower/debug/x86_64/Makefile
@@ -1,14 +1,20 @@
+OUTPUT=./
+ifeq ("$(origin O)", "command line")
+	OUTPUT := $(O)/
+endif
+
+
 default: all
 
-centrino-decode: ../i386/centrino-decode.c
+$(OUTPUT)centrino-decode: ../i386/centrino-decode.c
 	$(CC) $(CFLAGS) -o $@ $<
 
-powernow-k8-decode: ../i386/powernow-k8-decode.c
+$(OUTPUT)powernow-k8-decode: ../i386/powernow-k8-decode.c
 	$(CC) $(CFLAGS) -o $@ $<
 
-all: centrino-decode powernow-k8-decode
+all: $(OUTPUT)centrino-decode $(OUTPUT)powernow-k8-decode
 
 clean:
-	rm -rf centrino-decode powernow-k8-decode
+	rm -rf $(OUTPUT)centrino-decode $(OUTPUT)powernow-k8-decode
 
 .PHONY: all default clean
-- 
1.7.5.4

