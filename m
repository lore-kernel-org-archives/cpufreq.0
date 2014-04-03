From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] arm64: Fix duplicated Kconfig entries again
Date: Thu, 3 Apr 2014 09:53:56 +0530
Message-ID: <CAOh2x=nHX0_2v0WtBAh6xLqmkk1SVQSpNZX54jirByDCwtoSXQ@mail.gmail.com>
References: <CA+5PVA6awqaSHQboqdv9nynV9Xjp46VeqijDWxZX1v5wDK0NWQ@mail.gmail.com>
	<CAKohpok3gKyOWD0=pSv0yQLNqJcNPNZagRGFXNFHW+3J7E=mOg@mail.gmail.com>
	<20140402144020.GA20438@zod>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=AWZ3qHL2ahNoxl06ocUy6Chha7JsIrK2YbwJgn2ybE0=;
        b=Mokca1LYN+mae++w1kv/XDbE0LmkROnj5T/DB0IOmAryXtLaVJAKeyrquFtMjSxu/D
         RyoUYEPnKv1LYytxucm3f+hk6XEAZBN9YqpfsPXXagd8eGUnFDdPSFNqcCnHMrChqxPQ
         YGnA6k4wdslCCjmLuF54ssmYtUeh0sLE+b5XNNAB7lrXa0Ucbv7+8dYaVUp3SUPROg2b
         YazjzI8j8Dw0xZmG62nD88qE1I6PgWr7tTnHxbWxsita936Q6mUXs5+JkO/cjJI2Ni4C
         OzV3DInL6ArCNKqwIgro/8vXVAtxxgHq9eiGr7xqI2Wqn/3iKLBQ5NqXg3r9v5jnTdCi
         tNNA==
In-Reply-To: <20140402144020.GA20438@zod>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Mark Brown <broonie@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On Wed, Apr 2, 2014 at 8:10 PM, Josh Boyer <jwboyer@fedoraproject.org> wrote:
> Commit 74397174989e5f70 attempted to clean up the power management options
> for arm64, but when things were merged it didn't fully take effect.  Fix
> it again.
>
> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
> ---
>  arch/arm64/Kconfig | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 07aa3556952c..8033b9b8a2df 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -321,12 +321,6 @@ menu "CPU Power Management"
>
>  source "drivers/cpuidle/Kconfig"
>
> -source "drivers/cpufreq/Kconfig"
> -
> -endmenu
> -
> -menu "Power management options"
> -
>  source "kernel/power/Kconfig"
>
>  source "drivers/cpufreq/Kconfig"

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
