From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] Cpufreq: Fix incorrect dependecies for ARM SA11xx drivers
Date: Sun, 12 May 2013 20:34:56 +0530
Message-ID: <CAOh2x=mL-_fm8pxUCJCM1MWQxca2ygJWpDS_OTnOfcLS4ZHC1g@mail.gmail.com>
References: <1367756288-13422-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=sat07eia19l4DyiVLYbWQsBaKC2O57FBP4hsl5dZjEs=;
        b=PllT5AGXntd+3ler4svqUnYdHqQm+FURe0bNxMpRXUX0ycshkcPCxMYnfAif1DUptV
         ZtO+FFECAysr304T7gVmrBDm6o1X2TqzX7uBsPYW29gjjOTvVc0EUml+1c5/oi7O6b8W
         pyx3bRVjsb5o1WCtU95lw97qcO8t12/fY2jzaer1CIQYzibtknt00nvEq4nkj8tA5vxp
         jVOt1YYTPUMFGWcJfSrY/Ixo7dTxlzHSpx+vBvqqArmxbZnA70f03JuUxfcpMzCfsEFA
         OYDGrnhoOqbjPHK+kZrECDRKEFaGq4kwVf6FsGIvfc0lK0KVNLCVOnCC15kGKclWm+n+
         zkqA==
In-Reply-To: <1367756288-13422-1-git-send-email-shc_work@mail.ru>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org

On Sun, May 5, 2013 at 5:48 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/cpufreq/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index a1488f5..534fcb8 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -47,7 +47,7 @@ config CPU_FREQ_STAT_DETAILS
>
>  choice
>         prompt "Default CPUFreq governor"
> -       default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
> +       default CPU_FREQ_DEFAULT_GOV_USERSPACE if ARM_SA1100_CPUFREQ || ARM_SA1110_CPUFREQ
>         default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
>         help
>           This option sets which CPUFreq governor shall be loaded at

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
