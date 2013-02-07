From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Thu, 7 Feb 2013 16:12:42 +0530
Message-ID: <CAOh2x==-u_AuyG34t0cg6BURsj3rU4rwSgZaSbX4ULU7ztdxMg@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=YRyBbMB78BRcpOmP3MNXA1LvKHLH9FhYhDh3lx4vpTU=;
        b=JDy/DMoBziosB/tMeOwINfy10X9guCoMW5OeWBGnaK4qtOl8AbsOipDXQTPyfHGi7d
         RAW/V7vd1wtl4yE+c+ki/n27Z/JeFQ3QAeewm1f4VEdD8fh4qGPq2YVSl9Is3uhCHbPq
         lIWwWbgdgD2syvxO/7vQMNE6UTXJRETYXM7CwMnE2M1OKjYwbUpwlKaY5Nma91ySNLC2
         5sV6wVkhJDTjOPN3w/T+KoaVkejFnQIl3zhDV8Q9vAmkEBmcCdiYFmwSR6li6dvi0Bee
         50sOPGlHn5XMNljZpN66efDlmr34wHB80WaDWFiaHPwKwhRxiKDR3208DiSeKFKZw9+Z
         iBkg==
In-Reply-To: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>

On Wed, Feb 6, 2013 at 10:32 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> This driver implements a scaling driver with an internal governor for
> Intel Core processors.  The driver follows the same model as the
> Transmeta scaling driver (longrun.c) and implements the setpolicy()
> instead of target().  Scaling drivers that implement setpolicy() are
> assmuned to implement internal governors by the cpufreq core. All the
> logic for selecting the current P state is contained within the driver
> no external governor is used by the cpufreq core.

Hi Dirk,

All look good now :)
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

@Rafael: I wasn't sure if these would apply over my patches without any
conflicts and so i applied them in my repo. Added my Acked-by's and fixed
a minor thing in one of the patches (as mentioned in the other mail).

You can pick these from: dirk-patches

http://git.linaro.org/gitweb?p=people/vireshk/linux.git;a=shortlog;h=refs/heads/dirk-patches
