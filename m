From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v6 0/6] cpufreq: use generic cpufreq drivers for exynos platforms
Date: Tue, 17 Jun 2014 20:55:27 +0530
Message-ID: <1403018733-4187-2-git-send-email-thomas.ab@samsung.com>
References: <1403018733-4187-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VrmSAh6IEq6VkLzFwCjqb4/2kK5WyrPBeGNSe+80wrk=;
        b=rz1hl2Y8qRL8qPTbdPrqxQtNOPA1flsiuIENUpnjA/QBvd4uYlHYr1u/OBEsbezUUS
         F/YRF8K9pwesz9cyezuoZIwXGvO2RydBZNhJAJrHgW0IfGdHqEkyjgZ9R2L19RZLA0ry
         1RAiZF4NUF5BmeX6iOGL0F2xLIZ9rGVMwKDMs2DAtgY8s8M7/Ori4iiA2e3T5u6YvzdP
         KSKmK9cbtrGyxisPOWko2zLcvjcFcSytU0fVZVO1r/Cttfw6EkgiW/EBA6PL91vy6JTw
         8gW0VFlfPAZKUSsUuqYCDBoBnKZ3oqU3GlETAk5ySCjguYGvITwmKVbNNaOGX9Hj6ilM
         mAZA==
In-Reply-To: <1403018733-4187-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de, cw00.choi@samsung.com

Changes since v5:
- Configuration data for cpu clock block is embedded with the code. The cpu clock
  logic can later to extended to obtain this data from DT.
- Excluded the support for Exynos4x12 SoC since the work on boost OPP bindings is
  still incomplete.
- Included cpufreq support for Exynos5420 SoC.
- Many other minor changes (and so dropped Ack's for some of the patches in v5)

This patch series removes the use of Exynos4210 and Exynos5250 specific cpufreq
drivers and enables the use of cpufreq-cpu0 driver for these platforms. This
series also enabled cpufreq support for Exynos5420 using arm_big_little cpufreq
driver.

Thomas Abraham (6):
  clk: samsung: add infrastructure to register cpu clocks
  clk: samsung: register exynos5420 apll/kpll configuration data
  clk: exynos: use cpu-clock provider type to represent arm clock
  ARM: dts: Exynos: add cpu nodes, opp and cpu clock configuration data
  ARM: Exynos: switch to using generic cpufreq driver for exynos4210/5250
  cpufreq: exynos: remove exynos4210/5250 specific cpufreq driver support

 arch/arm/boot/dts/exynos4210-origen.dts         |    6 +
 arch/arm/boot/dts/exynos4210-trats.dts          |    6 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts |    6 +
 arch/arm/boot/dts/exynos4210.dtsi               |   27 ++
 arch/arm/boot/dts/exynos5250-arndale.dts        |    6 +
 arch/arm/boot/dts/exynos5250-cros-common.dtsi   |    6 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts       |    6 +
 arch/arm/boot/dts/exynos5250.dtsi               |   23 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts       |    6 +
 arch/arm/boot/dts/exynos5420.dtsi               |   32 ++
 arch/arm/mach-exynos/exynos.c                   |   15 +-
 drivers/clk/samsung/Makefile                    |    2 +-
 drivers/clk/samsung/clk-cpu.c                   |  577 +++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos4.c               |   25 +-
 drivers/clk/samsung/clk-exynos5250.c            |   16 +-
 drivers/clk/samsung/clk-exynos5420.c            |   59 ++-
 drivers/clk/samsung/clk.h                       |    5 +
 drivers/cpufreq/Kconfig.arm                     |   22 -
 drivers/cpufreq/Makefile                        |    2 -
 drivers/cpufreq/exynos4210-cpufreq.c            |  184 --------
 drivers/cpufreq/exynos5250-cpufreq.c            |  210 ---------
 include/dt-bindings/clock/exynos5250.h          |    1 +
 include/dt-bindings/clock/exynos5420.h          |    2 +
 23 files changed, 802 insertions(+), 442 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-cpu.c
 delete mode 100644 drivers/cpufreq/exynos4210-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos5250-cpufreq.c

-- 
1.7.9.5
