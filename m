From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] EXYNOS: Fix compilation issue introduced during 3.4 merge
Date: Tue, 27 Mar 2012 11:25:48 +0530
Message-ID: <1332827748-18825-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org
Cc: davej@redhat.com, patches@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>

Commit a855039ee4b8 ("ARM: EXYNOS: change the prefix S5P_ to EXYNOS4_ f=
or clock")
modifies some of the macro definitions which are still used in CPUFREQ =
driver.

This fixes similar compilation errors in exynos4210-cpufreq.c.

drivers/cpufreq/exynos4210-cpufreq.c: In function =E2=80=98exynos4210_s=
et_clkdiv=E2=80=99:
drivers/cpufreq/exynos4210-cpufreq.c:124:2: error: =E2=80=98S5P_CLKDIV_=
CPU=E2=80=99 undeclared (first use in this function)

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
This patch is rebased on v3.3.

This patch would be required when next/soc branch on [1] is merged in
mainline kernel. The commit ID given above refers to tree [1].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git

 drivers/cpufreq/exynos4210-cpufreq.c |   71 +++++++++++++++++---------=
--------
 1 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exy=
nos4210-cpufreq.c
index 065da5b..95bb5b1 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -121,25 +121,25 @@ static void exynos4210_set_clkdiv(unsigned int di=
v_index)
=20
 	tmp =3D exynos4210_clkdiv_table[div_index].clkdiv;
=20
-	__raw_writel(tmp, S5P_CLKDIV_CPU);
+	__raw_writel(tmp, EXYNOS4_CLKDIV_CPU);
=20
 	do {
-		tmp =3D __raw_readl(S5P_CLKDIV_STATCPU);
+		tmp =3D __raw_readl(EXYNOS4_CLKDIV_STATCPU);
 	} while (tmp & 0x1111111);
=20
 	/* Change Divider - CPU1 */
=20
-	tmp =3D __raw_readl(S5P_CLKDIV_CPU1);
+	tmp =3D __raw_readl(EXYNOS4_CLKDIV_CPU1);
=20
 	tmp &=3D ~((0x7 << 4) | 0x7);
=20
 	tmp |=3D ((clkdiv_cpu1[div_index][0] << 4) |
 		(clkdiv_cpu1[div_index][1] << 0));
=20
-	__raw_writel(tmp, S5P_CLKDIV_CPU1);
+	__raw_writel(tmp, EXYNOS4_CLKDIV_CPU1);
=20
 	do {
-		tmp =3D __raw_readl(S5P_CLKDIV_STATCPU1);
+		tmp =3D __raw_readl(EXYNOS4_CLKDIV_STATCPU1);
 	} while (tmp & 0x11);
 }
=20
@@ -151,32 +151,32 @@ static void exynos4210_set_apll(unsigned int inde=
x)
 	clk_set_parent(moutcore, mout_mpll);
=20
 	do {
-		tmp =3D (__raw_readl(S5P_CLKMUX_STATCPU)
-			>> S5P_CLKSRC_CPU_MUXCORE_SHIFT);
+		tmp =3D (__raw_readl(EXYNOS4_CLKMUX_STATCPU)
+			>> EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT);
 		tmp &=3D 0x7;
 	} while (tmp !=3D 0x2);
=20
 	/* 2. Set APLL Lock time */
-	__raw_writel(S5P_APLL_LOCKTIME, S5P_APLL_LOCK);
+	__raw_writel(EXYNOS4_APLL_LOCKTIME, EXYNOS4_APLL_LOCK);
=20
 	/* 3. Change PLL PMS values */
-	tmp =3D __raw_readl(S5P_APLL_CON0);
+	tmp =3D __raw_readl(EXYNOS4_APLL_CON0);
 	tmp &=3D ~((0x3ff << 16) | (0x3f << 8) | (0x7 << 0));
 	tmp |=3D exynos4210_apll_pms_table[index];
-	__raw_writel(tmp, S5P_APLL_CON0);
+	__raw_writel(tmp, EXYNOS4_APLL_CON0);
=20
 	/* 4. wait_lock_time */
 	do {
-		tmp =3D __raw_readl(S5P_APLL_CON0);
-	} while (!(tmp & (0x1 << S5P_APLLCON0_LOCKED_SHIFT)));
+		tmp =3D __raw_readl(EXYNOS4_APLL_CON0);
+	} while (!(tmp & (0x1 << EXYNOS4_APLLCON0_LOCKED_SHIFT)));
=20
 	/* 5. MUX_CORE_SEL =3D APLL */
 	clk_set_parent(moutcore, mout_apll);
=20
 	do {
-		tmp =3D __raw_readl(S5P_CLKMUX_STATCPU);
-		tmp &=3D S5P_CLKMUX_STATCPU_MUXCORE_MASK;
-	} while (tmp !=3D (0x1 << S5P_CLKSRC_CPU_MUXCORE_SHIFT));
+		tmp =3D __raw_readl(EXYNOS4_CLKMUX_STATCPU);
+		tmp &=3D EXYNOS4_CLKMUX_STATCPU_MUXCORE_MASK;
+	} while (tmp !=3D (0x1 << EXYNOS4_CLKSRC_CPU_MUXCORE_SHIFT));
 }
=20
 bool exynos4210_pms_change(unsigned int old_index, unsigned int new_in=
dex)
@@ -198,10 +198,10 @@ static void exynos4210_set_frequency(unsigned int=
 old_index,
 			exynos4210_set_clkdiv(new_index);
=20
 			/* 2. Change just s value in apll m,p,s value */
-			tmp =3D __raw_readl(S5P_APLL_CON0);
+			tmp =3D __raw_readl(EXYNOS4_APLL_CON0);
 			tmp &=3D ~(0x7 << 0);
 			tmp |=3D (exynos4210_apll_pms_table[new_index] & 0x7);
-			__raw_writel(tmp, S5P_APLL_CON0);
+			__raw_writel(tmp, EXYNOS4_APLL_CON0);
 		} else {
 			/* Clock Configuration Procedure */
 			/* 1. Change the system clock divider values */
@@ -212,10 +212,10 @@ static void exynos4210_set_frequency(unsigned int=
 old_index,
 	} else if (old_index < new_index) {
 		if (!exynos4210_pms_change(old_index, new_index)) {
 			/* 1. Change just s value in apll m,p,s value */
-			tmp =3D __raw_readl(S5P_APLL_CON0);
+			tmp =3D __raw_readl(EXYNOS4_APLL_CON0);
 			tmp &=3D ~(0x7 << 0);
 			tmp |=3D (exynos4210_apll_pms_table[new_index] & 0x7);
-			__raw_writel(tmp, S5P_APLL_CON0);
+			__raw_writel(tmp, EXYNOS4_APLL_CON0);
=20
 			/* 2. Change the system clock divider values */
 			exynos4210_set_clkdiv(new_index);
@@ -253,24 +253,25 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_in=
fo *info)
 	if (IS_ERR(mout_apll))
 		goto err_mout_apll;
=20
-	tmp =3D __raw_readl(S5P_CLKDIV_CPU);
+	tmp =3D __raw_readl(EXYNOS4_CLKDIV_CPU);
=20
 	for (i =3D L0; i <  CPUFREQ_LEVEL_END; i++) {
-		tmp &=3D ~(S5P_CLKDIV_CPU0_CORE_MASK |
-			S5P_CLKDIV_CPU0_COREM0_MASK |
-			S5P_CLKDIV_CPU0_COREM1_MASK |
-			S5P_CLKDIV_CPU0_PERIPH_MASK |
-			S5P_CLKDIV_CPU0_ATB_MASK |
-			S5P_CLKDIV_CPU0_PCLKDBG_MASK |
-			S5P_CLKDIV_CPU0_APLL_MASK);
-
-		tmp |=3D ((clkdiv_cpu0[i][0] << S5P_CLKDIV_CPU0_CORE_SHIFT) |
-			(clkdiv_cpu0[i][1] << S5P_CLKDIV_CPU0_COREM0_SHIFT) |
-			(clkdiv_cpu0[i][2] << S5P_CLKDIV_CPU0_COREM1_SHIFT) |
-			(clkdiv_cpu0[i][3] << S5P_CLKDIV_CPU0_PERIPH_SHIFT) |
-			(clkdiv_cpu0[i][4] << S5P_CLKDIV_CPU0_ATB_SHIFT) |
-			(clkdiv_cpu0[i][5] << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT) |
-			(clkdiv_cpu0[i][6] << S5P_CLKDIV_CPU0_APLL_SHIFT));
+		tmp &=3D ~(EXYNOS4_CLKDIV_CPU0_CORE_MASK |
+			EXYNOS4_CLKDIV_CPU0_COREM0_MASK |
+			EXYNOS4_CLKDIV_CPU0_COREM1_MASK |
+			EXYNOS4_CLKDIV_CPU0_PERIPH_MASK |
+			EXYNOS4_CLKDIV_CPU0_ATB_MASK |
+			EXYNOS4_CLKDIV_CPU0_PCLKDBG_MASK |
+			EXYNOS4_CLKDIV_CPU0_APLL_MASK);
+
+		tmp |=3D
+		((clkdiv_cpu0[i][0] << EXYNOS4_CLKDIV_CPU0_CORE_SHIFT) |
+		(clkdiv_cpu0[i][1] << EXYNOS4_CLKDIV_CPU0_COREM0_SHIFT) |
+		(clkdiv_cpu0[i][2] << EXYNOS4_CLKDIV_CPU0_COREM1_SHIFT) |
+		(clkdiv_cpu0[i][3] << EXYNOS4_CLKDIV_CPU0_PERIPH_SHIFT) |
+		(clkdiv_cpu0[i][4] << EXYNOS4_CLKDIV_CPU0_ATB_SHIFT) |
+		(clkdiv_cpu0[i][5] << EXYNOS4_CLKDIV_CPU0_PCLKDBG_SHIFT) |
+		(clkdiv_cpu0[i][6] << EXYNOS4_CLKDIV_CPU0_APLL_SHIFT));
=20
 		exynos4210_clkdiv_table[i].clkdiv =3D tmp;
 	}
--=20
1.7.4.1

