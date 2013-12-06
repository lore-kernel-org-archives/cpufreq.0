From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 0/3] Exynos5420 Cpufreq support
Date: Fri,  6 Dec 2013 15:18:01 +0530
Message-ID: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4WMr3lzYE1Fq1P1i6H299ePAx7tBFqo9u9CQmrbTFt8=;
        b=dmKFtDwSVFECAsmlDV6JPBXWPMT2j4WiKKF/BsL9HSaHklNrOEt8BOG25+oABt2lnH
         EbM5sO9aRK9LeIw3J3x9PUvywYSYTFfA3RNO0YsaQ79C3JUVSZsnmI7IiA+1d8ZvZeoT
         dpbp6zMPipa6ud4jV421/pHjUUmiNhGwFTc1jGmdaFKu+mqAZpGYyq2PQfjaZ/ON+Rzt
         f2sOugptXlAvFiEvyS0HgUvs6M61Fll9aqxwRXd7TAbR3bSm6Czh8Kn8avwQbOM7HYqe
         GMpYbIjszQgy1X5uVO2YvQvJUeGpr1C6y4xEy4fJOHd+P0o+i1y7qVmxchyc3VFlz4g4
         HpWg==
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, tomasz.figa@gmail.com, arjun.kv@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

The patch series adds the cpufreq driver for exynos5420 with
its dependencies. This initial version of the driver only
modifies the A15 core frequencies.

Arjun.K.V (1):
  cpufreq: exynos: Add exynos5420 cpufreq driver

Arun Kumar K (2):
  ARM: EXYNOS: Add exynos5 CPU clock divider offsets
  clk: exynos5420: Add alias names for cpu clocks

 arch/arm/mach-exynos/include/mach/regs-clock.h |   24 ++
 drivers/clk/samsung/clk-exynos5420.c           |    9 +-
 drivers/cpufreq/Kconfig.arm                    |   11 +
 drivers/cpufreq/Makefile                       |    1 +
 drivers/cpufreq/exynos-cpufreq.c               |    2 +
 drivers/cpufreq/exynos-cpufreq.h               |    8 +
 drivers/cpufreq/exynos5420-cpufreq.c           |  346 ++++++++++++++++++++++++
 7 files changed, 397 insertions(+), 4 deletions(-)
 create mode 100644 drivers/cpufreq/exynos5420-cpufreq.c

-- 
1.7.9.5
