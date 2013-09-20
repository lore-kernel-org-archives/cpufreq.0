From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH -v2] cpufreq: skip loading acpi_cpufreq after intel_pstate
Date: Fri, 20 Sep 2013 12:51:08 -0700
Message-ID: <CAE9FiQWQt_NUTE5NOCGAHTr+1VzgjWp+cFwaOH8nJZ7=fE2dbQ@mail.gmail.com>
References: <1379699036-7380-1-git-send-email-yinghai@kernel.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=Ef9pYJK7mIt2yXTE9WCVdKWTpKE65mm2PuBDC4mHRac=;
        b=GT/B0NHD4uFERzezDo4it37c1SwG52sp+SlP+pOsONjNSVjnd4xXDIwLwulZxCHB84
         RzWgj0qvJ5irDTROXBeHzztlmuUywOyM531R/sMNX5LpJI2IBTUb+CpaODOcgy07ZZq7
         KCLtDnncN0PA4dFmn4IuHUY9y46XrAszo3zsq6G3Vo1oi2sXrju7rXGp+aqtA6Vujt9o
         +Gbyel9T9x+9dLW2yE4nReUQzk6kzejgPlR1d/FeRvuRk6UYdD8LZU2mOsla5TCrr1Tr
         GlCwlmS4qVAVn7Y6+03mkAt6jALSj7lbME98MDzwb3lDneDrJOcDMVis25VCL4paVDKr
         wwog==
In-Reply-To: <1379699036-7380-1-git-send-email-yinghai@kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yinghai Lu <yinghai@kernel.org>

On Fri, Sep 20, 2013 at 10:43 AM, Yinghai Lu <yinghai@kernel.org> wrote:
> If the hw support intel_pstate and acpi_cpufreq, intel_pstate will
> get loaded first.
>
> acpi_cpufreq_init will call acpi_cpufreq_early_init()
> and that will allocate perf data and init those perf data in ACPI core,
> (that will cover all cpus). But later it will free them as
> cpufreq_register_driver(acpi_cpufreq) will fail as init_pstate is
> already registered
>
> Use cpufreq_get_current_driver() to check if we can skip the
> acpi_cpufreq loading.
>
> -v2: update changelog and separate second part to another patch, according
>      to Viresh.
>
> Signed-off-by: Yinghai Lu <yinghai@kernel.org>
>
> ---
>  drivers/cpufreq/acpi-cpufreq.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> Index: linux-2.6/drivers/cpufreq/acpi-cpufreq.c
> ===================================================================
> --- linux-2.6.orig/drivers/cpufreq/acpi-cpufreq.c
> +++ linux-2.6/drivers/cpufreq/acpi-cpufreq.c
> @@ -986,6 +986,10 @@ static int __init acpi_cpufreq_init(void
>  {
>         int ret;
>
> +       /* don't keep reloading if cpufreq_driver exists */
> +       if (cpufreq_get_current_driver())
> +               return 0;
> +
>         if (acpi_disabled)
>                 return 0;
>

only this one is needed, other one

cpufreq: fix racing between acpi_cpufreq_loading

is not needed.

Thanks

Yinghai
