From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH] [CPUFREQ] EXYNOS: bugfix on retrieving old_index from freqs.old
Date: Tue, 10 Apr 2012 15:35:39 +0530
Message-ID: <CAG17yqRq5+vQZngEwNjbANjhGPr68Hy8frwRSzRZH31juk=ahA@mail.gmail.com>
References: <1333535036-24409-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1333535036-24409-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, Jaecheol Lee <jc.lee@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, kyungmin.park@samsung.com, cw00.choi@samsung.com, myungjoo.ham@gmail.com, linux-kernel@vger.kernel.org

Hi MyungJoo,

On 4 April 2012 15:53, MyungJoo Ham <myungjoo.ham@samsung.com> wrote:
> The policy might have been changed since last call of target().
> Thus, using cpufreq_frequency_table_target(), which depends on
> policy to find the correspoding index from a frequency, may return
> inconsistent index for freqs.old. Thus, old_index should be
> calculated not based on the current policy.
>
> We have been observing such issue when scaling_min/max_freq were
> updated and sometimes caused system lockups due to incorrectly
> configured voltages.
>
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> ---
> =A0drivers/cpufreq/exynos-cpufreq.c | =A0 13 +++++++++++--
> =A01 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exyno=
s-cpufreq.c
> index b243a7e..1577522 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -62,8 +62,17 @@ static int exynos_target(struct cpufreq_policy *po=
licy,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (cpufreq_frequency_table_target(policy, freq_table,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0freqs.old, relation, &old_index)) {
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* The policy may have been changed so that we cannot=
 get proper
> + =A0 =A0 =A0 =A0* old_index with cpufreq_frequency_table_target(). T=
hus, ignore
> + =A0 =A0 =A0 =A0* policy and get the index from the raw frequency ta=
ble.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 for (old_index =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0freq_table[old_index].frequency !=3D CPUFREQ=
_TABLE_END;
> + =A0 =A0 =A0 =A0 =A0 =A0old_index++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (freq_table[old_index].frequency =3D=
=3D freqs.old)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 if (freq_table[old_index].frequency =3D=3D CPUFREQ_TABL=
E_END) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}

I also had the same issue and same fix while testing powertop 1.98 as
it changes the scaling_min/max_freq.

The only concern I have is when this code gets called for the very
first time, the freqs.old will be the freq set by bootloader. Now if
bootloader sets a freq which is not in the freq_table (not sure if its
practical but theoretically its possible ), this code will error out.


> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

Thanks,
Inder
