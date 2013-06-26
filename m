From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 0/7] cpufreq:boost: CPU Boost mode support
Date: Wed, 26 Jun 2013 13:22:08 +0530
Message-ID: <CAOh2x=nts3VF11fWp4TNf8f5wLdWM1Eyooi+zdp+ZsQgTnF8eg@mail.gmail.com>
References: <1370502472-7249-1-git-send-email-l.majewski@samsung.com>
	<1371661969-7660-1-git-send-email-l.majewski@samsung.com>
	<20130626094811.1986e875@amdc308.digital.local>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=H8am4O8yRPJDzLmkRCYC90bRpCgsgEP8dvIhqaVHNuM=;
        b=B+KycWyvrGaxMfAsZngsuSYWthHJCNjue5evhB5ob/LrEffJsY1FXTFrGkUvf6it1g
         tGp5HlHlcfZWCr71x4dGqgd5i90UEx1InIzsdlJEyBp6oKBCDMM8eszO/mjSUAP0x5Nm
         VdGMXTKxjDNUIiWw7v51gup/3G6089ZH9QiFMtp0eFSFsseKr7Ymu9S26AySURmm+aAe
         y4SssFYy1BGv9diu/ckyD8k5SWaSSi480aU/kXME+kG1e8dVqZUTq7yh7L97kWdJhF+a
         RmPGwDrdc78ZYzwvR2YBUztutMEI9tI+lmiWFEf2ICPRm4RKfd+eUfjONtBfrnv0tzYs
         /VHA==
In-Reply-To: <20130626094811.1986e875@amdc308.digital.local>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: "Rafael J. Wysocky" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, Lukasz Majewski <l.majewski@majess.pl>, Andre Przywara <andre.przywara@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <eduardo.valentin@ti.com>

On Wed, Jun 26, 2013 at 1:18 PM, Lukasz Majewski <l.majewski@samsung.com> wrote:
> If this is not a problem, I'd like to kindly ask You to review those
> patches.
>
> Rafael has expressed his opinion about "boost" attribute clearly at the
> other mail (as a response to v4 patches):
> "Simple: Export it only when supported."
>
> Despite the change about the "boost" attribute visibility there were
> many other changes, which deserve maintainer's look.

I haven't got time to review it until now.. I will try to do it this week.
