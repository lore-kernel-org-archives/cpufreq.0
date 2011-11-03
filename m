From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/5] [CPUFREQ] EXYNOS4210: Remove code about bus on cpufreq
Date: Thu, 3 Nov 2011 14:40:21 +0900
Message-ID: <CAJ0PZbSy+wQRb63_sAEWvXzagFUDLJ_bOUuywMDQENg6LzNb7g@mail.gmail.com>
References: <005401cc995c$ee9e3b50$cbdab1f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=my/kb1pS7tZR4+9Aiu2Y8T6Z0CIb/QddXjEcOqgLhR8=;
        b=lJOJ/e86X/sPBPfmMXHWde1+CBCA5kX/p5wxy51QfovyBJfKMmrnHUmVsmjKgA0/95
         ZXmVQssarZl5c3gFmS1z8+mN2112FmTbMQk+G6sa59dj/cL5lYv03IbiuvoYI6jKeItF
         N/eguLZj2JoUfpCVURg073Y9FeHfqt3u/na+M=
In-Reply-To: <005401cc995c$ee9e3b50$cbdab1f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, Jongpill Lee <boyko.lee@samsung.com>, SangWook Ju <sw.ju@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>

On Wed, Nov 2, 2011 at 9:42 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Jongpill Lee <boyko.lee@samsung.com>
>
> This patch removes code for bus on cpufreq because the code
> for bus frequency changing moves to busfreq driver.
> So code about bus on cpufreq is not necessary.
>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: SangWook Ju <sw.ju@samsung.com>
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0drivers/cpufreq/exynos4210-cpufreq.c | =A0174
> +---------------------------------
> =A01 files changed, 1 insertions(+), 173 deletions(-)
>

Cool!

Now, it's compatible with the Exynos4210 bus devfreq driver.
Are you going to upstream the busfreq in the devfreq framework (at
/drivers/devfreq/) or do you want me to submit the Exynos4210 bus
devfreq driver that is currently on
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/h=
eads/devfreq
(drivers/devfreq/exynos4210_memorybus.c)

Devfreq is a framework to support DVFS feature for non-CPU devices,
which is at 3.2-next tree.


Cheers!
MyungJoo

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
