From: Rakib Mullick <rakib.mullick@gmail.com>
Subject: [PATCH]: x86, cpufreq: Mark longrun_get_policy with __cpuinit.
Date: Thu, 21 Oct 2010 17:28:44 +0600
Message-ID: <AANLkTimTi_NTSampvrxXMVj5UTCR+p5wxLCQdnY8Rc4+@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=ktbgEvvGJknqH8LdH8HPNEuj4KUGhz477qUI4oE/mVw=;
        b=u0qoTepZnz7MKG96uHmUXGo/gON7I43oaIwfqcO1CrrwTUpwxv1827KI0shZUXb7kd
         9ctx8MJIHnENXBLzGGn7dgsf6mcH0QgOemeWMxCVb58ZG3voGlsM0Mr5aqW/dZ/yP5CI
         eCX7KrOUU3jQpsuK0JvjG++vByEyMHMGXutRU=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

This patch fixes the following warning. The function
longrun_cpu_init() is marked with __cpuinit which calls
longrun_get_policy() which is a __init function. So make
longrun_get_policy with __cpuinit.

WARNING: arch/x86/kernel/cpu/cpufreq/longrun.o(.cpuinit.text+0x4c5):
Section mismatch in reference from the function longrun_cpu_init() to
the function .init.text:longrun_get_policy()
The function __cpuinit longrun_cpu_init() references
a function __init longrun_get_policy().
If longrun_get_policy is only used by longrun_cpu_init then
annotate longrun_get_policy with a matching annotation.


Signed-off-by: Rakib Mullick <rakib.mullick@gmail.com>
---

diff --git a/arch/x86/kernel/cpu/cpufreq/longrun.c
b/arch/x86/kernel/cpu/cpufreq/longrun.c
index fc09f14..66d5d6f 100644
--- a/arch/x86/kernel/cpu/cpufreq/longrun.c
+++ b/arch/x86/kernel/cpu/cpufreq/longrun.c
@@ -35,7 +35,7 @@ static unsigned int longrun_low_freq, longrun_high_freq;
  * Reads the current LongRun policy by access to MSR_TMTA_LONGRUN_FLAGS
  * and MSR_TMTA_LONGRUN_CTRL
  */
-static void __init longrun_get_policy(struct cpufreq_policy *policy)
+static void __cpuinit longrun_get_policy(struct cpufreq_policy *policy)
 {
 	u32 msr_lo, msr_hi;
