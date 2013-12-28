From: Mateusz Krawczuk <mat.krawczuk@gmail.com>
Subject: [PATCH v5 Resend 0/3] ARM: S5PV210: move to common clk framework
Date: Sat, 28 Dec 2013 18:09:13 +0100
Message-ID: <1388250556-4594-1-git-send-email-mat.krawczuk@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=IaV8qfvxS5Wy8SToAEtO51mvj6RF8qAg2EgPUwGgUk4=;
        b=aEUFNwfevsjmu0EnetAkMV1c26BRGQX70EzFPOcsc0NY9fwvrTFTEQB8pJN5cPXu6T
         Eye0S8XGCuaKrowR42+ohi/CaSN4u7Nea6+69dbJaHekc9aqHjBVL6qVMQokNERAgYCA
         lNY//LlvfmRmTrHuwY7SED/ydRF/v/LcaLnv3HGJgrF/js5z+24mHaBzo+m4xed2NuoN
         AT+fi1fB+VvjcwmJ3b7C6WMXroSLyYDCOWAdNTsG7Cl9Kg5Mi4cJPEPSz5BEBcE//wJv
         Dntpaz2m2fMIt+ttxQzxrB/n1ge96GW5UZYK5wRsg6/Nusf1i9IxSsHrCVlvUIKGLmIz
         MH1w==
Sender: linux-doc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, mturquette@linaro.org, tomasz.figa@gmail.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, m.szyprowski@samsung.com, padma.v@samsung.com, chander.kashyap@linaro.org, t.dakhran@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

This patch series is the new s5pv210 clock implementation
(using common clk framework).

This implementation is compatible with device tree definition and board
files.

This patch series is based on linux-next and has been tested on goni and
aquila boards using board file.

Since v4:
Corrected mux flags for finpll.

Since v3:

Replace s5pv210_clk_register_finpll, by creating mux finpll
with xusbxti and xxti as parrents.

Mateusz Krawczuk (3):
  clk: samsung: Add clock driver for s5pc110/s5pv210
  Cpufreq: s5pv210 cpufreq fixes for CCF
  ARM: s5pv210: Migrate clock handling to Common Clock Framework

 .../bindings/clock/samsung,s5pv210-clock.txt       |  75 +++
 arch/arm/mach-s5pv210/Kconfig                      |   9 +
 arch/arm/mach-s5pv210/Makefile                     |   4 +-
 arch/arm/mach-s5pv210/common.c                     |  17 +
 arch/arm/mach-s5pv210/common.h                     |  10 +
 arch/arm/mach-s5pv210/mach-goni.c                  |   2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   2 +-
 arch/arm/plat-samsung/Kconfig                      |   2 +-
 drivers/clk/samsung/Makefile                       |   3 +
 drivers/clk/samsung/clk-s5pv210.c                  | 673 +++++++++++++++++++++
 drivers/cpufreq/s5pv210-cpufreq.c                  |   6 +-
 include/dt-bindings/clock/samsung,s5pv210-clock.h  | 224 +++++++
 12 files changed, 1019 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
 create mode 100644 drivers/clk/samsung/clk-s5pv210.c
 create mode 100644 include/dt-bindings/clock/samsung,s5pv210-clock.h

-- 
1.8.3.3

