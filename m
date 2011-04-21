From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/2] cpupowerutils: Rename: libcpufreq->libcpupower
Date: Thu, 21 Apr 2011 17:50:25 +0200
Message-ID: <1303401026-38432-2-git-send-email-trenn@suse.de>
References: <1303401026-38432-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1303401026-38432-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: Thomas Renninger <trenn@suse.de>

Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/Makefile       |   26 +++++++++++++-------------
 tools/power/cpupower/bench/Makefile |    2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index 62c2716..6e06f1e 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -168,20 +168,20 @@ endif
 
 # the actual make rules
 
-all: libcpufreq cpupower $(COMPILE_NLS) $(COMPILE_BENCH)
+all: libcpupower cpupower $(COMPILE_NLS) $(COMPILE_BENCH)
 
 lib/%.o: $(LIB_SRC) $(LIB_HEADERS)
 	$(ECHO) "  CC      " $@
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c
 
-libcpufreq.so.$(LIB_MAJ): $(LIB_OBJS)
+libcpupower.so.$(LIB_MAJ): $(LIB_OBJS)
 	$(ECHO) "  LD      " $@
 	$(QUIET) $(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
-		-Wl,-soname,libcpufreq.so.$(LIB_MIN) $(LIB_OBJS)
-	@ln -sf $@ libcpufreq.so
-	@ln -sf $@ libcpufreq.so.$(LIB_MIN)
+		-Wl,-soname,libcpupower.so.$(LIB_MIN) $(LIB_OBJS)
+	@ln -sf $@ libcpupower.so
+	@ln -sf $@ libcpupower.so.$(LIB_MIN)
 
-libcpufreq: libcpufreq.so.$(LIB_MAJ)
+libcpupower: libcpupower.so.$(LIB_MAJ)
 
 # Let all .o files depend on its .c file and all headers
 # Might be worth to put this into utils/Makefile at some point of time
@@ -191,9 +191,9 @@ $(UTIL_OBJS): $(UTIL_HEADERS)
 	$(ECHO) "  CC      " $@
 	$(QUIET) $(CC) $(CFLAGS) $(CPPFLAGS) -I./lib -I ./utils -o $@ -c $*.c
 
-cpupower: $(UTIL_OBJS) libcpufreq.so.$(LIB_MAJ)
+cpupower: $(UTIL_OBJS) libcpupower.so.$(LIB_MAJ)
 	$(ECHO) "  CC      " $@
-	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -lcpufreq -lrt -lpci -L. -o $@ $(UTIL_OBJS)
+	$(QUIET) $(CC) $(CFLAGS) $(LDFLAGS) -lcpupower -lrt -lpci -L. -o $@ $(UTIL_OBJS)
 	$(QUIET) $(STRIPCMD) $@
 
 po/$(PACKAGE).pot: $(UTIL_SRC)
@@ -222,7 +222,7 @@ update-po: po/$(PACKAGE).pot
 		fi; \
 	done;
 
-compile-bench: libcpufreq.so.$(LIB_MAJ)
+compile-bench: libcpupower.so.$(LIB_MAJ)
 	@V=$(V) confdir=$(confdir) $(MAKE) -C bench
 
 clean:
@@ -231,14 +231,14 @@ clean:
 	-rm -f $(UTIL_BINS)
 	-rm -f $(IDLE_OBJS)
 	-rm -f cpupower
-	-rm -f libcpufreq.so*
+	-rm -f libcpupower.so*
 	-rm -rf po/*.gmo po/*.pot
 	$(MAKE) -C bench clean
 
 
 install-lib:
 	$(INSTALL) -d $(DESTDIR)${libdir}
-	$(CP) libcpufreq.so* $(DESTDIR)${libdir}/
+	$(CP) libcpupower.so* $(DESTDIR)${libdir}/
 	$(INSTALL) -d $(DESTDIR)${includedir}
 	$(INSTALL_DATA) lib/cpufreq.h $(DESTDIR)${includedir}/cpufreq.h
 
@@ -268,7 +268,7 @@ install-bench:
 install: all install-lib install-tools install-man $(INSTALL_NLS) $(INSTALL_BENCH)
 
 uninstall:
-	- rm -f $(DESTDIR)${libdir}/libcpufreq.*
+	- rm -f $(DESTDIR)${libdir}/libcpupower.*
 	- rm -f $(DESTDIR)${includedir}/cpufreq.h
 	- rm -f $(DESTDIR)${bindir}/utils/cpupower
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
@@ -277,4 +277,4 @@ uninstall:
 		rm -f $(DESTDIR)${localedir}/$$HLANG/LC_MESSAGES/cpupowerutils.mo; \
 	  done;
 
-.PHONY: all utils libcpufreq update-po create-gmo install-lib install-tools install-man install-gmo install uninstall clean
+.PHONY: all utils libcpupower update-po create-gmo install-lib install-tools install-man install-gmo install uninstall clean
diff --git a/tools/power/cpupower/bench/Makefile b/tools/power/cpupower/bench/Makefile
index d779aac..2b67606 100644
--- a/tools/power/cpupower/bench/Makefile
+++ b/tools/power/cpupower/bench/Makefile
@@ -1,4 +1,4 @@
-LIBS = -L../ -lm -lcpufreq
+LIBS = -L../ -lm -lcpupower
 
 OBJS = main.o parse.o system.o benchmark.o
 CFLAGS += -D_GNU_SOURCE -I../lib -DDEFAULT_CONFIG_FILE=\"$(confdir)/cpufreq-bench.conf\"
-- 
1.7.3.4

