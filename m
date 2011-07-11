From: =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Subject: Re: [RFC][PATCH] cpufreq: e_powersaver: Fix checking brand for
 EPS_BRAND_C3
Date: Mon, 11 Jul 2011 17:36:46 +0100
Message-ID: <4E1B269E.2060408@interia.pl>
References: <1310114243.2940.3.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1310114243.2940.3.camel@phoenix>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org


> Do not return -ENODEV for EPS_BRAND_C3.
>
> Signed-off-by: Axel Lin<axel.lin@gmail.com>
> ---
> I just found the code is suspect.
> I don't have this hardware handy.
> Anyone can help to confirm and test if this patch works?
> Axel
>
>   drivers/cpufreq/e_powersaver.c |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_power=
saver.c
> index 35a257d..637f055 100644
> --- a/drivers/cpufreq/e_powersaver.c
> +++ b/drivers/cpufreq/e_powersaver.c
> @@ -199,8 +199,9 @@ static int eps_cpu_init(struct cpufreq_policy *po=
licy)
>   		break;
>   	case EPS_BRAND_C3:
>   		printk(KERN_CONT "C3\n");
> -		return -ENODEV;
>   		break;
> +	default:
> +		return -ENODEV;
>   	}
>   	/* Enable Enhanced PowerSaver */
>   	rdmsrl(MSR_IA32_MISC_ENABLE, val);
EPS_BRAND_C3 isn't handled by this driver. So you have to return -ENODE=
V=20
for it. Why this code is suspect?
If you looking for an error it is probably in:
 > rdmsr(0x1154, lo, hi);
 > brand =3D (((lo >> 4) ^ (lo >> 2))) & 0x000000ff;
which was added later to this driver. Probably & 0xff should be replace=
d=20
by & 3.

Best regards
Rafa=C5=82 Bilski


----------------------------------------------------------------
Najwieksza baza samochodow nowych i uzywanych
Sprawdz >> http://linkint.pl/f29e3
