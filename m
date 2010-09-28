From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/3] cpupowerutils: Use sbindir for binaries that need root privileges
Date: Tue, 28 Sep 2010 13:13:27 +0200
Message-ID: <1285672408-26839-3-git-send-email-trenn@suse.de>
References: <201009281306.28835.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201009281306.28835.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

cpufreq-aperf:
   - Must be run as root or it exits with a related error message.
   - It should not be used by any scripts

cpufreq-set:
I am not sure whether above is true for cpufreq-set as well.
I expect it always must be called as root and thus should be in sbindir.


Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a53b440..865c9f8 100644
--- a/Makefile
+++ b/Makefile
@@ -228,7 +228,11 @@ install-lib:
 
 install-tools:
 	$(INSTALL) -d $(DESTDIR)${bindir}
-	$(INSTALL_PROGRAM) $(UTIL_BINS) $(DESTDIR)${bindir}
+	$(INSTALL_PROGRAM) utils/cpufreq-info utils/cpuidle-info \
+                  $(DESTDIR)${bindir}
+	$(INSTALL) -d $(DESTDIR)${sbindir}
+	$(INSTALL_PROGRAM) utils/cpufreq-set utils/cpufreq-aperf \
+                  $(DESTDIR)${sbindir}
 
 install-man:
 	$(INSTALL_DATA) -D man/cpufreq-set.1 $(DESTDIR)${mandir}/man1/cpufreq-set.1
@@ -251,9 +255,9 @@ uninstall:
 	- rm -f $(DESTDIR)${libdir}/libcpupower.*
 	- rm -f $(DESTDIR)${libdir}/libcpufreq.*
 	- rm -f $(DESTDIR)${includedir}/cpufreq.h
-	- rm -f $(DESTDIR)${bindir}/cpufreq-set
+	- rm -f $(DESTDIR)${sbindir}/cpufreq-set
 	- rm -f $(DESTDIR)${bindir}/cpufreq-info
-	- rm -f $(DESTDIR)${bindir}/cpufreq-aperf
+	- rm -f $(DESTDIR)${sbindir}/cpufreq-aperf
 	- rm -f $(DESTDIR)${bindir}/cpuidle-info
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-info.1
-- 
1.6.4.2

