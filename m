From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/5] cpupowerutils: Move utils/cpuid.h to lib/cpuid.h
Date: Tue,  5 Oct 2010 14:23:12 +0200
Message-ID: <1286281394-14699-4-git-send-email-trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1286281394-14699-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

So that utils/*.c code can make use of this as well.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 Makefile      |    4 +-
 lib/cpuid.h   |   65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 utils/cpuid.h |   63 -------------------------------------------------------
 3 files changed, 67 insertions(+), 65 deletions(-)
 create mode 100644 lib/cpuid.h
 delete mode 100644 utils/cpuid.h

diff --git a/Makefile b/Makefile
index b04f85c..2cd9e83 100644
--- a/Makefile
+++ b/Makefile
@@ -111,9 +111,9 @@ WARNINGS += -Wshadow
 CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
 		-DPACKAGE_BUGREPORT=\"$(PACKAGE_BUGREPORT)\" -D_GNU_SOURCE
 
-UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuidle-info.c utils/cpuid.h
+UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuidle-info.c
 UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf utils/cpuidle-info
-LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h lib/msr.h
+LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h lib/msr.h lib/cpuid.h
 LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c lib/msr.c
 LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o lib/msr.o
 
diff --git a/lib/cpuid.h b/lib/cpuid.h
new file mode 100644
index 0000000..5f179db
--- /dev/null
+++ b/lib/cpuid.h
@@ -0,0 +1,65 @@
+#ifndef _CPUFREQ_CPUID_H
+#define _CPUFREQ_CPUID_H
+
+#include <stdint.h>
+
+static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
+				unsigned int *ecx, unsigned int *edx)
+{
+	/* ecx is often an input as well as an output. */
+	asm volatile("cpuid"
+	    : "=a" (*eax),
+	      "=b" (*ebx),
+	      "=c" (*ecx),
+	      "=d" (*edx)
+	    : "0" (*eax), "2" (*ecx));
+}
+static inline void cpuid(unsigned int op,
+			 unsigned int *eax, unsigned int *ebx,
+			 unsigned int *ecx, unsigned int *edx)
+{
+	*eax = op;
+	*ecx = 0;
+	__cpuid(eax, ebx, ecx, edx);
+}
+
+/*
+ * CPUID functions returning a single datum
+ */
+static inline unsigned int cpuid_eax(unsigned int op)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	cpuid(op, &eax, &ebx, &ecx, &edx);
+
+	return eax;
+}
+
+static inline unsigned int cpuid_ebx(unsigned int op)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	cpuid(op, &eax, &ebx, &ecx, &edx);
+
+	return ebx;
+}
+
+static inline unsigned int cpuid_ecx(unsigned int op)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	cpuid(op, &eax, &ebx, &ecx, &edx);
+
+	return ecx;
+}
+
+static inline unsigned int cpuid_edx(unsigned int op)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	cpuid(op, &eax, &ebx, &ecx, &edx);
+
+	return edx;
+}
+
+#endif /* _CPUFREQ_CPUID_H */
diff --git a/utils/cpuid.h b/utils/cpuid.h
deleted file mode 100644
index 2bac69a..0000000
--- a/utils/cpuid.h
+++ /dev/null
@@ -1,63 +0,0 @@
-#ifndef _CPUFREQ_CPUID_H
-#define _CPUFREQ_CPUID_H
-
-static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
-				unsigned int *ecx, unsigned int *edx)
-{
-	/* ecx is often an input as well as an output. */
-	asm volatile("cpuid"
-	    : "=a" (*eax),
-	      "=b" (*ebx),
-	      "=c" (*ecx),
-	      "=d" (*edx)
-	    : "0" (*eax), "2" (*ecx));
-}
-static inline void cpuid(unsigned int op,
-			 unsigned int *eax, unsigned int *ebx,
-			 unsigned int *ecx, unsigned int *edx)
-{
-	*eax = op;
-	*ecx = 0;
-	__cpuid(eax, ebx, ecx, edx);
-}
-
-/*
- * CPUID functions returning a single datum
- */
-static inline unsigned int cpuid_eax(unsigned int op)
-{
-	unsigned int eax, ebx, ecx, edx;
-
-	cpuid(op, &eax, &ebx, &ecx, &edx);
-
-	return eax;
-}
-
-static inline unsigned int cpuid_ebx(unsigned int op)
-{
-	unsigned int eax, ebx, ecx, edx;
-
-	cpuid(op, &eax, &ebx, &ecx, &edx);
-
-	return ebx;
-}
-
-static inline unsigned int cpuid_ecx(unsigned int op)
-{
-	unsigned int eax, ebx, ecx, edx;
-
-	cpuid(op, &eax, &ebx, &ecx, &edx);
-
-	return ecx;
-}
-
-static inline unsigned int cpuid_edx(unsigned int op)
-{
-	unsigned int eax, ebx, ecx, edx;
-
-	cpuid(op, &eax, &ebx, &ecx, &edx);
-
-	return edx;
-}
-
-#endif /* _CPUFREQ_CPUID_H */
-- 
1.6.4.2

