From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] X86_GX_SUSPMOD must depend on PCI
Date: Sat, 8 Jul 2006 22:20:26 +0200
Message-ID: <20060708202026.GF5020@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030328AbWGHUUq@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

It seems commit 32ee8c3e470d86588b51dc42ed01e85c5fa0f180 accidentially=20
reverted cdc9cc1d740ffc3d8d8207fbf5df9bf05fcc9955, IOW, it reintroduced=
=20
the following compile error with CONFIG_PCI=3Dn:

<--  snip  -->

=2E..
  CC      arch/i386/kernel/cpu/cpufreq/gx-suspmod.o
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c: In function =E2=80=98gx_dete=
ct_chipset=E2=80=99:
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c:193: error: implicit declarat=
ion of function =E2=80=98pci_match_id=E2=80=99
arch/i386/kernel/cpu/cpufreq/gx-suspmod.c:193: warning: comparison betw=
een pointer and integer
make[3]: *** [arch/i386/kernel/cpu/cpufreq/gx-suspmod.o] Error 1

<--  snip  -->

This patch therefore re-adds the dependency of X86_GX_SUSPMOD on PCI.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.17-mm6-full/arch/i386/kernel/cpu/cpufreq/Kconfig.old	2006=
-07-08 17:29:40.000000000 +0200
+++ linux-2.6.17-mm6-full/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-07-=
08 17:29:53.000000000 +0200
@@ -96,6 +96,7 @@
=20
 config X86_GX_SUSPMOD
 	tristate "Cyrix MediaGX/NatSemi Geode Suspend Modulation"
+	depends on PCI
 	help
 	 This add the CPUFreq driver for NatSemi Geode processors which
 	 support suspend modulation.
