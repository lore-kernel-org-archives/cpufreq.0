From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH V4 1/2] ppc: enable scom access functions on Maple
Date: Wed, 29 Jun 2011 19:07:55 +0400
Message-ID: <1309360076-22579-2-git-send-email-dbaryshkov@gmail.com>
References: <1309360076-22579-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=6cIjZfpSKNhJNcTGrTQOd/Oex5u2IcvPTdiuzInzHSU=;
        b=ppyCR7qkfrBxutFDIrD5vSbWUgD18ojGdI+Qp79mDcNNqCISjry/VbWvXmwgjRkC3Q
         Ww9Kub44xfDhnJjZA0yUpf4JL4JO/v+I1lQZg7RgDHh6P64RDQb9vbx7KYb2+edQ9NNI
         +QDCMfjoY+9yuJejKUrA7f3+lKleB1d+4/dA4=
In-Reply-To: <1309360076-22579-1-git-send-email-dbaryshkov@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Paul Mackerras <paulus@samba.org>

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
1.7.5.4

