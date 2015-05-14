From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: schedule_timeout sleeps too long after dividing CPU frequency
Date: Thu, 14 May 2015 07:43:28 +0530
Message-ID: <CAOh2x==aCLxCWX9K57hOFVEP1eLo_OYZPe0YvbFvpkXcoSp_hQ@mail.gmail.com>
References: <55520F0F.5010906@free.fr>
	<CAKohpo=eMA6L9=jK=bAnbFuDxcdtpQNub0WFnSy6MOqB3jOdjA@mail.gmail.com>
	<555218C7.5050602@free.fr>
	<20150512155004.GP2067@n2100.arm.linux.org.uk>
	<555380F8.5050306@free.fr>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=+jY15MNX0TTF8Nya2b7oihKNf4gh5eFea2xqLYN47lA=;
        b=W7fgGRWBeOIr5VrFfLLIe1vIx7tMxqEez4JEUrksI91ncnpsfosnoKqIvvsLQeB4ZP
         X2M9OKnCVMK9nPScl2h3mm3ZZyeF7Gdjtk0BDWfL9mFew5bOTMS5cwNmxqwxD4FGGdUc
         DWU+gCmXBw2ZT6UWXw7lcg+9Ij+spst5KlTabkQtCUHE5Y7ROhVmBz8SF+bmFNXiScwi
         f79fFuXpO3+TQepx9XG7ohlUEaQTB0fEI5+FV+X1G48lt4PYzQrLJUh4qi8cG9v1sjr/
         uwyMRYyy61Ej67X9GQ7utD2JbpJJt/nhHMm8CnqullV3a2pQ4F23Ow0AsfDrIMr/zZbB
         rkXQ==
In-Reply-To: <555380F8.5050306@free.fr>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mason <slash.tmp@free.fr>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mans Rullgard <mans@mansr.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>, cpufreq <cpufreq@vger.kernel.org>

On Wed, May 13, 2015 at 10:21 PM, Mason <slash.tmp@free.fr> wrote:
> $ git diff v3.14.41 HEAD >tango.patch && xz tango.patch
>
> I don't understand the IRQ-related part yet
> ( arch/arm/mach-tangox/irq.c and drivers/irqchip/irq-gic.c )
>
> If anyone spots the problem, that would make my day.
>
> I tested with a loadable module whose init function is
>
> static int __init ts_init(void)
> {
>         long res;
>         printk("ABOUT TO SLEEP\n");
>         set_current_state(TASK_INTERRUPTIBLE);
>         res = schedule_timeout(HZ);
>         printk("WAKE UP res=%ld\n", res);
>         return 0;
> }
>
> Loading the module, with cpufreq divided by 9, prints:
> [ 1738.962982] ABOUT TO SLEEP
> [ 1747.956191] WAKE UP res=0

I hope you are also matching this time with a physical watch,
to make sure 38->47 is really 9 seconds :)
