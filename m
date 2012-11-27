From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/8] cpupower tools: Remove brace expansion from clean target
Date: Tue, 27 Nov 2012 13:17:42 +0100
Message-ID: <1354018669-63680-2-git-send-email-trenn@suse.de>
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

The clean targets from the cpupower tools' Makefiles use brace expansion to
remove some generated files. However, the default shells on many systems do
not support this feature resulting in some generated files not being removed
by clean.

Signed-off-by: Palmer Cox <p@lmercox.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/Makefile            |    3 ++-
 tools/power/cpupower/debug/i386/Makefile |    5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index a93e06c..44b7a06 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -253,7 +253,8 @@ clean:
 	 | xargs rm -f
 	-rm -f $(OUTPUT)cpupower
 	-rm -f $(OUTPUT)libcpupower.so*
-	-rm -rf $(OUTPUT)po/*.{gmo,pot}
+	-rm -rf $(OUTPUT)po/*.gmo
+	-rm -rf $(OUTPUT)po/*.pot
 	$(MAKE) -C bench O=$(OUTPUT) clean
 
 
diff --git a/tools/power/cpupower/debug/i386/Makefile b/tools/power/cpupower/debug/i386/Makefile
index 3ba158f..c05cc0a 100644
--- a/tools/power/cpupower/debug/i386/Makefile
+++ b/tools/power/cpupower/debug/i386/Makefile
@@ -26,7 +26,10 @@ $(OUTPUT)powernow-k8-decode: powernow-k8-decode.c
 all: $(OUTPUT)centrino-decode $(OUTPUT)dump_psb $(OUTPUT)intel_gsic $(OUTPUT)powernow-k8-decode
 
 clean:
-	rm -rf $(OUTPUT){centrino-decode,dump_psb,intel_gsic,powernow-k8-decode}
+	rm -rf $(OUTPUT)centrino-decode
+	rm -rf $(OUTPUT)dump_psb
+	rm -rf $(OUTPUT)intel_gsic
+	rm -rf $(OUTPUT)powernow-k8-decode
 
 install:
 	$(INSTALL) -d $(DESTDIR)${bindir}
-- 
1.7.6.1

