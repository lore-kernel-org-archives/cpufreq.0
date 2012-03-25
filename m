From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 13/13] cpupower tools: add install target to the debug tools' makefiles
Date: Sun, 25 Mar 2012 20:38:54 +0200
Message-ID: <1332700734-26435-13-git-send-email-linux@dominikbrodowski.net>
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
 tools/power/cpupower/debug/i386/Makefile   |   14 +++++++++++++-
 tools/power/cpupower/debug/x86_64/Makefile |   12 +++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/debug/i386/Makefile b/tools/power/cpupower/debug/i386/Makefile
index 626478b..3ba158f 100644
--- a/tools/power/cpupower/debug/i386/Makefile
+++ b/tools/power/cpupower/debug/i386/Makefile
@@ -3,6 +3,11 @@ ifeq ("$(origin O)", "command line")
 	OUTPUT := $(O)/
 endif
 
+DESTDIR =
+bindir  = /usr/bin
+
+INSTALL = /usr/bin/install
+
 
 default: all
 
@@ -23,4 +28,11 @@ all: $(OUTPUT)centrino-decode $(OUTPUT)dump_psb $(OUTPUT)intel_gsic $(OUTPUT)pow
 clean:
 	rm -rf $(OUTPUT){centrino-decode,dump_psb,intel_gsic,powernow-k8-decode}
 
-.PHONY: all default clean
+install:
+	$(INSTALL) -d $(DESTDIR)${bindir}
+	$(INSTALL) $(OUTPUT)centrino-decode $(DESTDIR)${bindir}
+	$(INSTALL) $(OUTPUT)powernow-k8-decode $(DESTDIR)${bindir}
+	$(INSTALL) $(OUTPUT)dump_psb $(DESTDIR)${bindir}
+	$(INSTALL) $(OUTPUT)intel_gsic $(DESTDIR)${bindir}
+
+.PHONY: all default clean install
diff --git a/tools/power/cpupower/debug/x86_64/Makefile b/tools/power/cpupower/debug/x86_64/Makefile
index 8e26d67..1c52145 100644
--- a/tools/power/cpupower/debug/x86_64/Makefile
+++ b/tools/power/cpupower/debug/x86_64/Makefile
@@ -3,6 +3,11 @@ ifeq ("$(origin O)", "command line")
 	OUTPUT := $(O)/
 endif
 
+DESTDIR =
+bindir  = /usr/bin
+
+INSTALL = /usr/bin/install
+
 
 default: all
 
@@ -17,4 +22,9 @@ all: $(OUTPUT)centrino-decode $(OUTPUT)powernow-k8-decode
 clean:
 	rm -rf $(OUTPUT)centrino-decode $(OUTPUT)powernow-k8-decode
 
-.PHONY: all default clean
+install:
+	$(INSTALL) -d $(DESTDIR)${bindir}
+	$(INSTALL) $(OUTPUT)centrino-decode $(DESTDIR)${bindir}
+	$(INSTALL) $(OUTPUT)powernow-k8-decode $(DESTDIR)${bindir}
+
+.PHONY: all default clean install
-- 
1.7.5.4

