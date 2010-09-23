From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/4] cpufrequtils: Rename libcpufreq to libcpupower
Date: Thu, 23 Sep 2010 17:30:09 +0200
Message-ID: <1285255810-11252-4-git-send-email-trenn@suse.de>
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

But still provide libcpufreq which links against the new libcpupower now.

Like that binaries linking with -lcpufreq will still work.
Getting this (-l cpufreq) deprecated should work at packaging layer then.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile |   30 +++++++++++++++++++++---------
 1 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 07637ed..089fe33 100644
--- a/Makefile
+++ b/Makefile
@@ -152,7 +152,7 @@ endif
 
 # the actual make rules
 
-all: ccdv libcpufreq utils $(COMPILE_NLS) $(COMPILE_BENCH)
+all: ccdv libcpupower utils $(COMPILE_NLS) $(COMPILE_BENCH)
 
 ccdv: build/ccdv
 build/ccdv: build/ccdv.c
@@ -162,17 +162,25 @@ build/ccdv: build/ccdv.c
 lib/%.o: $(LIB_SRC) $(LIB_HEADERS) build/ccdv
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c
 
-libcpufreq.so.$(LIB_MAJ): $(LIB_OBJS)
-	$(QUIET) $(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
-		-Wl,-soname,libcpufreq.so.$(LIB_MIN) $(LIB_OBJS)
+libcpupower.so.$(LIB_MAJ): $(LIB_OBJS)
+	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
+		-Wl,-soname,libcpupower.so.$(LIB_MIN) $(LIB_OBJS)
+	@ln -sf $@ libcpupower.so
+	@ln -sf $@ libcpupower.so.$(LIB_MIN)
+
+# Still Provide the old lib, but apps should get fixed to
+# not link against it anymore 
+libcpufreq.so.$(LIB_MAJ): libcpupower.so.$(LIB_MAJ)
+	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
+		-Wl,-soname,libcpufreq.so.$(LIB_MIN) -l cpupower -L .
 	@ln -sf $@ libcpufreq.so
 	@ln -sf $@ libcpufreq.so.$(LIB_MIN)
 
-libcpufreq: libcpufreq.so.$(LIB_MAJ)
+libcpupower: libcpupower.so.$(LIB_MAJ) libcpufreq.so.$(LIB_MAJ)
 
-$(UTIL_BINS): libcpufreq.so.$(LIB_MAJ) $(UTIL_SRC)
+$(UTIL_BINS): libcpupower.so.$(LIB_MAJ) $(UTIL_SRC)
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -I. -I./lib/ -c $@.c -o $@.o
-	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -L. -o $@ $@.o -lcpufreq
+	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -L. -o $@ $@.o -lcpupower
 	$(QUIET) $(STRIPCMD) $@
 
 utils: $(UTIL_BINS)
@@ -196,13 +204,14 @@ update-gmo: po/$(PACKAGE).pot
 		msgfmt --statistics -o po/$$HLANG.gmo po/$$HLANG.po; \
 	done;
 
-compile-bench: libcpufreq
+compile-bench: libcpupower
 	@V=$(V) confdir=$(confdir) $(MAKE) -C bench
 
 clean:
 	-find . \( -not -type d \) -and \( -name '*~' -o -name '*.[oas]' \) -type f -print \
 	 | xargs rm -f
 	-rm -f $(UTIL_BINS)
+	-rm -f libcpupower.so*
 	-rm -f libcpufreq.so*
 	-rm -f build/ccdv
 	-rm -rf po/*.gmo po/*.pot
@@ -211,9 +220,11 @@ clean:
 
 install-lib:
 	$(INSTALL) -d $(DESTDIR)${libdir}
+	$(CP) libcpupower.so* $(DESTDIR)${libdir}/
 	$(CP) libcpufreq.so* $(DESTDIR)${libdir}/
 	$(INSTALL) -d $(DESTDIR)${includedir}
 	$(INSTALL_DATA) lib/cpufreq.h $(DESTDIR)${includedir}/cpufreq.h
+	$(INSTALL_DATA) lib/cpuidle.h $(DESTDIR)${includedir}/cpuidle.h
 
 install-tools:
 	$(INSTALL) -d $(DESTDIR)${bindir}
@@ -237,6 +248,7 @@ install-bench:
 install: all install-lib install-tools install-man $(INSTALL_NLS) $(INSTALL_BENCH)
 
 uninstall:
+	- rm -f $(DESTDIR)${libdir}/libcpupower.*
 	- rm -f $(DESTDIR)${libdir}/libcpufreq.*
 	- rm -f $(DESTDIR)${includedir}/cpufreq.h
 	- rm -f $(DESTDIR)${bindir}/cpufreq-set
@@ -249,5 +261,5 @@ uninstall:
 		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
 	  done;
 
-.PHONY: all utils libcpufreq ccdv update-po update-gmo install-lib install-tools install-man install-gmo install uninstall \
+.PHONY: all utils libcpupower ccdv update-po update-gmo install-lib install-tools install-man install-gmo install uninstall \
 	clean 
-- 
1.6.4.2

