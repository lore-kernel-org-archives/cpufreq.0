From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/5] CPUFREQ/S3C64xx: Move S3C64xx CPUfreq driver into drivers/cpufreq
Date: Wed, 1 Jun 2011 18:55:05 +0900
Message-ID: <BANLkTinR_WLjsgm5ogt_BbJwPFC0Kc1Dqg@mail.gmail.com>
References: <20110601094313.GA23122@opensource.wolfsonmicro.com>
	<1306921493-30911-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=l4yOrR0LI6hm/PLQ5zpls4T1LlpPsW5IlMiVh0My23E=;
        b=reETYztsmQ0DtkhR1QlV/pujfZNLuklraN9YR4HpImuHhXVt6e6HXg4/7P2W7zZlPf
         /mu4MdkxJySEg8w7k8ImLx3lHZ1w9TjNBuKnwXaLcDehbreBtrXggQyeL1F+YUEWc6yy
         +kVja5q941MI6bQRZ4Pp9273IH4YUz9QWeLa0=
In-Reply-To: <1306921493-30911-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

Hi Mark,

Instead of samsung tree, it should be handled at cpufreq tree.
CCed the cpufreq maintainer.

Thank you,
Kyungmin Park

On Wed, Jun 1, 2011 at 6:44 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> This is a straight code motion patch, there are no changes to the dri=
ver
> itself. The Kconfig is left untouched as the ARM CPUfreq Kconfig is a=
ll
> in one big block in arm/Kconfig and should be moved en masse rather t=
han
> being done piecemeal.
>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> =A0arch/arm/mach-s3c64xx/Makefile =A0| =A0 =A04 -
> =A0arch/arm/mach-s3c64xx/cpufreq.c | =A0270 -------------------------=
--------------
> =A0drivers/cpufreq/Makefile =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0drivers/cpufreq/s3c64xx.c =A0 =A0 =A0 | =A0269 +++++++++++++++++++=
+++++++++++++++++++
> =A04 files changed, 270 insertions(+), 274 deletions(-)
> =A0delete mode 100644 arch/arm/mach-s3c64xx/cpufreq.c
> =A0create mode 100644 drivers/cpufreq/s3c64xx.c
>
> diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/M=
akefile
> index 4657363..f5a7144 100644
> --- a/arch/arm/mach-s3c64xx/Makefile
> +++ b/arch/arm/mach-s3c64xx/Makefile
> @@ -23,10 +23,6 @@ obj-$(CONFIG_CPU_S3C6410) =A0 =A0+=3D s3c6410.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D irq.=
o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D irq-=
eint.o
>
> -# CPU frequency scaling
> -
> -obj-$(CONFIG_CPU_FREQ_S3C64XX) =A0+=3D cpufreq.o
> -
> =A0# DMA support
>
> =A0obj-$(CONFIG_S3C64XX_DMA) =A0 =A0 =A0+=3D dma.o
> diff --git a/arch/arm/mach-s3c64xx/cpufreq.c b/arch/arm/mach-s3c64xx/=
cpufreq.c
> deleted file mode 100644
> index 4375b97..0000000
> --- a/arch/arm/mach-s3c64xx/cpufreq.c
> +++ /dev/null
> @@ -1,270 +0,0 @@
> -/* linux/arch/arm/plat-s3c64xx/cpufreq.c
> - *
> - * Copyright 2009 Wolfson Microelectronics plc
> - *
> - * S3C64xx CPUfreq Support
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> -#include <linux/init.h>
> -#include <linux/cpufreq.h>
> -#include <linux/clk.h>
> -#include <linux/err.h>
> -#include <linux/regulator/consumer.h>
> -
> -static struct clk *armclk;
> -static struct regulator *vddarm;
> -static unsigned long regulator_latency;
> -
> -#ifdef CONFIG_CPU_S3C6410
> -struct s3c64xx_dvfs {
> - =A0 =A0 =A0 unsigned int vddarm_min;
> - =A0 =A0 =A0 unsigned int vddarm_max;
> -};
> -
> -static struct s3c64xx_dvfs s3c64xx_dvfs_table[] =3D {
> - =A0 =A0 =A0 [0] =3D { 1000000, 1150000 },
> - =A0 =A0 =A0 [1] =3D { 1050000, 1150000 },
> - =A0 =A0 =A0 [2] =3D { 1100000, 1150000 },
> - =A0 =A0 =A0 [3] =3D { 1200000, 1350000 },
> -};
> -
> -static struct cpufreq_frequency_table s3c64xx_freq_table[] =3D {
> - =A0 =A0 =A0 { 0, =A066000 },
> - =A0 =A0 =A0 { 0, 133000 },
> - =A0 =A0 =A0 { 1, 222000 },
> - =A0 =A0 =A0 { 1, 266000 },
> - =A0 =A0 =A0 { 2, 333000 },
> - =A0 =A0 =A0 { 2, 400000 },
> - =A0 =A0 =A0 { 2, 532000 },
> - =A0 =A0 =A0 { 2, 533000 },
> - =A0 =A0 =A0 { 3, 667000 },
> - =A0 =A0 =A0 { 0, CPUFREQ_TABLE_END },
> -};
> -#endif
> -
> -static int s3c64xx_cpufreq_verify_speed(struct cpufreq_policy *polic=
y)
> -{
> - =A0 =A0 =A0 if (policy->cpu !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> -
> - =A0 =A0 =A0 return cpufreq_frequency_table_verify(policy, s3c64xx_f=
req_table);
> -}
> -
> -static unsigned int s3c64xx_cpufreq_get_speed(unsigned int cpu)
> -{
> - =A0 =A0 =A0 if (cpu !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> -
> - =A0 =A0 =A0 return clk_get_rate(armclk) / 1000;
> -}
> -
> -static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned int target_freq,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned int relation)
> -{
> - =A0 =A0 =A0 int ret;
> - =A0 =A0 =A0 unsigned int i;
> - =A0 =A0 =A0 struct cpufreq_freqs freqs;
> - =A0 =A0 =A0 struct s3c64xx_dvfs *dvfs;
> -
> - =A0 =A0 =A0 ret =3D cpufreq_frequency_table_target(policy, s3c64xx_=
freq_table,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0target_freq, relation, &i);
> - =A0 =A0 =A0 if (ret !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> -
> - =A0 =A0 =A0 freqs.cpu =3D 0;
> - =A0 =A0 =A0 freqs.old =3D clk_get_rate(armclk) / 1000;
> - =A0 =A0 =A0 freqs.new =3D s3c64xx_freq_table[i].frequency;
> - =A0 =A0 =A0 freqs.flags =3D 0;
> - =A0 =A0 =A0 dvfs =3D &s3c64xx_dvfs_table[s3c64xx_freq_table[i].inde=
x];
> -
> - =A0 =A0 =A0 if (freqs.old =3D=3D freqs.new)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> -
> - =A0 =A0 =A0 pr_debug("cpufreq: Transition %d-%dkHz\n", freqs.old, f=
reqs.new);
> -
> - =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
> -
> -#ifdef CONFIG_REGULATOR
> - =A0 =A0 =A0 if (vddarm && freqs.new > freqs.old) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D regulator_set_voltage(vddarm,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_min,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_max);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed=
 to set VDDARM for %dkHz: %d\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs.ne=
w, ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -#endif
> -
> - =A0 =A0 =A0 ret =3D clk_set_rate(armclk, freqs.new * 1000);
> - =A0 =A0 =A0 if (ret < 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed to set rate %dk=
Hz: %d\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs.new, ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> - =A0 =A0 =A0 }
> -
> -#ifdef CONFIG_REGULATOR
> - =A0 =A0 =A0 if (vddarm && freqs.new < freqs.old) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D regulator_set_voltage(vddarm,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_min,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_max);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed=
 to set VDDARM for %dkHz: %d\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs.ne=
w, ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -#endif
> -
> - =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> -
> - =A0 =A0 =A0 pr_debug("cpufreq: Set actual frequency %lukHz\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk_get_rate(armclk) / 1000);
> -
> - =A0 =A0 =A0 return 0;
> -
> -err_clk:
> - =A0 =A0 =A0 if (clk_set_rate(armclk, freqs.old * 1000) < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Failed to restore original cloc=
k rate\n");
> -err:
> - =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -
> -#ifdef CONFIG_REGULATOR
> -static void __init s3c64xx_cpufreq_config_regulator(void)
> -{
> - =A0 =A0 =A0 int count, v, i, found;
> - =A0 =A0 =A0 struct cpufreq_frequency_table *freq;
> - =A0 =A0 =A0 struct s3c64xx_dvfs *dvfs;
> -
> - =A0 =A0 =A0 count =3D regulator_count_voltages(vddarm);
> - =A0 =A0 =A0 if (count < 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Unable to check suppor=
ted voltages\n");
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 freq =3D s3c64xx_freq_table;
> - =A0 =A0 =A0 while (count > 0 && freq->frequency !=3D CPUFREQ_TABLE_=
END) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (freq->frequency =3D=3D CPUFREQ_ENTR=
Y_INVALID)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dvfs =3D &s3c64xx_dvfs_table[freq->inde=
x];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 0;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < count; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 v =3D regulator_list_vo=
ltage(vddarm, i);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (v >=3D dvfs->vddarm=
_min && v <=3D dvfs->vddarm_max)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D=
 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!found) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("cpufreq: %dkH=
z unsupported by regulator\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freq=
->frequency);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq->frequency =3D CPU=
=46REQ_ENTRY_INVALID;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq++;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Guess based on having to do an I2C/SPI write; in fut=
ure we
> - =A0 =A0 =A0 =A0* will be able to query the regulator performance he=
re. */
> - =A0 =A0 =A0 regulator_latency =3D 1 * 1000 * 1000;
> -}
> -#endif
> -
> -static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy=
)
> -{
> - =A0 =A0 =A0 int ret;
> - =A0 =A0 =A0 struct cpufreq_frequency_table *freq;
> -
> - =A0 =A0 =A0 if (policy->cpu !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> -
> - =A0 =A0 =A0 if (s3c64xx_freq_table =3D=3D NULL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: No frequency informati=
on for this CPU\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 armclk =3D clk_get(NULL, "armclk");
> - =A0 =A0 =A0 if (IS_ERR(armclk)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Unable to obtain ARMCL=
K: %ld\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PTR_ERR(armclk));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(armclk);
> - =A0 =A0 =A0 }
> -
> -#ifdef CONFIG_REGULATOR
> - =A0 =A0 =A0 vddarm =3D regulator_get(NULL, "vddarm");
> - =A0 =A0 =A0 if (IS_ERR(vddarm)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(vddarm);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed to obtain VDDAR=
M: %d\n", ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Only frequency scaling=
 available\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 vddarm =3D NULL;
> - =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c64xx_cpufreq_config_regulator();
> - =A0 =A0 =A0 }
> -#endif
> -
> - =A0 =A0 =A0 freq =3D s3c64xx_freq_table;
> - =A0 =A0 =A0 while (freq->frequency !=3D CPUFREQ_TABLE_END) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long r;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Check for frequencies we can generat=
e */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D clk_round_rate(armclk, freq->freq=
uency * 1000);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 r /=3D 1000;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r !=3D freq->frequency) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("cpufreq: %dkH=
z unsupported by clock\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freq=
->frequency);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq->frequency =3D CPU=
=46REQ_ENTRY_INVALID;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If we have no regulator then assume =
startup
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* frequency is the maximum we can su=
pport. */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!vddarm && freq->frequency > s3c64x=
x_cpufreq_get_speed(0))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq->frequency =3D CPU=
=46REQ_ENTRY_INVALID;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq++;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 policy->cur =3D clk_get_rate(armclk) / 1000;
> -
> - =A0 =A0 =A0 /* Datasheet says PLL stabalisation time (if we were to=
 use
> - =A0 =A0 =A0 =A0* the PLLs, which we don't currently) is ~300us wors=
t case,
> - =A0 =A0 =A0 =A0* but add some fudge.
> - =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 policy->cpuinfo.transition_latency =3D (500 * 1000) + r=
egulator_latency;
> -
> - =A0 =A0 =A0 ret =3D cpufreq_frequency_table_cpuinfo(policy, s3c64xx=
_freq_table);
> - =A0 =A0 =A0 if (ret !=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed to configure fr=
equency table: %d\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator_put(vddarm);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(armclk);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return ret;
> -}
> -
> -static struct cpufreq_driver s3c64xx_cpufreq_driver =3D {
> - =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> - =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> - =A0 =A0 =A0 .verify =A0 =A0 =A0 =A0 =3D s3c64xx_cpufreq_verify_spee=
d,
> - =A0 =A0 =A0 .target =A0 =A0 =A0 =A0 =3D s3c64xx_cpufreq_set_target,
> - =A0 =A0 =A0 .get =A0 =A0 =A0 =A0 =A0 =A0=3D s3c64xx_cpufreq_get_spe=
ed,
> - =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D s3c64xx_cpufreq_driver_in=
it,
> - =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c",
> -};
> -
> -static int __init s3c64xx_cpufreq_init(void)
> -{
> - =A0 =A0 =A0 return cpufreq_register_driver(&s3c64xx_cpufreq_driver)=
;
> -}
> -module_init(s3c64xx_cpufreq_init);
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index e2fc2d2..0031e04 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -40,4 +40,5 @@ obj-$(CONFIG_X86_CPUFREQ_NFORCE2) =A0 =A0 +=3D cpuf=
req-nforce2.o
> =A0##################################################################=
################d
>
> =A0# ARM SoC drivers
> +obj-$(CONFIG_CPU_FREQ_S3C64XX) =A0 =A0 =A0 =A0 +=3D s3c64xx.o
> =A0obj-$(CONFIG_UX500_SOC_DB8500) =A0 =A0 =A0 =A0 +=3D db8500-cpufreq=
=2Eo
> diff --git a/drivers/cpufreq/s3c64xx.c b/drivers/cpufreq/s3c64xx.c
> new file mode 100644
> index 0000000..fc3f180
> --- /dev/null
> +++ b/drivers/cpufreq/s3c64xx.c
> @@ -0,0 +1,269 @@
> +/*
> + * Copyright 2009 Wolfson Microelectronics plc
> + *
> + * S3C64xx CPUfreq Support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/init.h>
> +#include <linux/cpufreq.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/regulator/consumer.h>
> +
> +static struct clk *armclk;
> +static struct regulator *vddarm;
> +static unsigned long regulator_latency;
> +
> +#ifdef CONFIG_CPU_S3C6410
> +struct s3c64xx_dvfs {
> + =A0 =A0 =A0 unsigned int vddarm_min;
> + =A0 =A0 =A0 unsigned int vddarm_max;
> +};
> +
> +static struct s3c64xx_dvfs s3c64xx_dvfs_table[] =3D {
> + =A0 =A0 =A0 [0] =3D { 1000000, 1150000 },
> + =A0 =A0 =A0 [1] =3D { 1050000, 1150000 },
> + =A0 =A0 =A0 [2] =3D { 1100000, 1150000 },
> + =A0 =A0 =A0 [3] =3D { 1200000, 1350000 },
> +};
> +
> +static struct cpufreq_frequency_table s3c64xx_freq_table[] =3D {
> + =A0 =A0 =A0 { 0, =A066000 },
> + =A0 =A0 =A0 { 0, 133000 },
> + =A0 =A0 =A0 { 1, 222000 },
> + =A0 =A0 =A0 { 1, 266000 },
> + =A0 =A0 =A0 { 2, 333000 },
> + =A0 =A0 =A0 { 2, 400000 },
> + =A0 =A0 =A0 { 2, 532000 },
> + =A0 =A0 =A0 { 2, 533000 },
> + =A0 =A0 =A0 { 3, 667000 },
> + =A0 =A0 =A0 { 0, CPUFREQ_TABLE_END },
> +};
> +#endif
> +
> +static int s3c64xx_cpufreq_verify_speed(struct cpufreq_policy *polic=
y)
> +{
> + =A0 =A0 =A0 if (policy->cpu !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 return cpufreq_frequency_table_verify(policy, s3c64xx_f=
req_table);
> +}
> +
> +static unsigned int s3c64xx_cpufreq_get_speed(unsigned int cpu)
> +{
> + =A0 =A0 =A0 if (cpu !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 return clk_get_rate(armclk) / 1000;
> +}
> +
> +static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned int target_freq,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned int relation)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 unsigned int i;
> + =A0 =A0 =A0 struct cpufreq_freqs freqs;
> + =A0 =A0 =A0 struct s3c64xx_dvfs *dvfs;
> +
> + =A0 =A0 =A0 ret =3D cpufreq_frequency_table_target(policy, s3c64xx_=
freq_table,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0target_freq, relation, &i);
> + =A0 =A0 =A0 if (ret !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 freqs.cpu =3D 0;
> + =A0 =A0 =A0 freqs.old =3D clk_get_rate(armclk) / 1000;
> + =A0 =A0 =A0 freqs.new =3D s3c64xx_freq_table[i].frequency;
> + =A0 =A0 =A0 freqs.flags =3D 0;
> + =A0 =A0 =A0 dvfs =3D &s3c64xx_dvfs_table[s3c64xx_freq_table[i].inde=
x];
> +
> + =A0 =A0 =A0 if (freqs.old =3D=3D freqs.new)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 pr_debug("cpufreq: Transition %d-%dkHz\n", freqs.old, f=
reqs.new);
> +
> + =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
> +
> +#ifdef CONFIG_REGULATOR
> + =A0 =A0 =A0 if (vddarm && freqs.new > freqs.old) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D regulator_set_voltage(vddarm,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_min,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_max);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed=
 to set VDDARM for %dkHz: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs.ne=
w, ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +#endif
> +
> + =A0 =A0 =A0 ret =3D clk_set_rate(armclk, freqs.new * 1000);
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed to set rate %dk=
Hz: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs.new, ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 }
> +
> +#ifdef CONFIG_REGULATOR
> + =A0 =A0 =A0 if (vddarm && freqs.new < freqs.old) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D regulator_set_voltage(vddarm,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_min,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 dvfs->vddarm_max);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret !=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed=
 to set VDDARM for %dkHz: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs.ne=
w, ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +#endif
> +
> + =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> +
> + =A0 =A0 =A0 pr_debug("cpufreq: Set actual frequency %lukHz\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk_get_rate(armclk) / 1000);
> +
> + =A0 =A0 =A0 return 0;
> +
> +err_clk:
> + =A0 =A0 =A0 if (clk_set_rate(armclk, freqs.old * 1000) < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Failed to restore original cloc=
k rate\n");
> +err:
> + =A0 =A0 =A0 cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +#ifdef CONFIG_REGULATOR
> +static void __init s3c64xx_cpufreq_config_regulator(void)
> +{
> + =A0 =A0 =A0 int count, v, i, found;
> + =A0 =A0 =A0 struct cpufreq_frequency_table *freq;
> + =A0 =A0 =A0 struct s3c64xx_dvfs *dvfs;
> +
> + =A0 =A0 =A0 count =3D regulator_count_voltages(vddarm);
> + =A0 =A0 =A0 if (count < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Unable to check suppor=
ted voltages\n");
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 freq =3D s3c64xx_freq_table;
> + =A0 =A0 =A0 while (count > 0 && freq->frequency !=3D CPUFREQ_TABLE_=
END) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (freq->frequency =3D=3D CPUFREQ_ENTR=
Y_INVALID)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dvfs =3D &s3c64xx_dvfs_table[freq->inde=
x];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < count; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 v =3D regulator_list_vo=
ltage(vddarm, i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (v >=3D dvfs->vddarm=
_min && v <=3D dvfs->vddarm_max)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D=
 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!found) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("cpufreq: %dkH=
z unsupported by regulator\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freq=
->frequency);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq->frequency =3D CPU=
=46REQ_ENTRY_INVALID;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq++;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Guess based on having to do an I2C/SPI write; in fut=
ure we
> + =A0 =A0 =A0 =A0* will be able to query the regulator performance he=
re. */
> + =A0 =A0 =A0 regulator_latency =3D 1 * 1000 * 1000;
> +}
> +#endif
> +
> +static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy=
)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 struct cpufreq_frequency_table *freq;
> +
> + =A0 =A0 =A0 if (policy->cpu !=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 if (s3c64xx_freq_table =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: No frequency informati=
on for this CPU\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 armclk =3D clk_get(NULL, "armclk");
> + =A0 =A0 =A0 if (IS_ERR(armclk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Unable to obtain ARMCL=
K: %ld\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PTR_ERR(armclk));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(armclk);
> + =A0 =A0 =A0 }
> +
> +#ifdef CONFIG_REGULATOR
> + =A0 =A0 =A0 vddarm =3D regulator_get(NULL, "vddarm");
> + =A0 =A0 =A0 if (IS_ERR(vddarm)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(vddarm);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed to obtain VDDAR=
M: %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Only frequency scaling=
 available\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 vddarm =3D NULL;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c64xx_cpufreq_config_regulator();
> + =A0 =A0 =A0 }
> +#endif
> +
> + =A0 =A0 =A0 freq =3D s3c64xx_freq_table;
> + =A0 =A0 =A0 while (freq->frequency !=3D CPUFREQ_TABLE_END) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long r;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Check for frequencies we can generat=
e */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r =3D clk_round_rate(armclk, freq->freq=
uency * 1000);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r /=3D 1000;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r !=3D freq->frequency) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("cpufreq: %dkH=
z unsupported by clock\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freq=
->frequency);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq->frequency =3D CPU=
=46REQ_ENTRY_INVALID;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If we have no regulator then assume =
startup
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* frequency is the maximum we can su=
pport. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!vddarm && freq->frequency > s3c64x=
x_cpufreq_get_speed(0))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq->frequency =3D CPU=
=46REQ_ENTRY_INVALID;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq++;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 policy->cur =3D clk_get_rate(armclk) / 1000;
> +
> + =A0 =A0 =A0 /* Datasheet says PLL stabalisation time (if we were to=
 use
> + =A0 =A0 =A0 =A0* the PLLs, which we don't currently) is ~300us wors=
t case,
> + =A0 =A0 =A0 =A0* but add some fudge.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 policy->cpuinfo.transition_latency =3D (500 * 1000) + r=
egulator_latency;
> +
> + =A0 =A0 =A0 ret =3D cpufreq_frequency_table_cpuinfo(policy, s3c64xx=
_freq_table);
> + =A0 =A0 =A0 if (ret !=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("cpufreq: Failed to configure fr=
equency table: %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regulator_put(vddarm);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(armclk);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static struct cpufreq_driver s3c64xx_cpufreq_driver =3D {
> + =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
> + =A0 =A0 =A0 .verify =A0 =A0 =A0 =A0 =3D s3c64xx_cpufreq_verify_spee=
d,
> + =A0 =A0 =A0 .target =A0 =A0 =A0 =A0 =3D s3c64xx_cpufreq_set_target,
> + =A0 =A0 =A0 .get =A0 =A0 =A0 =A0 =A0 =A0=3D s3c64xx_cpufreq_get_spe=
ed,
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D s3c64xx_cpufreq_driver_in=
it,
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c",
> +};
> +
> +static int __init s3c64xx_cpufreq_init(void)
> +{
> + =A0 =A0 =A0 return cpufreq_register_driver(&s3c64xx_cpufreq_driver)=
;
> +}
> +module_init(s3c64xx_cpufreq_init);
> --
> 1.7.5.3
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
