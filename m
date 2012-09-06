From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] cpufreq: OMAP: remove redundant loops_per_jiffy code
Date: Thu, 6 Sep 2012 13:02:45 +0530
Message-ID: <CAMQu2gwcBNNAPs12GqZb6rteW3AzcAxQEv51YJb+rPjuCv-QEg@mail.gmail.com>
References: <1346915424-25868-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1346915424-25868-1-git-send-email-shawn.guo@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@ti.com>

Shawn,

On Thu, Sep 6, 2012 at 12:40 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> With ARM smp common code updating loops_per_jiffy in a cpufreq
> transiton notifier call, the loops_per_jiffy code in omap-cpufreq
> driver becomes redundant.  Remove it.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Kevin Hilman <khilman@ti.com>
> ---
I have acked this patch when Richard Zhao posted
it earlier [1]. Seems to be the same patch so ack applies
here as well.

Regards
Santosh

[1] http://www.spinics.net/lists/cpufreq/msg02992.html
