From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/2] patch remove_utils_from_name
Date: Thu, 21 Apr 2011 17:45:16 +0200
Message-ID: <1303400716-37749-3-git-send-email-trenn@suse.de>
References: <1303400716-37749-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1303400716-37749-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: Thomas Renninger <trenn@suse.de>

---
 tools/power/cpupower/Makefile |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index 6e06f1e..d00d8e9 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -1,4 +1,4 @@
-# Makefile for cpupowerutils
+# Makefile for cpupower
 #
 # Copyright (C) 2005,2006 Dominik Brodowski <linux@dominikbrodowski.net>
 #
@@ -51,7 +51,7 @@ VERSION =			009p1
 LIB_MAJ=			0.0.0
 LIB_MIN=			0
 
-PACKAGE =			cpupowerutils
+PACKAGE =			cpupower
 PACKAGE_BUGREPORT =		cpufreq@vger.kernel.org
 LANGUAGES = 			de fr it cs pt
 
@@ -66,7 +66,7 @@ mandir ?=	/usr/man
 includedir ?=	/usr/include
 libdir ?=	/usr/lib
 localedir ?=	/usr/share/locale
-docdir ?=       /usr/share/doc/packages/cpupowerutils
+docdir ?=       /usr/share/doc/packages/cpupower
 confdir ?=      /etc/
 
 # Toolchain: what tools do we use, and what options do they need:
@@ -257,8 +257,8 @@ install-man:
 install-gmo:
 	$(INSTALL) -d $(DESTDIR)${localedir}
 	for HLANG in $(LANGUAGES); do \
-		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo'; \
-		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo; \
+		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupower.mo'; \
+		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupower.mo; \
 	done;
 
 install-bench:
@@ -274,7 +274,7 @@ uninstall:
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-info.1
 	- for HLANG in $(LANGUAGES); do \
-		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo; \
+		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupower.mo; \
 	  done;
 
 .PHONY: all utils libcpupower update-po create-gmo install-lib install-tools install-man install-gmo install uninstall clean
-- 
1.7.3.4

