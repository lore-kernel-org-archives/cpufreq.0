From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [BUG 3.12.rc4] Oops: unable to handle kernel paging request
 during shutdown
Date: Fri, 25 Oct 2013 15:30:33 +0530
Message-ID: <CAKohpokrmKV02PaDRUT7pxL=S1E4k_5QtDGBJd=QsrqcDS1+fg@mail.gmail.com>
References: <525BD08C.2080101@t-online.de>
	<2582195.phiuskXt0x@vostro.rjw.lan>
	<1483174.NsuFf8aJk6@vostro.rjw.lan>
	<3005031.0yf0g1BPEE@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <3005031.0yf0g1BPEE@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Knut Petersen <Knut_Petersen@t-online.de>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, =?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

On 25 October 2013 15:40, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> And in my opinion acpi_cpufreq_init() should just return an error code if it
> can't register the driver, like in the (untested) patch below.
>
> Rafael
>
>
> ---
>  drivers/cpufreq/acpi-cpufreq.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Index: linux-pm/drivers/cpufreq/acpi-cpufreq.c
> ===================================================================
> --- linux-pm.orig/drivers/cpufreq/acpi-cpufreq.c
> +++ linux-pm/drivers/cpufreq/acpi-cpufreq.c
> @@ -988,10 +988,10 @@ static int __init acpi_cpufreq_init(void
>
>         /* don't keep reloading if cpufreq_driver exists */
>         if (cpufreq_get_current_driver())
> -               return 0;
> +               return -EEXIST;
>
>         if (acpi_disabled)
> -               return 0;
> +               return -ENODEV;
>
>         pr_debug("acpi_cpufreq_init\n");

Much better.. And probably the first return has caused the bug
Linus faced..

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
