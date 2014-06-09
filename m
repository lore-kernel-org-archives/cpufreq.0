From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] e_powersaver: Require setting a module parameter to
 enable it
Date: Mon, 9 Jun 2014 10:13:18 +0530
Message-ID: <CAKohpo=K+RXn8Nom8uMeUxh30eXTCYOUmAzYtYiBsC6S9q6-Vw@mail.gmail.com>
References: <1402269741.23860.50.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1402269741.23860.50.camel@deadeye.wl.decadent.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ben Hutchings <ben@decadent.org.uk>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Dave Jones <davej@redhat.com>, =?UTF-8?Q?Rafa=C5=82_Bilski?= <rafalbilski@interia.pl>

On 9 June 2014 04:52, Ben Hutchings <ben@decadent.org.uk> wrote:
> The Kconfig text and comment at the top of the file say this is
> DANGEROUS.  According to Rafa=C5=82 Bilski it is not so bad as it use=
d to
> be, but he still didn't think it should be auto-loaded.
>
> Rafa=C5=82 already made a similar change to longhaul.
>
> References: http://www.spinics.net/lists/cpufreq/msg02919.html
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  drivers/cpufreq/e_powersaver.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_power=
saver.c
> index a0d2a42..880be39 100644
> --- a/drivers/cpufreq/e_powersaver.c
> +++ b/drivers/cpufreq/e_powersaver.c
> @@ -45,6 +45,7 @@ static struct eps_cpu_data *eps_cpu[NR_CPUS];
>  static int freq_failsafe_off;
>  static int voltage_failsafe_off;
>  static int set_max_voltage;
> +static int enable;
>
>  #if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_M=
ODULE
>  static int ignore_acpi_limit;
> @@ -410,6 +411,10 @@ static int __init eps_init(void)
>  {
>         if (!x86_match_cpu(eps_cpu_id) || boot_cpu_data.x86_model < 1=
0)
>                 return -ENODEV;
> +       if (!enable) {
> +               printk(KERN_ERR "eps: Option \"enable\" not set. Abor=
ting.\n");
> +               return -ENODEV;
> +       }
>         if (cpufreq_register_driver(&eps_driver))
>                 return -EINVAL;
>         return 0;
> @@ -432,6 +437,10 @@ MODULE_PARM_DESC(ignore_acpi_limit, "Don't check=
 ACPI's processor speed limit");
>  #endif
>  module_param(set_max_voltage, int, 0644);
>  MODULE_PARM_DESC(set_max_voltage, "Set maximum CPU voltage (mV) C7-M=
 only");
> +/* By default driver is disabled to prevent incompatible
> + * system freeze. */

This could have been written with proper style mentioned in CodingGuide=
lines

> +module_param(enable, int, 0644);
> +MODULE_PARM_DESC(enable, "Enable driver");
>
>  MODULE_AUTHOR("Rafal Bilski <rafalbilski@interia.pl>");
>  MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
