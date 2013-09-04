From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: 3.12 merge window exynos cpufreq driver fails to build
Date: Wed, 4 Sep 2013 10:13:16 -0400
Message-ID: <CA+5PVA6SQ9JGBD3F=u5ysch-agp91oTK8ZbKsdQkz57yZ8OUHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:cc:content-type;
        bh=or9MnJbHtDL/nh8L876nol9UZ1x9r2dHfx77Rbc+LDU=;
        b=dJd06hN2NYvFB4GIB552Rn/YgHcTtmVDlVJJhXmJa7DXND3ZTTIGX1Z8ZSR907h0jY
         UZ2L9hUhHwMSXkz2WPCCiqGbCMETViDC5Gfukv+BctBWSyEG71CnHvlr7/YcJIm9gFGy
         QAd4RXBfPP90TK4JSUtqz6ngCudjV/xRtUkiG1XGh34CKKGHrWxKbBXMjctwYweJrzAH
         bddxNDdkavq6qtWnd8HNplY3aVrlZI1pUhR8ZFVcFanSHtISanbfsnV7vcfkdetv97V5
         G4nhpH+RhhOHedMgep4qPaG7SrLU8ZaVCu5qUfrEGZsjw8ejw0jDuVs1ntB9F+dkhdlA
         Trvg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

Using Linus' tree as of this morning (v3.11-2654-g458c3f6), the
exynos-cpufreq driver doesn't build because it includes a file that
doesn't exist.

+ make -s ARCH=arm V=1 -j4 bzImage KALLSYMS_EXTRA_PASS=1
arch/arm/kernel/return_address.c:63:2: warning: #warning "TODO:
return_address should use unwind tables" [-Wcpp]
 #warning "TODO: return_address should use unwind tables"
  ^
arch/arm/mm/dma-mapping.c:253:2: warning: #warning ARM Coherent DMA
allocator does not (yet) support huge TLB [-Wcpp]
 #warning ARM Coherent DMA allocator does not (yet) support huge TLB
  ^
drivers/cpufreq/exynos-cpufreq.c:21:22: fatal error: plat/cpu.h: No
such file or directory
 #include <plat/cpu.h>
                      ^
compilation terminated.
make[2]: *** [drivers/cpufreq/exynos-cpufreq.o] Error 1

I'm guessing that <plat/cpu.h> file is supposed to come from
arch/arm/plat-samsung/include/plat/, but I don't see anything that
specifies a -I there.

Thoughts?

josh
