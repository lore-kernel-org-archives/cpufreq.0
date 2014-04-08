From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/1] cpufreq: ppc: Remove duplicate inclusion of fsl_soc.h
Date: Tue, 8 Apr 2014 10:38:49 +0530
Message-ID: <CAOh2x==GArYBWdLN2ZMeTABGqu0Ag8A-+gcuaJ1bzhY92HtH7g@mail.gmail.com>
References: <1396933078-11438-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=8MahYCcD+xD54OQCRFx/bM8MoqcCz5iLvcyFQo5BH4s=;
        b=oCXupZilSZfSFb5JTloka8Wc8EazQybGQba91aS2BnVum9IjuIH8GW/KelbDW0VJHu
         ZdWhpWicBQrexI/kAuE/kPlmawEYbnb2G6E2i4EEfm7Ae4rIlOsb0bGDdOY5Ci8TE+4T
         SU/3Re5lalNbs6TOXDaXXxuD8wjmdR5gSuBZUgCHDkNqqbVkqLpXMiKlr/VquE3yLl/e
         Qf7sxjzEWhr2Sz7eCeYdjQPhS2BjId8DNWvbmvmS8DgpaOb7+UB5FWrB4cnKJTZ62TmB
         aZxurkfHiHQFJLV1Hq7hA83Zh7bmYyw+CHIIBHw+SBf5XxwtLxj+MDixSddun1XXUVKK
         GKeg==
In-Reply-To: <1396933078-11438-1-git-send-email-sachin.kamat@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Tue, Apr 8, 2014 at 10:27 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> fsl_soc.h was included twice.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/cpufreq/ppc-corenet-cpufreq.c |    1 -
>  1 file changed, 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
