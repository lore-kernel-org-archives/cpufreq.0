From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] aperf: fix compilation on x86-32 with -fPIC
Date: Tue, 26 Jul 2011 19:28:31 -0400
Message-ID: <1311722911-14562-1-git-send-email-mattst88@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=fRTakO70wVz4/OCc2Py+i49kRC2socnH9QklsjdJu0w=;
        b=ghYL5Vs50QRLw7nGeS9YqUgOq6UYlsWx58W9qqsRLfaWnO3zcgrhVTaWgu3MfRivnq
         ULErCh2tQXwSB1F8w+MDSbOCMMbm/wk2Wy00LdS8G7FZD+cVee/WuqBR0pFqAiE3+d3N
         QvzMgzqPhrQsWiQ+iIDp4myHp//18ovXOulHI=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@vger.kernel.org, Matt Turner <mattst88@gmail.com>

ebx is used to store the GOT pointer when compiled with -fPIC, so it's
not usable by inline assembly.

https://bugs.gentoo.org/375967

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 utils/cpuid.h |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/utils/cpuid.h b/utils/cpuid.h
index 2bac69a..53da789 100644
--- a/utils/cpuid.h
+++ b/utils/cpuid.h
@@ -5,9 +5,21 @@ static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
 				unsigned int *ecx, unsigned int *edx)
 {
 	/* ecx is often an input as well as an output. */
-	asm volatile("cpuid"
+	asm volatile(
+#if defined(__i386__) && defined(__PIC__)
+	    "push %%ebx\n"
+	    "cpuid\n"
+	    "movl %%ebx, %1\n"
+	    "pop %%ebx\n"
+#else
+	    "cpuid\n"
+#endif
 	    : "=a" (*eax),
+#if defined(__i386__) && defined(__PIC__)
+	      "=r" (*ebx),
+#else
 	      "=b" (*ebx),
+#endif
 	      "=c" (*ecx),
 	      "=d" (*edx)
 	    : "0" (*eax), "2" (*ecx));
-- 
1.7.3.4

