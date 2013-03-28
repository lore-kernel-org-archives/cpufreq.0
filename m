From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: use the exact frequency for clk_set_rate()
Date: Thu, 28 Mar 2013 12:41:40 +0530
Message-ID: <CAOh2x=nnafMWKFqsi+6JUA38nKT-x4dZ0fimfiKS12vhK5tHmg@mail.gmail.com>
References: <Pine.LNX.4.64.1302251820431.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=yd73MoZdyWrK9LPOfK2rjwq5yRHXO8dl43oTu+JTEIU=;
        b=PGwtfIAoUV9yKH9igLDqzlJOlNoPAoOSVSi5Bq/Tn1JhKT6LEWmxgnDP7bwkfovb7Q
         BnbhSEkaLBhwZDWNCIhzvmh+HEFiNLHtuHSuHD+La+Z3Bxn9rWv/18jCFDqqRH5fc4v2
         pjaio4svwRf5d0vz1PrDwCEsy3sSN5bvcDeTULKSpgaqTNe+6SgO+If7LEiR9keAfQeO
         WgMZ9+vuBb3BklKM2eqEyzMt7ESKue5nl0f0L45eiGPqHMMkdHJevxmE6dUCyG6h/JeG
         DjHmEQwv94aul8kzthCG5JMXpSjIDteyjI7ayWVzD3yZxtupCMxg7rbbUCbJgRIbYwDg
         rrsA==
In-Reply-To: <Pine.LNX.4.64.1302251820431.3030@axis700.grange>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 25, 2013 at 10:52 PM, Guennadi Liakhovetski
<g.liakhovetski@gmx.de> wrote:
> clk_set_rate() isn't supposed to accept approximate frequencies, instead
> a supported frequency should be obtained from clk_round_rate() and then
> used to set the clock.
>
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> ---
>
> Applies on top of my previous patch to fix unsigned freq_Hz "cpufreq: fix
> sign check of an unsigned variable in cpufreq-cpu0"
>
>  drivers/cpufreq/cpufreq-cpu0.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
