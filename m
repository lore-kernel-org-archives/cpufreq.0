From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/4] cpufrequtils: Rename the project/package into cpupowerutils
Date: Thu, 23 Sep 2010 17:30:10 +0200
Message-ID: <1285255810-11252-5-git-send-email-trenn@suse.de>
References: <1285255810-11252-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1285255810-11252-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: trenn@suse.de

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 089fe33..a268264 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-# Makefile for cpufrequtils
+# Makefile for cpupowerutils
 #
 # Copyright (C) 2005,2006 Dominik Brodowski <linux@dominikbrodowski.net>
 #
@@ -51,7 +51,7 @@ VERSION =			008
 LIB_MAJ=			0.0.0
 LIB_MIN=			0
 
-PACKAGE =			cpufrequtils
+PACKAGE =			cpupowerutils
 PACKAGE_BUGREPORT =		cpufreq@vger.kernel.org
 LANGUAGES = 			de fr it cs pt
 
@@ -66,7 +66,7 @@ mandir ?=	/usr/man
 includedir ?=	/usr/include
 libdir ?=	/usr/lib
 localedir ?=	/usr/share/locale
-docdir ?=       /usr/share/doc/packages/cpufrequtils
+docdir ?=       /usr/share/doc/packages/cpupowerutils
 confdir ?=      /etc/
 
 # Toolchain: what tools do we use, and what options do they need:
@@ -237,8 +237,8 @@ install-man:
 install-gmo:
 	$(INSTALL) -d $(DESTDIR)${localedir}
 	for HLANG in $(LANGUAGES); do \
-		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo'; \
-		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
+		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo'; \
+		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo; \
 	done;
 
 install-bench:
@@ -258,7 +258,7 @@ uninstall:
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-info.1
 	- for HLANG in $(LANGUAGES); do \
-		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
+		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo; \
 	  done;
 
 .PHONY: all utils libcpupower ccdv update-po update-gmo install-lib install-tools install-man install-gmo install uninstall \
-- 
1.6.4.2

