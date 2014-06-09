From: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Subject: Re: [PATCH 2/2] e_powersaver: Require setting a module parameter
 to enable it
Date: Mon, 09 Jun 2014 19:15:22 +0100
Message-ID: <5395F9BA.40703@interia.pl>
References: <1402269741.23860.50.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1402269741.23860.50.camel@deadeye.wl.decadent.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
	s=biztos; t=1402337725;
	bh=o4eQid0WNvPCeFLjeA9Y5pB6Bh1kdCy+dOP0Jx5D6RQ=;
	h=Received:Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	 CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Interia-Antivirus;
	b=YhkrRJsqp+BdyOgwx26rx76lkKvuWRENoZq4snW5kNMkiedHuq7qdF7x59vRbEu5B
	 86Lb/LgrLRtDFHXoMZai33fdTz8tlqf5Xu/75r0+KsHCDXbtOufMF8tGzEjVhcJPwf
	 w6lWkyHBYdIJXWOp6CJW5MC8O348zFKaSFhgmbzY=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ben Hutchings <ben@decadent.org.uk>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>


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
>   drivers/cpufreq/e_powersaver.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_power=
saver.c
> index a0d2a42..880be39 100644
> --- a/drivers/cpufreq/e_powersaver.c
> +++ b/drivers/cpufreq/e_powersaver.c
> @@ -45,6 +45,7 @@ static struct eps_cpu_data *eps_cpu[NR_CPUS];
>   static int freq_failsafe_off;
>   static int voltage_failsafe_off;
>   static int set_max_voltage;
> +static int enable;
>  =20
>   #if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_=
MODULE
>   static int ignore_acpi_limit;
> @@ -410,6 +411,10 @@ static int __init eps_init(void)
>   {
>   	if (!x86_match_cpu(eps_cpu_id) || boot_cpu_data.x86_model < 10)
>   		return -ENODEV;
> +	if (!enable) {
> +		printk(KERN_ERR "eps: Option \"enable\" not set. Aborting.\n");
> +		return -ENODEV;
> +	}
>   	if (cpufreq_register_driver(&eps_driver))
>   		return -EINVAL;
>   	return 0;
> @@ -432,6 +437,10 @@ MODULE_PARM_DESC(ignore_acpi_limit, "Don't check=
 ACPI's processor speed limit");
>   #endif
>   module_param(set_max_voltage, int, 0644);
>   MODULE_PARM_DESC(set_max_voltage, "Set maximum CPU voltage (mV) C7-=
M only");
> +/* By default driver is disabled to prevent incompatible
> + * system freeze. */
> +module_param(enable, int, 0644);
> +MODULE_PARM_DESC(enable, "Enable driver");
>  =20
>   MODULE_AUTHOR("Rafal Bilski <rafalbilski@interia.pl>");
>   MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");
>
Actually that's quite good solution for conflict between ACPI P-states =
driver and this
driver. In this way ACPI will always be loaded first unless user will c=
hoose otherwise.
I would like to point out that this text and one in Kconfig is a bit in=
correct. Processor
won't allow any frequency outside it's limits by design. Processor may =
get overheated
if system isn't designed for CPU to run at full frequency and BIOS sets=
 limits by means
of P-states tables. Otherwise only difference is ACPI P-states driver s=
eems to be using
SMI to change frequency while e_powersaver uses MSRs.

Rafa=C5=82 Bilski
