From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: ux500: send cpufreq notification for all cpus
Date: Wed, 24 Aug 2011 16:56:04 +0900
Message-ID: <CAH9JG2Wd3Lv6670N6Nsg-AWjYGh4uZsabeqinTOGcpQ4nCKnYw@mail.gmail.com>
References: <1314168245-2373-1-git-send-email-vincent.guittot@linaro.org>
	<CACRpkdaONJ+Vdx4JCPfWoqavQahiSgVGv5i=h3+J1kE2V=Q8SA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=/eOcfeLW+SdH6GtD1JOu1O7HNTBtBmp/ZV/GB6Wa4P4=;
        b=CfOEJG0UUwZ6OFCdsAXYRYeWzzgjfJ9Lp1mE/brhA2c7bcRkibsWPizdQky33A6RQV
         RM/ov8yF0yBT2o2T1lwDibygXUe0NdEpLWnKmgyiKHykczV/ZzpPdzG9gK8Q+qpropNd
         mTs2SaMql4LmX5YTB6iptoIYIQhlm8iA2L3hs=
In-Reply-To: <CACRpkdaONJ+Vdx4JCPfWoqavQahiSgVGv5i=h3+J1kE2V=Q8SA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, patches@linaro.org

On Wed, Aug 24, 2011 at 4:42 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Aug 24, 2011 at 8:44 AM, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
>
>> The same clock is used for all cpus so we must notify the frequency change
>> for each one in order to update the configuration of all twd clockevents.

BTW, does it same as other ARM cpus?. e.g., exynos4 has same codes as this.

How to you think it? Need to modify the same way?

Thank you,
Kyungmin Park
>>
>> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
