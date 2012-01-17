From: Andrey Gusakov <dron0gus@gmail.com>
Subject: Re: [PATCH] cpufreq: Add S3C2416/S3C2450 cpufreq driver
Date: Tue, 17 Jan 2012 10:40:06 +0300
Message-ID: <CAA11ShAr4_Lqdb0H1jJp4kF=Y2QaAoxaQhVWLi1rm9666EMNcg@mail.gmail.com>
References: <201201142209.58453.heiko@sntech.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=p+KJfmnzSMUZSxEQ0iUMGjZWpudVE1jz+EmzAKjTYps=;
        b=bK0H7u4K47ZfxGvIoPA/ntYGpHBnAU8TgtCF+YjTZLlLM+AGak9IgkyoUlwWGLWsiG
         KBLAN8FvY4+UHC/Sfb4lGw/vslUAT4yXNZ9KQaNVbDfngFcUM5gfCcOoU4abD0Q/J/Jr
         zTZCTz/OyZMDKJ3XVz1PzE9e57AQftH/e7si4=
In-Reply-To: <201201142209.58453.heiko@sntech.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Dave Jones <davej@redhat.com>, Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi

Tested-by: Andrey Gusakov <dron0gus@gmail.com>

Tested on custom S3C2416 hardware.
Boot tested. Freq scalling tested. Core voltage scalling (1.3V and
1.05 V) tested.
