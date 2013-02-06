From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: ondemand: Replace down_differential tuner with adj_up_threshold
Date: Wed, 6 Feb 2013 11:05:45 +0530
Message-ID: <CAOh2x=ksAibntsfGm51r+JiQOAhHYYmHF1o=_H97fSKqGcq_mQ@mail.gmail.com>
References: <511173DF.8060308@semaphore.gr>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Nm85yAJOSRzgfGXdEPqQLaWJ49E2oZItpJDbI6tWdUc=;
        b=aCTBXJpXDxaOUY2ckQtZqy2+7vQjHif16HuFstSwGFhlfxUmRCAAdALC9LQw5wFZuG
         FC+QyW13PCF48k6bjDXYYTAc2KmxUAgRrSIwLyXSHzlM6xeq2njkYKGaf/nKxhDGveuQ
         kQHvgrunblg7g/ndnVADIfwUvzkB+FvUv1a14Apk4KnQrQQsDljJP90Q+6ktoldNdAuz
         dQru+ANfc+mw3SZd2Q7+gO0IAcLWeE3OsMDbsUdQf35ER/VDJxrJMt930Mjy6ddSmlRr
         k78Ye6vT8D5stykbPKDYmJig6N2wOYC6ZYPh7xWWXZztr8XqJF+ml3pGBVIICKb67eCr
         XePg==
In-Reply-To: <511173DF.8060308@semaphore.gr>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stratos Karafotis <stratosk@semaphore.gr>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 6, 2013 at 2:34 AM, Stratos Karafotis <stratosk@semaphore.gr> wrote:
> In order to avoid the calculation of up_threshold - down_differential
> every time that the frequency must be decreased, we replace the
> down_differential tuner with the adj_up_threshold which keeps the
> difference across multiple checks.
>
> Update the adj_up_threshold only when the up_theshold is also updated.
>
> Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
> ---
>  drivers/cpufreq/cpufreq_governor.h |  2 +-
>  drivers/cpufreq/cpufreq_ondemand.c | 16 ++++++++++------
>  2 files changed, 11 insertions(+), 7 deletions(-)

Makes sense.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
