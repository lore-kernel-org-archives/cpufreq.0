From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] longhaul: Mark it as dangerous in Kconfig
Date: Mon, 9 Jun 2014 10:11:51 +0530
Message-ID: <CAKohpo=qfCC=kBSbHKPHaapMTpwh8b3no0vvU1FgO-deWSPi+w@mail.gmail.com>
References: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Dave Jones <davej@redhat.com>, =?UTF-8?Q?Rafa=C5=82_Bilski?= <rafalbilski@interia.pl>

On 9 June 2014 04:50, Ben Hutchings <ben@decadent.org.uk> wrote:
> longhaul quickly caused hard lockups and possibly killed the memory
> module on my EPIA-PD board.  It is commented as:
>
> 'BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*'
>
> Let's put another warning where people are more likely to see it.
>
> References: https://bugs.debian.org/707047
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  drivers/cpufreq/Kconfig.x86 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
> index d369349..a3877c6 100644
> --- a/drivers/cpufreq/Kconfig.x86
> +++ b/drivers/cpufreq/Kconfig.x86
> @@ -247,12 +247,13 @@ config X86_LONGRUN
>           If in doubt, say N.
>
>  config X86_LONGHAUL
> -       tristate "VIA Cyrix III Longhaul"
> +       tristate "VIA Cyrix III Longhaul (DANGEROUS)"
>         depends on X86_32 && ACPI_PROCESSOR
>         help
>           This adds the CPUFreq driver for VIA Samuel/CyrixIII,
>           VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T
> -         processors.
> +         processors.  It does not work with all motherboards and may
> +         cause hardware damage.
>
>           For details, take a look at <file:Documentation/cpu-freq/>.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
