From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 1/2] ppc: enable scom access functions on Maple
Date: Fri, 17 Jun 2011 17:10:06 +0400
Message-ID: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
        bh=XnxYUMgo0aWYq16UhEGZFr9IPOIrop0xYUABY8FPM+E=;
        b=O5UizJcWLkwtRrEQsA6+rq0icuEU69v5gIcgyESTY+rCwBmZwRyZGMO5ih1VfMzVMp
         es+62Grm1pZ/7/s9CmWQo67dxsaHKuitI8RO+N2Bv/lrsvWAEsLcRpLb7bv2LOuhOaLI
         O/n7JhI22hUsfVQ/YuC7Y61SY8dvoxcNsBtNM=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Dave Jones <davej@redhat.com>

Enable functions used to access SCOM if PPC_MAPLE is defined: they are
used by cpufreq driver to control hardware.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 arch/powerpc/kernel/misc_64.S |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index e89df59..616921e 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -339,7 +339,7 @@ _GLOBAL(real_205_writeb)
 #endif /* CONFIG_PPC_PASEMI */
 
 
-#ifdef CONFIG_CPU_FREQ_PMAC64
+#if defined(CONFIG_CPU_FREQ_PMAC64) || defined(CONFIG_CPU_FREQ_MAPLE)
 /*
  * SCOM access functions for 970 (FX only for now)
  *
@@ -408,7 +408,7 @@ _GLOBAL(scom970_write)
 	/* restore interrupts */
 	mtmsrd	r5,1
 	blr
-#endif /* CONFIG_CPU_FREQ_PMAC64 */
+#endif /* CONFIG_CPU_FREQ_PMAC64 || CONFIG_CPU_FREQ_MAPLE */
 
 
 /*
-- 
1.7.5.3

