From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] X86_GX_SUSPMOD must depend on PCI
Date: Mon, 21 Nov 2005 23:33:06 +0100
Message-ID: <20051121223306.GX16060@stusta.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751239AbVKUXGI@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

This patch fixes the following compile error:

...
  CC      arch/i386/kernel/cpu/cpufreq/gx-suspmod.o
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c: In function 'gx_detect_chipset':
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c:193: error: implicit declaration of function 'pci_match_id'
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c:193: warning: comparison between pointer and integer
make[3]: *** [arch/i386/kernel/cpu/cpufreq/gx-suspmod.o] Error 1

<--  snip  -->


Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.15-rc1-mm2-full/arch/i386/kernel/cpu/cpufreq/Kconfig.old	2005-11-21 19:59:21.000000000 +0100
+++ linux-2.6.15-rc1-mm2-full/arch/i386/kernel/cpu/cpufreq/Kconfig	2005-11-21 19:59:48.000000000 +0100
@@ -96,6 +96,7 @@
 
 config X86_GX_SUSPMOD
 	tristate "Cyrix MediaGX/NatSemi Geode Suspend Modulation"
+	depends on PCI
 	help
 	 This add the CPUFreq driver for NatSemi Geode processors which
 	 support suspend modulation.
