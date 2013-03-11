From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2] kirkwood: fix coccicheck warnings
Date: Mon, 11 Mar 2013 16:33:40 +0100
Message-ID: <513DF954.8020807@linaro.org>
References: <1363014842-11659-1-git-send-email-silviupopescu1990@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1363014842-11659-1-git-send-email-silviupopescu1990@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl, jason@lakedaemon.net, andrew@lunn.ch, len.brown@intel.com, rob.lee@linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/11/2013 04:14 PM, Silviu-Mihai Popescu wrote:
> Convert all uses of devm_request_and_ioremap() to the newly introduce=
d
> devm_ioremap_resource() which provides more consistent error handling=
=2E
>=20
> devm_ioremap_resource() provides its own error messages so all explic=
it
> error messages can be removed from the failure code paths.
>=20
> Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
> ---

Sounds good.

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>


>  drivers/cpufreq/kirkwood-cpufreq.c |    8 +++-----
>  drivers/cpuidle/cpuidle-kirkwood.c |    6 +++---
>  2 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kir=
kwood-cpufreq.c
> index 0e83e3c..6052476 100644
> --- a/drivers/cpufreq/kirkwood-cpufreq.c
> +++ b/drivers/cpufreq/kirkwood-cpufreq.c
> @@ -175,11 +175,9 @@ static int kirkwood_cpufreq_probe(struct platfor=
m_device *pdev)
>  		dev_err(&pdev->dev, "Cannot get memory resource\n");
>  		return -ENODEV;
>  	}
> -	priv.base =3D devm_request_and_ioremap(&pdev->dev, res);
> -	if (!priv.base) {
> -		dev_err(&pdev->dev, "Cannot ioremap\n");
> -		return -EADDRNOTAVAIL;
> -	}
> +	priv.base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv.base))
> +		return PTR_ERR(priv.base);
> =20
>  	np =3D of_find_node_by_path("/cpus/cpu@0");
>  	if (!np)
> diff --git a/drivers/cpuidle/cpuidle-kirkwood.c b/drivers/cpuidle/cpu=
idle-kirkwood.c
> index 670aa1e..53aad73 100644
> --- a/drivers/cpuidle/cpuidle-kirkwood.c
> +++ b/drivers/cpuidle/cpuidle-kirkwood.c
> @@ -66,9 +66,9 @@ static int kirkwood_cpuidle_probe(struct platform_d=
evice *pdev)
>  	if (res =3D=3D NULL)
>  		return -EINVAL;
> =20
> -	ddr_operation_base =3D devm_request_and_ioremap(&pdev->dev, res);
> -	if (!ddr_operation_base)
> -		return -EADDRNOTAVAIL;
> +	ddr_operation_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(ddr_operation_base))
> +		return PTR_ERR(ddr_operation_base);
> =20
>  	device =3D &per_cpu(kirkwood_cpuidle_device, smp_processor_id());
>  	device->state_count =3D KIRKWOOD_MAX_STATES;
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

